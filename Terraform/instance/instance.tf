data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name                    = "name"
        values                  = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name                    = "virtualization-type"
        values                  = ["hvm"]
    }

        owners                  = ["099720109477"]
}

resource "aws_instance" "api" {
    ami                         = data.aws_ami.ubuntu.id
    instance_type               = "t2.micro"
    key_name                    = "lol"
    subnet_id                   = var.subnet_id
    vpc_security_group_ids      = var.vpc_security_group_ids
    user_data = <<-EOF
        #!/bin/bash
        # install docker
        sudo curl -sSL https://get.docker.com/ | sh
        # run dummy service that returns host id and load info
        sudo docker run --detach --publish 8000:8000 fernando99ibm/django-app
        EOF 

    tags                        = {
        Name                    = "sim-BackEnd"
    }
    
    

    
}

resource "aws_instance" "web" {
    ami                         = data.aws_ami.ubuntu.id
    instance_type               = "t2.micro"
    key_name                    = "lol"
    subnet_id                   = var.subnet_id
    vpc_security_group_ids      = var.vpc_security_group_ids
    user_data = <<-EOF
        #!/bin/bash
        # install docker
        sudo curl -sSL https://get.docker.com/ | sh
        # run dummy service that returns host id and load info
        sudo docker run --detach --publish 80:8000 fernando99ibm/sample-react-app
        EOF 

    tags                        = {
        Name                    = "sim-FrontEnd"
    }
    
    

    
}

