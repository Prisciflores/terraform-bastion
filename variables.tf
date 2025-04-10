# Región donde se lanzará la instancia
variable "region" {
  description = "Región de AWS donde se desplegará la EC2"
  type        = string
  default     = "us-east-1"
}

# Nombre del proyecto (usado para tags y nombres)
variable "project_name" {
  description = "Nombre del proyecto para tagging"
  type        = string
  default     = "eks-demo"
}

# ID de la VPC existente
variable "vpc_id" {
  description = "ID de la VPC donde se creará la instancia"
  type        = string
}

# Subnet pública donde se lanzará la EC2
variable "subnet_id" {
  description = "ID de la subnet pública para la instancia bastión"
  type        = string
}

# Key pair existente para conectarte por SSH
variable "key_name" {
  description = "Nombre de la key pair existente en AWS"
  type        = string
}

# Dirección IP pública desde donde te vas a conectar (en formato CIDR, ej: 190.44.x.x/32)
variable "my_ip_cidr" {
  description = "Tu IP pública con /32 para acceso SSH restringido"
  type        = string
}

# AMI de Amazon Linux 2 (Free Tier elegible)
variable "ami_id" {
  description = "AMI ID para Amazon Linux 2 en us-east-1"
  type        = string
  default     = "ami-051f8a213df8bc089" # Amazon Linux 2 - us-east-1
}
