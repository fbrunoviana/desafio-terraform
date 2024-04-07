
Criar o usuario no IAM, dar permissões 

docker build -t terraform-code:1.0 .
docker run -it --rm --env-file .env -v $(pwd):/tfcode --name tf terraform-code:1.0 bash