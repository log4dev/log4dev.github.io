---
author: mgalves
layout: post
title: "Schemeless URLs"
slug: schemeless-urls
comments: true
date: 2013-06-14
description: ""
category: 
tags: [Web, Desenvolvimento, HTML]
---
{% include JB/setup %}

Descobri esta semana a existência dos schemeless URIs, endereços sem a definição do protocolo (HTTP ou HTTPS). Já tinha esbarrado com os dito-cujos no CDN do Google, cação bibliotecas JS. Os mais atentos já notaram que os códigos de embed são sempre no formato

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>

Na minha ignorância e pedância costumeiras, achava que era um erro do Google. Mas Google não erra.

E aí, a audiciência se pergunta: what the hell?

Bom, a grande vantagem deste esquema é que os navegadores, quando encontram um link num documento HTML sem HTTP ou HTTPS, assumem que devem usar o protocolo da página pai. Portanto, se eu acesso 

    http://siga.st

o navegador irá acessar 

    http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js 

Se eu acessar 

    https://siga.st

o navegador irá acessar 

    http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js 

Se eu acessar 

    gopher://siga.st

não vai dar em nada ([Definição de Gopher aqui](http://pt.wikipedia.org/wiki/Gopher)).

O grande interesse desta funcionalidade é que alguns navegadores, como o Chrome por exemplo, não permitem carregar arquivos externos via HTTP a partir de um endereço base HTTPS (quem já tentar verá uma mensagem no console do tipo "SITE A ran insecure content from SITE B"). 

Usando o esquema sem protocolo definido, o programador web cobrirá todos os casos.



