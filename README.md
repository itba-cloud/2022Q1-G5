# Cloud-G5-2022


#Step 1

$terraform init

#Step 2

$aws configure

Llenar usuario y contraseña
Si no pide session token, llenarlo manualmente en "~/.aws/credentials"


#Step 3

$terraform plan


#Step 4

$terraform apply


# Lambda

Para ejecutar el lambda se debe enviar un json en el body con un key "title" con el cual se guardara el archivo dentro de s3 y dynamo

# Architecture
![architecture diagram](./diagram.png)
