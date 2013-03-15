---
title: Passagem de parâmetros elegante em Javascript
author: Miguel Galves
layout: post
permalink: /2007/11/13/passagem-de-parametros-elegante-em-javascript/
dsq_thread_id:
  - 64841998
categories:
  - Uncategorized
tags:
  - Javascript
---
# 

Suponha a seguinte definição de função em Javascript: `
function foo(p1, p2,){
...
} `

As seguinte chamadas são válidas: `foo()`, `foo(1)`, `foo(1, 2)` e `foo(1, 2, 3)`. No primeiro caso, a função foo será chamada e as variáveis terão todas valor null. No segundo caso, **p1** terá valor **1** e **p2**, **null**. No segundo caso, **p1** e **p2** terão valor **1** e **2** respectivamente. No terceiro também, e o valor 3 poderá ser acessado pela variável local **arguments** (leia o [meu post sobre argumentos variáveis em Javascript][1] para entender esta funcionalidade).

 [1]: http://log4dev.com/2007/10/13/funcoes-com-argumentos-variaveis-em-javascript/

Ou seja: uma declaração de função em javascript é extremamente flexível. Uma função **sempre pode receber um número variável de parâmetros**. A definição de parâmetros formais da função apenas define um nome a priori para estes valores.

Este flexibilidade toda seria ótima se Javascript, assim como Python, permitisse a identificação dos parâmetros na chamada da função. Por exemplo, se eu quisesse chamar foo apenas com o valor da variável p2, eu poderia chamar *foo(p2=2)*. Infelizmente isto não funciona: **Javascript **vai preenchendo as variáveis na ordem em que elas aparecem na definição . Portanto se eu quisesse apenas atribuir um valor a *p2*, teria que chamar *foo(null, 2)*. Além disso, a linguagem não permite definir valores defaut para os parâmetros.

Uma forma elegante de contornar esta limitação da linguagem, utilizando um recurso extremamente útil implementado nativamente, e de quebra permitir que as variáveis sejam identificadas na chamada ( o que facilita muito a leitura e manutenção do código, quando chamamos funções que aceitam muitos parâmetros) é criar funções que recebam sempre apenas um argumento: um dicionário.

Eis uma nova implementação de foo que recebe os mesmo 3 parâmetros, utilizando um dicionário, e que de quebra define valores default para cada um deles caso o usuário não defina:

`
function foo(params){
var p1 = params.p1 || 1;
var p2 = params.p2 || 2;
var p3 = params.p3 || "string"
}`

Neste caso, caso eu queira chamar foo apenas com os valores de p2 e p3, eu executo `foo({p2:2, p3: 3})`. Simples assim.

A construção `var p1 = params.p1 || 1` utiliza propriedades das** expressões** **booleana **para determinar o valor. Em javascript, uma função **OR** retorna o valor do primeiro elemento que for avaliado como verdadeiro, ou o valor do último elemento avaliado caso todos sejam falsos. Os valores **null**, ****, **false**, **undefined** e **“”** (string vazia) retornam falso. Caso o parâmetro não seja definido pelo usuário na chamada da função, params. retorna null, e portanto o segundo valor da expressão booleana é atribuido à variável.

Quer aprender mais dicas avançadas de Javascript?[ Funções com argumentos variáveis em Javascript][2],[ Captura de teclas em Javascript – Parte 1][3],[ Captura de teclas em Javascript – Parte 2][4] e [Concatenação eficiente de Strings em Javascript][5] e [AJAX em 20 minutos][6].

 [2]: http://log4dev.com/2007/10/13/funcoes-com-argumentos-variaveis-em-javascript/ "Link permanente para Funções com argumentos variáveis em Javascript"
 [3]: http://log4dev.com/2006/04/19/captura-de-teclas-em-javascript-parte-1/ "Link permanente para Captura de teclas em Javascript - Parte 1"
 [4]: http://log4dev.com/2006/05/15/captura-de-teclas-em-javascript-parte-2-2/ "Link permanente para Captura de teclas em Javascript - Parte 2"
 [5]: http://log4dev.com/2006/04/06/stringbuffer-em-javascript/ "Link permanente para Concatenação eficiente de Strings em Javascript"
 [6]: http://log4dev.com/2007/08/21/ajax-em-20-minutos/