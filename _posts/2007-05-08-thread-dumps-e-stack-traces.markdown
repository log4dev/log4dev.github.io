---
author: alexandre
comments: true
date: 2007-05-08 11:34:19
layout: post
slug: thread-dumps-e-stack-traces
title: Thread dumps e stack traces
wordpress_id: 133
tags:
- Java
- Linguagens de Programação
---

Ian Daniel, engenheiro de suporte da [Atlassian](http://www.atlassian.com) recomendou através do blog da empresa dirigido a desenvolvedores o seguinte artigo -  [0xCAFEFEED: Of Thread dumps and stack traces ...](http://www.me.umn.edu/%7Eshivane/blogs/cafefeed/2004/06/of-thread-dumps-and-stack-traces.html) .

O artigo é bastante interessante, e começa com uma introdução básica sobre **exceções em Java** que todo mundo que começa a programar nessa linguagem deveria ler - isso evitaria cerca de 50% dos posts em fóruns de usuários de diversas aplicações. Depois da introdução, ele começa a discutir sobre formas inovadoras de uso de **stack traces** que as **exceções** provêem: por exemplo, o uso do método **printStackTrace()** da classe **Exception** para descobrir como se chegou à execução de um determinado trecho de código. Por fim, o autor do artigo fala sobre **thread dumps** - como obtê-lo, explica as informações que são visualizadas, e como utilizá-las para debugar uma aplicação.

Um artigo bastante simples, mas muito informativo, e com conhecimentos que são úteis para a maioria dos programadores Java. Recomendo.


Powered by [ScribeFire](http://scribefire.com/).
