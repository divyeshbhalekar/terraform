/* provider "kubernetes" {
  config_path = "~/.kube/config"
}

# # provider "helm" {
# #   kubernetes {
# #     config_path = "~/.kube/config"
# #   }
# # }


resource "aws_efs_file_system" "terraform-efs" {
  creation_token = "my-product"

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
  encrypted = true

  kms_key_id = aws_kms_key.terraform-KMS.arn

  tags = {
    Name = "Terraform-iaas"
  }
  depends_on = [
    aws_eks_cluster.EKS,
    aws_security_group.efs,
    aws_kms_key.terraform-KMS
  ]
}

# # Create a Kubernetes StorageClass that uses the Amazon EFS file system as its provisioner
resource "kubernetes_storage_class" "efs_storage_class" {
  depends_on = [
    aws_eks_cluster.EKS,
    aws_efs_file_system.terraform-efs
  ]
  metadata {
    name = "efs"
  }

  storage_provisioner = "efs.csi.aws.com"

  parameters = {
    "fileSystemId" = aws_efs_file_system.terraform-efs.id
  }
}

# # Create a Kubernetes PersistentVolumeClaim that requests storage from the StorageClass we created above
# resource "kubernetes_persistent_volume_claim" "efs_pvc" {
#   depends_on = [
#     kubernetes_storage_class.efs_storage_class
#   ]
#   metadata {
#     name = "efs-pvc"
#   }

#   spec {
#     access_modes = ["ReadWriteMany"]
#     resources {
#       requests = {
#         storage = "5Gi"
#       }
#     }

#     storage_class_name = kubernetes_storage_class.efs_storage_class.metadata[0].name
#   }

# }

# # Mount the PersistentVolumeClaim to your Kubernetes deployment or pod
# resource "kubernetes_deployment" "example" {
#   metadata {
#     name = "example"
#   }

#   spec {
#     replicas = 1

#     selector {
#       match_labels = {
#         app = "example"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "example"
#         }
#       }

#       spec {
#         volume {
#           name = "efs-pvc"

#           persistent_volume_claim {
#             claim_name = kubernetes_persistent_volume_claim.efs_pvc.metadata[0].name
#           }
#         }

#         container {
#           name  = "example"
#           image = "nginx"

#           volume_mount {
#             name       = "efs-pvc"
#             mount_path = "/mnt/efs"
#           }

#           # Add additional container configuration as needed
#         }
#       }
#     }
#   }
# } */
