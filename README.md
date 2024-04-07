# Desafio terraform
![alt text](img/banner.png)

### Inicie o docker com terraform instalado:

```bash
docker build -t terraform-code:1.0 .
docker run -it --rm --env-file .env -v $(pwd):/tfcode --name tf terraform-code:1.0 bash
```