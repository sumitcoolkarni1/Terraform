/*provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAWGG64QDPBP4VFE4M"
  secret_key = "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"
}

resource "aws_instance" "Terraform" {
    ami = "ami-0376ec8eacdf70aae"
    instance_type = "t2.micro"
}

output "IP" {
    value = aws_instance.Terraform.public_ip 
}
*/
