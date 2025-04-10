# 💻 Terraform Bastion Module - EKS Demo

Este módulo despliega una instancia EC2 tipo **bastión**, ubicada en una **subnet pública**, con acceso SSH restringido desde una IP específica. Está pensado para permitir acceso seguro a clústeres privados de EKS o a recursos internos de una VPC.

---

## 📌 ¿Qué incluye este módulo?

- Instancia EC2 tipo `t2.micro` (Free Tier elegible)
- Security Group con acceso SSH (`port 22`) desde una IP específica
- Subnet pública (proporcionada por otro módulo)
- Asociación de IP pública
- Compatible con claves SSH existentes

---

## ⚙️ Requisitos

- Terraform >= 1.0
- AWS CLI configurado
- Key Pair existente en AWS (y archivo `.pem` guardado localmente)
- Subnet pública y VPC creadas (recomendado con el módulo `terraform-networking`)

---

## 📁 Estructura del módulo

```bash
terraform-bastion/
├── main.tf              # Recursos EC2 y SG
├── variables.tf         # Declaración de variables
├── outputs.tf           # Salida de datos útiles (IP, ID)
├── terraform.tfvars     # Valores específicos del entorno
├── .gitignore           # Ignora archivos innecesarios
└── README.md            # Este archivo

```

## 🚀 Uso

1.Llena el archivo terraform.tfvars con tus valores reales
2.Ejecuta:

```bash
terraform init
terraform apply -var-file="terraform.tfvars"

```

## 📤 Outputs

- bastion_public_ip → IP para conectarte por SSH
- bastion_instance_id → ID de la EC2 creada
- bastion_security_group_id → SG asignado a la bastión

##🔐 Conexión por SSH

```bash
ssh -i /ruta/a/tu/key.pem ec2-user@<bastion_public_ip>
chmod 400 tu-key.pem

```

## 🧩 Recomendaciones

- Instala kubectl y awscli en esta instancia para administrar tu clúster EKS privado.
- Usa esta bastión para pruebas, monitoreo o salto seguro hacia otros recursos privados.

## 🛠️ Autor

Creado por Priscila como parte de mi portafolio modular de Terraform + EKS + Ansible + Jenkins 💪🚀
