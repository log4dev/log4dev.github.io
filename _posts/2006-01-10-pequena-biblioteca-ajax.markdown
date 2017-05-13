---
theme:
  name: twitter
author: mgalves
comments: true
date: 2006-01-10 11:39:02
layout: post
slug: pequena-biblioteca-ajax
title: Pequena biblioteca AJAX
wordpress_id: 32
categories:
- Desenvolvimento
tags:
- Interfaces
- Javascript
- Web
- Firefox
---

Nas últimas semanas tenho desenvolvido muitas coisas usando  a técnica AJAX...digo técnica porque usar a palavra tecnologia neste caso não me parece apropriado. Mas isso é assunto pra outro tópico.Os resultados finais são bem interessantes e satisfatórios: as interfaces geradas com Javascript+XML+requisição assíncrona são bem mais próximas de desktop, leves e dinâmicas, e a comunicaçao entre navegador e servidor é feita de forma muito eficiente e rápida.

Minha única ressalva é que, pra quem usa algum framework como struts como eu estou usando atualmente, o uso de AJAX força a ter que reescrever em javascript muitas das funcionalidades já existentes.

Meu sonho de consumo atualmente seria um bom conjunto de taglibs que gerasse código de requisisição e validação de formulários usando AJAX, deixando o código mais limpo e evitando algumas gambiarras necessárias. Existem algumas libs por aí, mas sinceramente nenhuma delas conseguiu chamar a atenção. Quem sabe um dia não me animo a escrever uma.

Mas enquanto não acho a solução ideal, estou usando uma solução caseira desenvolvida inicialmente por um colega e com algumas extensões minhas: o arquivo [ajax.js](http://www.ic.unicamp.br/%7Era992237/ajax.js) possui um conjunto de funções que facilitam o uso de AJAX, tanto no acesso aos dados do arquivo XML quanto no acesso e modificação do DOM HTML. Está bem simples e sem nenhuma pretensão de ser uma biblioteca definitiva. Mas pode ser uma mão na roda para quem está começando. Comentários, sugestões e críticas são bem vindos.
