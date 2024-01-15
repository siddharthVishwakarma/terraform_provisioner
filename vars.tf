variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0df2a11dd1fe1f8e3"
    us-east-2 = "ami-0005e0cfe09cc9050"
  }
}

variable "USER" {
  default = "ec2-user"
}
