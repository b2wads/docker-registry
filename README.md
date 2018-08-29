# Docker registry

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
