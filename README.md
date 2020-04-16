# Docker registry

 * 0.3.0
  - Atualizando imagem base para pegar o registry `2.7.x`

 * 0.2.0
  - Habilitando log em formato JSON através da env `DOCKER_REGISTRY_ENABLE_JSON_LOGS`;
  - Possibilidade de escolher o loglevel: env `REGISTRY_LOG_LEVEL`.




ENVs necessárias para essa imagem
==================================

* REGISTRY_STORAGE_CACHE_ENABLE: Adiciona a seção de opções de cache de storage. Por enquando o unico cache possível é o redis.
* REGISTRY_STORAGE_FILESYSTEM_ENABLE: Habilita o storage no filesystem
* REGISTRY_STORAGE_FILESYSTEM_ROOT_DIR: indica qual a pasta no filesystem que será usada para guardar as imagens.
* REGISTRY_REDIS_ADDRESS: Indica o endereço (IP:PORTA) do redis que será usado como cache
* REGISTRY_STORAGE_S3_ENABLE: Habilita o storage do S3.
    * REGISTRY_STORAGE_S3_ACCESS_KEY_ID
    * REGISTRY_STORAGE_S3_ACCESS_KEY_SECRET
    * REGISTRY_STORAGE_S3_REGION
    * REGISTRY_STORAGE_S3_BUCKET
* DOCKER_REGISTRY_ENABLE_JSON_LOGS: Habilita a geração de logs em formato JSON
* REGISTRY_LOG_LEVEL: Define o level desses logs JSON, defaults to "info"

Autenticação
------------

A autenticação é obrigatória. É possível ter até 10 autenticações diferentes (usuários).

Cada usuário é passado em uma ENV com prefixo `REGISTRY_HTPASSWD_RAW_ENTRY_`. O sufixo é um número, começando com `1`.

O total de autenticações está no `htpasswd.tmpl`.

Como gerar o valor esperado ness ENV de autenticação
----------------------------------------------------


HOW TO ADD/EDIT A USER'S PASSWORD:

1. install apache2-utils
2. htpasswd -B -n <username>

Nesse momento será pedida a senha, duas vezes. Ao final a string escrita na tela é o que deve ir para as ENVs `REGISTRY_HTPASSWD_RAW_ENTRY_*`.


HOW TO VERIFY A GIVEN PASSWORD:

1. Open the account.htpasswd file and find what user you cant to check
2. Find what algorithm to use: Characters between the first and second dollar signs (exclude)
3. Get the salt: Characters between the second and the third dollar sings (exclude)
4. Run `openssl passwd -{algorithm} -salt {salt} {plainpassword}`
5. Check the output inside the account.htpasswd file
