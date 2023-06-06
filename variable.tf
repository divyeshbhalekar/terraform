# variable "eks_cluster" {
#   description = "AWS EKS cluster resource"
# }

# resource "argocd_app" "this" {
#   # ... other arguments ...

#   depends_on = [var.eks_cluster] # Use the input variable in depends_on
# }