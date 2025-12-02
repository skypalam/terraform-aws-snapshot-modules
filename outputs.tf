output "amis" {
  description = "Lista delle AMI create"
  value       = { for k, v in aws_ami_from_instance.ami : k => v.id }
}
