---
title: Javascript é uma linguagem séria
author: Miguel Galves
layout: post
permalink: /2007/07/12/javascript-e-uma-linguagem-seria/
categories:
  - Desenvolvimento
tags:
  - Javascript
---
# 

Juro que eu gostaria de ter encontrado um título melhor para este post, mas não consegui. Pelo menos ele tem o mérito de ser conciso. Vamos ao que interessa…

No começo, desenvolver **interfaces web** em **HTML** era algo apenas para programadores. Difícil chamar aquilo de interfaces, eram na verdade documentos usando o conceito de hipertexto. Links, marcadores e afins era algo que apenas geeks conseguiam entender.

Com o tempo, rapidamente percebeu-se que geeks não tinham capacidade de fazer telas bonitas e atraentes. E daí, interfaces web viraram negócio de designers. Geeks eram ótimos para escrever scripts em Perl ou PHP server side. Mas designers não são geeks, e por isso criou-se a necessidade de se desenvolver aplicativos WYSIWYG (What You See Is What You Get), que permitem que pessoas criem telas sem a necessidade de escrever uma linha que seja de HTML. Com isto ganhamos telas lindas, mas códigos em geral horríveis. (É bem verdade que a qualidade dos códigos gerados melhorou muito nos últimos anos. Quem teve um dia o desprazer de ver o código gerado pelo Frontpage em 1999 ficaria muito positivamente espantado hoje em dia).

Neste contexto, apareceu o **Javascript**. Lançado pela Netscape, ele tinha como objetivo maior adicionar um pouco de interatividade nas páginas, sendo executados pelos navegadores nos clientes. Na época, interatividade significava basicamente validação de formulários e exibição de caixas de alertas e mensagens. Como interfaces eram desenvolvidas por designers e designers (em geral) não sabem programar, os códigos javascript criados eram péssimos. Muitas vezes, eram simplesmente gerados automaticamente pelos editores. E assim, Javascript ficou com a fama de ser uma linguagem ruim, não padronizada (IE e Netscape tinham/tem implementações diferentes) e de escopo reduzidíssimo.

E o Google chegou, e mostrou ao mundo as maravilhas do AJAX e das interfaces rápidas, eficientes, cada vez mais semelhantes a interfaces de aplicativos desktop, e as coisas mudaram. Havia a necessidade de se desenvolver interfaces cada vez mais complexas, com cada vez mais código. Não eram mais páginas web: passamos a criar aplicativos web. E aí, voltou a ser um assunto de geeks. E Javascript passou a ser olhada de forma diferente.

Hoje, Javascript foi padronizada (chama-se [ECMAScript][1]), e bibliotecas para desenvolvimento de interfaces AJAX pipocam todo dia (como por exemplo a minha [Juice Lib][2]) , livros e tutoriais passaram a ser escritos, [regras de boa prática estão aparecendo][3] e alguns passam a ver a linguagem com possibilidades maiores. Outro dia achei [um artigo][4] que fala que javascript já passou pelas fases de “precisamos de uma linguagem de script para páginas web”, “precisamos de um standard para esta linguagem”, “javascript afinal não é um brinquedo”, e que agora, estaríamos entrando na fase do 
**JAVASCRIPT É UMA LINGUAGEM DE PROGRAMAÇÃO**

E a partir deste momento, é justo se perguntar: se javascript é uma linguagem de programação podemos então escrever aplicativos que não estejam forçosamente ligados ao escopo de uma página? Why not! Temos todos os elementos necessários para isso na linguagem. E inclusive, algumas experiências interessantes sendo lançadas.

Uma delas é o **[Rhino][5]**, **interpretador de javascript **escrito em Java. Outra é o [Javascript on Rails][6], um porte do Ruby on Rails para javascript feito pelo [Steve Yegge][7], rodando sobre o Rhino. Curioso saber que o motivo de ele ter feito este porte é o fato de precisar de algo como o Ruby On Rails, pra desenvolver projetos no Google (onde ele trabalha) mas ter a limitação de não poder utilizar Ruby (lá, as linguagens aceitas são Java, Python, C e Javascript).

*[Aproveito para dizer que se alguem tiver interesse em me ajudar no desenvolvimento da Juice Lib, será muito bem* vindo.]

 

 [1]: http://www.ecma-international.org/publications/standards/Ecma-262.htm
 [2]: http://code.google.com/p/juicelib
 [3]: http://en.wikipedia.org/wiki/Unobtrusive_JavaScript
 [4]: http://ajaxian.com/archives/javascript-as-a-language
 [5]: http://www.mozilla.org/rhino/
 [6]: http://www.iunknown.com/2007/06/steve-yegge-por.html
 [7]: http://steve-yegge.blogspot.com/