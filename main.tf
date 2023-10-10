# configure provider 
provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
  #profile = "Admin"
}


# Define the existing VPC by its ID
data "aws_vpc" "deployment4-vpc" {
  id = "vpc-0b5aac0095e5ce4ae" #Replace with your VPC ID
}



#create instance
resource "aws_instance" "dep4tf" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.medium"
  key_name               = "SameenKhan822key"
  subnet_id              = "subnet-07a9417324668058c"
  associate_public_ip_address = true #Make sure  a public IP is assigned
  security_groups = ["sg-0c57293f30daddcea"]
  tags = {
    "Name" : "Deployment_4_tf"
  }
}

output "instanced_ip" {
  value = aws_instance.dep4tf.public_ip
}
