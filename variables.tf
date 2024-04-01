variable "image" {
  description = "ami id used to deploy isntance"
  type = string
  default = "ami-0c101f26f147fa7fd"
}

variable "instance-flavor" {
  description = "This define the instance type"
  type = string
  default = "t2.micro"
}
