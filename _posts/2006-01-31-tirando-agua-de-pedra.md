---
title: Tirando agua de pedra
author: Miguel Galves
layout: post
permalink: /2006/01/31/tirando-agua-de-pedra/
dsq_thread_id:
  - 8900320
categories:
  - Uncategorized
tags:
  - Engenharia de Software
---
# 

…ou como extrair informações de um cliente para fazer a especificação de um software.Recebi esta [tira do Dilbert][1] hoje de manhã, e ela tem tudo a ver com alguns problemas de especificação de software que estou vivendo atualmente. Conseguir extrair informações sobre o negócio de um cliente é uma arte, que requer tempo, perícia e uma boa dose de calma. O grande problema é que pessoas normais (em oposição a desenvolvedores) não conseguem entender o mundo virtual que um software constrói, não entende implicações de decisões erradas de design, e sobretudo nem sempre consegue definir quais são as informações importantes para o design, e quais são totalmente superfluas. E são esses pequenos detalhes esquecidos que em geral irão causar redesign, refactoring, e portanto atraso.

 [1]: http://www.dilbert.com/comics/dilbert/archive/dilbert-20060129.html

**Exemplo prático:** ontem, por acaso, descobri que um atributo que eu acreditava estar ligado a uma entidade entidade na verdade era ligada a outra entidade. **Detalhe:** a questão das entidades foi discutida milhõs de vezes, e o cliente aprovou um documento que explicitava as entidades e seus atributos. **Resultado: ** mudar o atributo de uma tabela de BD para outra é muito simples….o problema é modificar queries, objetos, e validar tudo de novo. No meu caso, 2 dias perdidos praticamente.

O fato é que não se pode esperar que o cliente vá falar sobre tudo sozinho, e de preferência, não se deve pedir pro cliente descrever o seu negócio com a ótica do software a ser produzido…inevitavelmente, ele irá colocar filtros nas informações que em geral não são desejáveis. Quem deve delimitar o escopo do software e as informações realmente relevantes é o desenvolvedor, obviamente com base nas informações do cliente.