# provider "kubernetes" {
#   config_path    = "~/.kube/config"
# }

# provider "helm" {
#   kubernetes {
#     config_path    = "~/.kube/config"
#   }
# }

# resource "kubernetes_storage_class" "terraform-eks" {
#   metadata {
#     name = "terraform-eks"
#   }
#   storage_provisioner = "kubernetes.io/gce-pd"
#   reclaim_policy      = "Retain"
#   parameters = {
#     type = "pd-standard"
#   }
# #   volume_binding_mode = "WaitForFirstConsumer"
#   mount_options = ["file_mode=0700", "dir_mode=0777", "mfsymlinks", "uid=1000", "gid=1000", "nobrl", "cache=none"]

#   depends_on = [
#     aws_eks_cluster.EKS
#   ]
# }