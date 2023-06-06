resource "aws_kms_key" "terraform-KMS" {
  description             = "KMS key 1 using terraform"
  deletion_window_in_days = 10
  tags = {
    Name = "terraform-KMS"
  } 
}

resource "aws_kms_alias" "a" {
  name          = "alias/my-terraform-key-alias"
  target_key_id = aws_kms_key.terraform-KMS.id
}

output "kms-arn" {
  value = aws_kms_key.terraform-KMS.arn

}