---
author: mgalves
comments: true
date: 2007-05-06 21:58:53
layout: post
slug: juice-lib-03-no-ar
title: Juice Lib 0.3 no ar!
wordpress_id: 132
categories:
- Desenvolvimento
tags:
- Javascript
- Web
---

Acabei de colocar no ar a **versão 0.3** da **Juice Lib**. A grande novidade deste release são funções para **manipular elementos HTML e formulários**. Estas funcionalidades podem ser acessadas de duas formas: a primeira forma é via o pacote _**juice.html**_, como por exemplo a função _juice.html.submit(form, handler)_, que submete um **formulário** via **AJAX** e processa o resultado na função handler, ou _juice.html.block(element)_, que define o modo de display de um elemento da página como block.

A segunda forma utiliza uma versão modificada da classe String, que permite que elementos da página sejam referenciados diretamente através do seu ID ou TAG. A sintaxe é:  _"%nomedadiv"_ para acessar uma **div** específica ou _"@nomedatag"_ para retornar uma lista de tags da página. Por exemplo, se eu quiser definir o modo de display da div div1 da página, eu executo _'%div1'.block()_. Caso eu queira aplicar a mesma função a todos os divs da página, executo _'@div'.block()._

Alguns operadores já foram incluidos na lib (block, none, visible, invisible, submit). Mas caso o usuário deseje aplicar um operador próprio, basta usar a função apply, passando como argumento uma função que recebe o elemento. Por exemplo

_'@span'.apply(function(x){x.style.backgroundColor="#00FF00"}); _

muda a cor de fundo de todos os elementos SPAN da página.

É possível também obter uma referência a um elemento da página usando a função el. Por exemplo, '%minhadiv'.el() retorna um apontador para o elemento minhadiv. O comando '@div'.el() retorna um vetor de apontadores para os elementos DIV da página.

A versão 0.3 pode ser encontada em [http://code.google.com/p/juicelib](http://code.google.com/p/juicelib). Como sempre, comentários, sugestões e críticas são muito bem vindos.
