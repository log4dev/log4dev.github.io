---
author: mgalves
comments: true
date: 2007-10-13 16:30:51
layout: post
slug: funcoes-com-argumentos-variaveis-em-javascript
title: Funções com argumentos variáveis em Javascript
wordpress_id: 195
tags:
- Javascript
---

As vezes, é útil escrever funções ou métodos cujo **número de argumentos é desconhecido a priori**. O exemplo clássico funções de formatação de String.

`printf("Olá, meu nome é %s, tenho %d anos e moro em %s", "Miguel", 27, "São Paulo")
`
No exemplo acima, sabemos que no mínimo teremos 1 argumento, que é a string a ser impressa. Mas não sabemos quantos elementos serão injetados na string final. Uma forma de contornar isso é passando os parâmetros em um vetor. A outra é usando um sistema de número de parâmetros variáveis.

Em **Javascript**, isto é possível utilizando a variável local **arguments**, existente dentro de cada função executada. Esta variável é um vetor que contém todos os parâmetros realmente passados na chamada da função. Exemplo de uso:

`function foo(){
var sum = 0;
for (var i=0; i<arguments.length; i++ ) sum += arguments[i]:
return sum
}`

O código acima recebe um número desconhecido de inteiros e retorna a soma destes.

`foo(1) = 1;
foo(1,2,3) = 6
foo()=0;`
