# ami = "ami-04b70fa74e45c3917"
# instance_type = "t2.micro"
# application_name = "ec2-demo"
# instance_number = 5
# create_resources = true
# tags = {
#   Environment = "dev"
#   Owner       = "terraform"
# }

instances = {
  "dev" = {
    ami = "ami-04b70fa74e45c3917"
    instance_type = "t2.micro"
    application_name = "ec2-demo"
    instance_number = 3
    create_resources = true
    tags = {
      Environment = "dev"
      Owner       = "terraform"
    }
  },
  "prod" = {
    ami = "ami-04b70fa74e45c3917"
    instance_type = "t2.micro"
    application_name = "ec2-demo"
    instance_number = 5
    create_resources = false
    tags = {
      Environment = "prod"
      Owner       = "terraform"
    }
  }
}
