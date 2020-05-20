provider "aws" { 
   region = "us-east-1" 
   shared_credentials_file = "~/.aws/credentials" 
   profile = "clayton.neves" 
} 
 
resource "aws_instance" "example" { 
   ami = "ami-0323c3dd2da7fb37d" 
   instance_type = "t2.micro"
   user_data = "${file("install.sh")}"
   key_name = "${aws_key_pair.my-key.key_name}" 
   security_groups = ["${aws_security_group.allow_ssh_http.name}"] 
} 

resource "aws_key_pair" "my-key" { 
   key_name = "my-key" 
   public_key = "paste the content of your id_rsa.pub" 
} 
 
resource "aws_security_group" "allow_ssh_http" { 
   name = "allow_ssh_http" 
   ingress { 
      from_port = 22 
      to_port = 22 
      protocol = "tcp" 
      cidr_blocks = ["0.0.0.0/0"] 
   }
   ingress { 
      from_port = 80 
      to_port = 80 
      protocol = "tcp" 
      cidr_blocks = ["0.0.0.0/0"] 
   } 
   egress { 
     from_port = 0 
     to_port = 0 
     protocol = -1 
     cidr_blocks = ["0.0.0.0/0"] 
   } 
} 
 
output "example_public_dns" { 
   value = "${aws_instance.example.public_dns}" 
 
} 