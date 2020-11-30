# AWS-sim-Architecture

_Este repositorio cuenta con la guia para la ejecución del código en terraform para IaC en AWS con la siguiente arquitectura_

<img width="940" alt="/architecture.png">

## Contenido 📋

El repositorio cuenta con los archivos principales de ejecución de terraform y cada uno de los modulos tanto para el VPC, como para las instancias EC2
1. main.tf
2. variables.tf
3. provider.tf
4. vpc (modulo VPC)
4.1 /vpc.tf 
4.2 /variables.tf
4.3 /output.tf
5. instance (modulo instancias EC2)
5.1 instance.tf
5.2 variables.tf

## Ejecución :rocket:

Para la ejecución del código se requiere tener el terraform CLI instalado y ejecutar los siguientes comandos

```
terraform init
terraform validate
terraform plan
terraform apply -var access_key="<access key de la cuenta AWS>" -var secret_key="<secret key de la cuenta AWS>"
```



### Hecho por Arley Fernando Coy Páez

