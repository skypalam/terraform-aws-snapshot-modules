variable "selected_instance_ids" {
  description = "Lista di instance IDs su cui creare AMI e snapshot"
  type        = list(string)
  default = []
}

variable "ami_name_prefix" {
  description = "Prefisso per il nome AMI"
  type        = string
  default     = "tf-ami"
}

variable "tags" {
  description = "Tags applicati alle risorse create"
  type        = map(string)
  default     = {}
}
