# Modulo Terraform — EC2 Full Snapshot (AMI + EBS)

Questo modulo crea:
- Un'immagine AMI per ogni EC2 ID passato in input
- Snapshot dei volumi EBS associati

## Variabili
| Nome | Descrizione | Tipo | Default |
|------|--------------|------|----------|
| `selected_instance_ids` | Lista di ID EC2 | list(string) | — |
| `ami_name_prefix` | Prefisso del nome AMI | string | "tf-ami" |
| `tags` | Tag comuni | map(string) | {} |

## Output
- `amis`: Mappa delle AMI create (`instance_id => ami_id`)
- `snapshots`: Mappa delle snapshot EBS create

## Esempio
```hcl
module "ami_snap" {
  source = "../modules/ec2-ami-snapshot"
  selected_instance_ids = ["i-0123456789abcdef0"]
  ami_name_prefix       = "backup-prod"
  tags = {
    Environment = "prod"
    Owner       = "infra-team"
  }
}
