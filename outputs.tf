# IP pública de la instancia bastión
output "bastion_public_ip" {
  description = "IP pública para conectarte por SSH"
  value       = aws_instance.bastion.public_ip
}

# ID de la instancia EC2 creada
output "bastion_instance_id" {
  description = "ID de la instancia EC2 bastión"
  value       = aws_instance.bastion.id
}

# Security group asociado
output "bastion_security_group_id" {
  description = "ID del Security Group asociado a la bastión"
  value       = aws_security_group.bastion_sg.id
}
