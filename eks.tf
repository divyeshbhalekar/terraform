resource "aws_iam_role" "eks-cluster" {
  name = "eks-cluster-demo"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# iam policy creation (this steps creates the policy & attach to the above role)

resource "aws_iam_role_policy_attachment" "amazon_eks_cluster_policy" {
  role       = aws_iam_role.eks-cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

}

# EkS Cluster creation 

resource "aws_eks_cluster" "EKS" {
  name     = "EKS-terraform"
  role_arn = aws_iam_role.eks-cluster.arn

  vpc_config {

    # Indicate Whether or not the Amazon EKS Private API Server endpoint is enabled
    endpoint_private_access = false

    # Indicate Whether or not the Amazon EKS PUBLIC API Server endpoint is enabled
    endpoint_public_access = true

    subnet_ids = [
      aws_subnet.private_ap_south_1a.id,
      aws_subnet.private_ap_south_1b.id,
      aws_subnet.public_ap_south_1a.id,
      aws_subnet.public_ap_south_1b.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy,
    # aws_iam_role_policy_attachment.amazon_eks_cluster_policy.AmazonEKSClusterPolicy,
    # module.cert_manager

  ]
  provisioner "local-exec" {
    command = "aws eks --region ap-south-1 update-kubeconfig --name ${aws_eks_cluster.EKS.name} --profile terraform"
  }
}

