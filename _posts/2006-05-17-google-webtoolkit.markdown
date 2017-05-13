---
theme:
  name: twitter
author: mgalves
comments: true
date: 2006-05-17 14:07:36
layout: post
slug: google-webtoolkit
title: Google WebToolkit
wordpress_id: 64
categories:
- Desenvolvimento
tags:
- Ferramentas
- Java
- Web
- Google
- Ajax
---

A Google é uma das poucas empresas que eu conheço que consegue superar minhas espectativas a cada novo lançamento. É incrível a capacidade que eles tem de desenvolver produtos interessantes, e sobretudo a capacidade que eles tem de oferecer ferramentas de alto nível para desenvolvedores.

O mais novo exemplo é o [**Google WebToolkit**](http://code.google.com/webtoolkit/), que acaba de sair do forno. A idéia é fornecer uma **API** para facilitar a programação de aplicativos **WEB AJAX** em Java. Eu só li a documentação, e portanto tenho no momento uma visão superficial do sistema. Mas basicamente a idéia é que o desenvolvedor escreve uma interface gráfica em Java, como se fosse um programa desktop com interface SWING, e o Google WebToolkit compila sua página em código Javascript. Se não me engano, o funcionamento é muito parecido com o Java Server Faces da Sun.

Vantagens desse mecanismo:



	
  1. Torna o processo de desenvolvimento de interfaces mais rápido, sobretudo para aqueles que não são experts em Javascript (e nem querem se tornar), e para aqueles que querem manter a compatibilidade de browsers

	
  2. Facilita o processo de debug, uma vez que pode se utilizar JUnits e  debuggers de Java para testar a interface

	
  3. Permite acesso a todas as funcionalidades da API Java...eles que se virem pra traduzir isso em  Javascript.


Para aqueles que trabalham com **Eclipse**, mais um ponto interessante: o  **GWT** já vem com um  script projectCreator, que cria toda a árvore de arquivos, scripts e classpath necessários para criar um projeto dentro do IDE.

Bom, por enquanto é só pessoal. Assim que tiver mais detalhes, entro em contato.
