# Provisioning webservers in AWS with Terraform
We will create one single instance EC2 in AWS using terraform.

After the creation we will install apache and a html file with Loren Ipsum in the virtual machine, using a script.

# Launch the virtual machine
We need only Terraform.

# Create the AWS credentials file
Create the AWS credentials file with your access and secret key. We will use that in the tf file.

```
$ export AWS_ACCESS_KEY_ID="your access key id" 
$ export AWS_SECRET_ACCESS_KEY="your aws secret access key" 
$ mkdir ~/.aws/
$ vim ~/.aws/credentials 
[clayton.neves] 
aws_access_key_id = $AWS_ACCESS_KEY_ID 
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY 
```

# Terraform file
Create the terraform file "Instance_AWS.tf" with the provided values.

The file will create one ec2 instance, with the security group and the assigned key.

It will open traffic to por 80 (http) and 22 (ssh) and will provide the public ip in the end.

It will install and enable httpd too, and create a index.html file.

# Plan
Run the terraform init  to initialize Terraform and download the AWS provider plugins:
```
$ terraform init
```

### Run Terraform plan to see what changes it will make
```
$ terraform plan
```

### If everything ok, run the apply:
```
$ terraform apply
```

#### Test using the public ip in the browser and using the ssh access
```
$ ssh ec2-user@public_ip

