locals {
  instance_set = toset(var.selected_instance_ids)
}

# Recupera info istanze
data "aws_instance" "selected" {
  for_each    = local.instance_set
  instance_id = each.value
}

# Crea AMI
resource "aws_ami_from_instance" "ami" {
  for_each = data.aws_instance.selected

  name                    = "${var.ami_name_prefix}-${each.key}-${replace(timestamp(), ":", "-")}"
  source_instance_id      = each.value.id
  description             = "Full snapshot AMI creata da Terraform per ${each.key}"
  snapshot_without_reboot = true

  tags = merge(
    {
      "CreatedBy" = "terraform"
      "Instance"  = each.key
    },
    var.tags
  )
}
