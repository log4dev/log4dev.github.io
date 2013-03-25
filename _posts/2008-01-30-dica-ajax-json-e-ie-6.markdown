---
author: mgalves
comments: true
date: 2008-01-30 10:22:51
layout: post
slug: dica-ajax-json-e-ie-6
title: 'Dica: Ajax, JSON e IE 6'
wordpress_id: 241
categories:
- Desenvolvimento
tags:
- Ajax
- Desenvolvimento
- Javascript
- Web
---

Esta dica é bem pontual, e talvez resolva a vida de no máximo duas pessoas. Mas o problema aqui abordado me custou minutos preciosos, e portanto vou aproveitar o fato de ter um blog para compartilha-lo com vocês. Sem contar que faz um bom tempo que eu não escrevo nada mais técnico.

Cenário básico: **aplicação web** com interface contendo vários trechos que necessitam de **comunicação assíncrona** com o servidor (a.k.a [**Ajax**](http://log4dev.com/2007/08/21/ajax-em-20-minutos/)). Por motivos de projeto, a resposta vem em formato [**JSON**](http://www.json.org/) (para resumir, eu tive que substituir **[DWR](http://getahead.org/dwr/) **por [**Prototype**, ](http://www.prototypejs.org)e para ser o menos intrusivo possível na aplicação, usei o mesmo formato de transmissão de dados do framework).

Dentre os vários dados recebidos do servidor, um deles é uma estrutura de dados representando um endereço:

`{cidade: {id: 1, nome: "Sampa"}, estado: {id: 1, nome: "SP"}, pais: {id: 1, nome: "Brasil"},}`

Muito bem. Para transformar este trecho em um objeto tratável pelo javascript como uma estrutura de dados, eu usei o comando `var data = eval("("+response.responseText+")")`, onde response é o objeto de resposta da requisição.

No **Firefox**, o sistema funcionou maravilhosamente bem. No **IE 6**, pra variar, necas. Não testei no IE 7.

O problema foi  a última vírgula antes da última chave. O uso de chaves indica que estou descrevendo um dicionário (contendo pares chave: valor). Ao colocar uma vírgula no final, o IE entende que teremos mais um par à frente, e reclama ao encontrar uma chave. Tirei a virgula, e tudo funcionou perfeitamente.

________________________________________

Adendo feito algumas horas depois: justiça seja feita, o IE segue a especificação formal do JSON ao pé da letra. Vendo o diagrama da sintaxe do JSON no site [json.org](http://json.org), vi que após uma virgula deve haver um par chave:valor. MEA CULPA.
