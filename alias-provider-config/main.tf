provider "aws" {
  region = us-east-1
}

provider "aws" {
  region = us-west-1
}

# Get Ubuntu AMI Id
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Create US East EC2 Instance
resource "aws_instance" "web-us-east" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "Hello-US-East"
  }
}

# Create US West EC2 Instance
resource "aws_instance" "web-us-west" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "Hello-US-West"
  }
}

