# variable "ami" {
#   type = string
# }
# variable "instance_type" {
#   type = string
# }
# variable "application_name" {
#   type = string
# }
# variable "instance_number" {
#   type = number
# }
# variable "create_resources" {
#   type = bool
# }
# variable "tags" {
#   type = map(string)
# }

variable "instances" {
  type = map(object({
    ami = string
    instance_type = string
    application_name = string
    instance_number = number
    create_resources = bool
    tags = map(string)
  }))
}