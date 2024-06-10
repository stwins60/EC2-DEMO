locals {
  expanded_instances = flatten([
    for key, v in var.instances : [
        for i in range(v.instance_number) : {
            key = "${key}-${i + 1}"
            create_resources = v.create_resources
            ami = v.ami
            instance_type = v.instance_type
            application_name = v.application_name
            tags = v.tags
        }
    ]
  ])
}


resource "aws_instance" "this" {
    for_each = {
        for instance in local.expanded_instances : instance.key => instance
        if instance.create_resources
    }
    # count = each.value.create_resources ? each.value.instance_number : 0
    ami           =  each.value.ami
    instance_type =  each.value.instance_type
    tags = merge(
         each.value.tags,
        {
        Name = "${ each.value.application_name}-${each.key}"
        }
    )
    user_data = file("${path.module}/user-data.sh")
}
