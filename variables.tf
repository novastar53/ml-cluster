variable "access_key" {
        description = "Access key to AWS console"
}
variable "secret_key" {
        description = "Secret key to AWS console"
}

variable "availability_zone" {
        description = "Availability zone for the ec2 instances"
        default = "us-east-1a"
}


variable "instance_name" {
        description = "Name of the instance to be created"
        default = "ml-instance"
}

variable "instance_type" {
        default = "t2.large"
}

variable "subnet_id" {
        description = "The VPC subnet the instance(s) will be created in"
        default = "subnet-0a04bf3b6234a1b7b"
}

variable "ami_id" {
        description = "The AMI to use"
        default = "ami-0d08c00fae325064c"
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 1
}


variable "service" {
        default = "jupyter"
}

variable "contact" {
        default = "vikramp1987@gmail.com"
}

variable "environment" {
        default = "TEST"
}
