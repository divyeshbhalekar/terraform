resource "aws_iam_role" "node_general" {
  name = "eks-node-group-general"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "nodes_amazon_eks_worker_node_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node_general.name
}

resource "aws_iam_role_policy_attachment" "nodes_amazon_eks_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node_general.name
}

resource "aws_iam_role_policy_attachment" "nodes_amazon_ec2_container_registry_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node_general.name
}

# NEW step create an instance group 

resource "aws_eks_node_group" "node_general" {
  cluster_name    = aws_eks_cluster.EKS.name
  node_group_name = "node_general"
  node_role_arn   = aws_iam_role.node_general.arn
  subnet_ids = [
    aws_subnet.private_ap_south_1a.id,
    aws_subnet.private_ap_south_1b.id
  ]

  scaling_config {

    # Desired no of Worker Nodes.
    desired_size = 1

    # Maximum no of Worker Nodes.
    max_size = 2

    # Minimum no of Worker Nodes.
    min_size = 1
  }

  # Type oF Amzon image asso with the eks node grp
  ami_type = "AL2_x86_64"

  capacity_type = "ON_DEMAND"

  # Disk size for woeker node
  disk_size = 20

  force_update_version = false

  # List of instances type assoceiated with the eks node group
  instance_types = ["t2.small"]

  # instance_profile_name = aws_iam_instance_profile.nodegroup_profile.name

  labels = {
    role = "nodes-general"
  }
  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.nodes_amazon_eks_worker_node_policy,
    aws_iam_role_policy_attachment.nodes_amazon_eks_cni_policy,
    aws_iam_role_policy_attachment.nodes_amazon_ec2_container_registry_read_only,
  ]
}