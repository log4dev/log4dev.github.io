---
theme:
  name: twitter
author: lullis
comments: true
date: 2007-12-21 17:48:09
layout: post
slug: especial-de-natal-log4dev-construindo-um-site-de-noticias-usando-python-parte-1
title: 'Especial de Natal Log4Dev: construindo um site de notícias usando Python -
  Parte 1'
wordpress_id: 230
categories:
- Desenvolvimento
- Notícias
tags:
- Desenvolvimento
- Python
- Web
---

## Introdução


Sem dúvida, esse ano foi um ano interessante para quem participou da WWW. Se em 2006 a revista Time escolhou "Você" como pessoa do ano, nesse ano houve uma consolidação da idéia da "Web Social".

Estamos só no começo. Estamos só agora descobrindo que a internet, antes do que uma rede de computadores, é uma rede de pessoas. O futuro da internet vai aprender a juntar essas ligações e formas de interação social (o "Grafo Social") para trazer serviços mais inteligentes e mais adequados a cada um de nós.

Nesse espiríto, e aproveitando o fim de ano - onde todo mundo acaba diminuindo o ritmo de trabalho mesmo - eu pensei em fazer um pequeno passo-a-passo de um "Site Social", para aqueles que pensam em oferecer um desses serviços.


## A idéia


Uma das coisas mais comuns que vimos por aí foi a proliferação de sites onde os usuários mandam as notícias, e a audiência escolhe os textos que são "dignos de capa", através de "votos" nos links. O maior exemplo para esse tipo de site é o [Digg](http://digg.com), site com muitos usuários no mundo todo.

Ainda que sites como o Digg até possam trazer eventualmente alguns textos interessantes, já se percebeu que é muito difícil ter um site onde o público seja o único responsável pela determinação do conteúdo relevante. Não por achar que as pessoas não sejam capazes de se gerenciarem, mas pelo fato de ser muito difícil de obter textos e notícias que sejam simultaneamente interessantes e agradem a um grande público.

O [Reddit](http://reddit.com) apresentou uma evolução nesse passo. Ele possui um filtro que aprende, através do seu histórico de votação, a te indicar quais links podem ser mais interessante para você.

Mas ainda falta alguma coisa: mesmo o filtro do Reddit não é capaz de me trazer links mais específicos, adequados para os meus interesses. Talvez, se ele puder saber quais os meus gostos, hábitos, idiomas que eu falo, comunidades das quais participo e outras informações gerais, talvez o filtro possa ser mais inteligente e aprender ainda mais.

Bem, eu vou ficar devendo a parte do filtro, por enquanto. Só vou dizer que o nosso site será capaz, quando você acabar, de cadastrar usuários, ver os links enviados, entrar num fórum de discussão para cada link e manter um histórico de votação.

O que eu passei fazendo nos últimos dois dias está [aqui](http://news.log4dev.com). Ao longo dos próximos dias, vou colocar os detalhes e o processo para o desenvolvimento de tal sistema.

Ah, sim. Isso é muito mais um exercício do que algo pra ser considerado software de produção. Trate com carinho. O que mais você queria em dois dias de trabalho?
