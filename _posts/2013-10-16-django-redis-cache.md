---
author: mgalves
layout: post
title: "Usando redis como backend de cache no Django"
slug: redis-cache-django
comments: true
date: 2013-10-16
description: ""
category: 
tags: [Redis, FOSS, Django, Python, Web]
---
{% include JB/setup %}

Um dos patterns mais simples implementáveis com [Redis](http://redis.io) é o de armazenamento de pares (chave, valor):

    SET key value
    GET key
    DEL key 

E assim como em outras ferramentas como memcache, é possível definir um tempo de vida máximo da chave no Redis, em segundos (EX), ou milisegundos (PX):

    SET key value EX 60 # 1 minuto
    SET key value PX 1000 # 1s

Com estas primitivas, podemos montar um mecanismo de cache de dados, com a grande vantagem de ser um cache compartilhável por várias máquinas / processos separados, uma vez que o Redis é um servidor acessível via IP/porta.

Usando a biblioteca [redis-py](https://github.com/andymccurdy/redis-py), o código para armazenar um texto no cache seria:

    import redis
    backend = redis.Redis()
    backend.set("mycache", "this is a cached string")

Se quisermos definir um tempo máximo de vida para esta entrada no cache, utilizaramos a chamada `setex`:

    import redis
    backend = redis.Redis()
    backend.setex("mycache", "this is a cached string", 60) # cache vive por 1 minuto

O código para obter os dados no cache, evitando um novo processamento, seria o seguinte:

    import redis
    backend = redis.Redis()

    cached = backend.get("mycache"):
    if cached:
        return cached:

    # Dados não estao no cache...efetua o processamento
    o processamento ocorre aqui

Quem desenvolve sistemas web com Django sabe que o framework oferece uma abstração de Cache, disponível no pacote `django.core.cache`, que permite vários níveis de granularidade (site inteiro, por view, por fragmentos de template, chamada direta) e vários backends diferentes (de fábrica estão disponíveis cache em memória, arquivo, base de dados, e memcache).

E obviamente que neste mundão de meu deus alguma boa alma implementou um pacote que conecta o cache do django ao Redis. Existem aliás algumas opções, e depois de alguns testes acabei optando pelo [django-redis](https://github.com/niwibe/django-redis). A instalação pode ser feita através do [pip](https://pypi.python.org/pypi/pip)

    pip install django-redis

A integração com o Django se faz através do arquivo `settings.py`:

    CACHES = {
        "default": {
            "BACKEND": "redis_cache.cache.RedisCache",
            "LOCATION": "127.0.0.1:6379:0",
            "OPTIONS": {
                "CLIENT_CLASS": "redis_cache.client.DefaultClient",
                'PARSER_CLASS': 'redis.connection.HiredisParser',
            }
        }
    }

O parâmetro `LOCATION` define o IP, porta e database usada pelo cache, e o `OPTIONS` define a classe cliente (`redis_cache.client.DefaultClient`), e o parser usado para comunicação com o Redis (`redis.connection.HiredisParser`). 

Em relação ao parser, é aconselhável a instalação do pacote [hiredis](https://github.com/redis/hiredis), uma implementação em `C` do protocolo de comunicação com Redis que chega a ser 10x mais rápida do que o driver padrão em Python. A instalação do HiRedis é muito simples:

    pip install hiredis

O django-redis oferece uma série de opções interessantes, como configuração de [SHARDING](http://en.wikipedia.org/wiki/Shard_(database_architecture)) usando diferentes instancias de Redis, entre outras. Sugiro a leitura da [documentação](https://django-redis.readthedocs.org/en/latest/). 

Sim, as vezes ajuda.