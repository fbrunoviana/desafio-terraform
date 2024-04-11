# Desafio terraform
![alt text](img/banner.png)

[Backend e Lock](00-backend_and_lock/README.md)
[WP com RDS](01-wp-instance-w-rds-lab/README.md)

### Inicie o docker com terraform instalado:

Entre no diretorio configure o arquivo `.env` e execute:

```bash
make terraform-init
make terraform-plan
make terraform-apply
```