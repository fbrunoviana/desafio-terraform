# Desafio Terraform: Configuração de Backend na AWS

### Objetivo
Implemente uma infraestrutura como código usando Terraform para criar e configurar um ambiente na AWS que inclui um bucket S3 para armazenamento de estado remoto e uma tabela DynamoDB para bloqueio de estado.

### Requisitos

1. **Região da AWS**: Todo o provisionamento deve ser realizado na região `sa-east-1`.

2. **Versão do Provider AWS**: Utilize a versão `5.44.0` do módulo provider da AWS. Certifique-se de especificar esta versão no seu código Terraform para evitar incompatibilidades.

3. **Versão do Terraform**: Garanta que o código seja compatível com a versão `1.7.5` do Terraform ou superior. Isso assegura que funcionalidades recentes possam ser aproveitadas e que o código esteja atualizado com as melhores práticas.

4. **Bucket S3**: Crie um bucket S3 chamado `guelo-backend`. Este bucket servirá como o local de armazenamento do estado remoto do Terraform, permitindo gerenciamento e colaboração mais eficientes.

5. **Estado Remoto do Terraform**: Configure o Terraform para usar o bucket S3 `guelo-backend` como backend. Isso envolve configurar o Terraform para armazenar seu estado de configuração neste bucket, facilitando a colaboração em equipe e o gerenciamento de estado.

6. **Tabela DynamoDB**: Provisione uma tabela DynamoDB com o nome `guelo-lock`. Esta tabela será usada para bloqueio de estado (state locking), prevenindo condições de corrida e inconsistências durante operações concorrentes de infraestrutura.

7. **Bloqueio de Estado**: Vincule a tabela DynamoDB `guelo-lock` ao Terraform como mecanismo de bloqueio de estado. Isso garante que apenas uma operação de Terraform possa ser executada por vez, protegendo o estado de alterações concorrentes indesejadas.

