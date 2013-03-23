---
author: mgalves
comments: true
date: 2008-02-26 22:15:51
layout: post
slug: beleza-booleana
title: Beleza booleana
wordpress_id: 254
categories:
- Desenvolvimento
tags:
- Desenvolvimento
- Javascript
- Linguagens de Programação
- Python
---

Até há muito pouco tempo atrás, expressões booleanas para mim eram apenas uma questão de verdadeiro ou falso, ifs, whiles e do..whiles. Nesta época, eu ria quando encontrava trechos de códigosdo estilo

`boolean b = true; if (b == true){...}.`

A vida era simples, linda e limitada.

Daí eu comecei a brincar seriamente com javascript e python, e descobri que existe muito mais coisas entre o céu e as funções booleanas do que poderia sonhar minha vã filosofia. Neste mundo novo, expressões booleanas podem ser muito mais do que apenas true ou false: elas podem ser formas extremamente elegantes e compactas para atribuição de valores.

Vamos por partes. Em Java, apenas variáveis do tipo booleanas ou expressões que retornem variáveis do tipo booleanas (maior que, menor que, igual a, contém, ...) podem ser utilizadas em expressões booleanas. Uma construção do tipo if(1) não funciona.

Em linguagens de script, qualquer objeto pode ser avaliado como uma expressão booleana. Em Python por exemplo, a seguinte regra é aplicada: valores False (booleano), 0, "", e None (valor nulo) são avaliados como falso; qualquer outro valor é avaliado como verdadeiro. A expressão (1 and 2) seria avaliada como true por exemplo.

Um outro ponto interessante em Python e Javascript é que expressões booleanas não retornam simplesmente True ou False: elas retornam o valor de um dos objetos da expressão. Uma expressão com AND retorna o último valor da expressão caso todos elementos sejam avaliados como verdadeiros, ou retorna o primeiro valor que fez com que toda a expressão fosse avaliada como falsa. Por exemplo: `1 and "miguel" and 2` retorna 2, porque todos os elementos da expressão são verdadeiros, e portanto a expressão toda é verdadeira. Já `1 and 0 and 2` retorna 0, uma vez que  este é o primeiro elemento avaliado como false. E como todos sabemos, se um elemento é falso, a expressão toda é falsa.

No caso de uma expressão OR, ela retorna o primeiro elemento que for avaliado como verdadeiro, ou o último elemento da expressão caso todos os anteriores sejam avaliados como falsos. Por exemplo `(1 or 2)` retorna 1, e `(0 or "")` retorna "".

Ótimo. Então como podemos usar isso para escrever expressões compactas, úteis e elegantes? Eis algumas sugestões:



	
  * Valor default para uma variável: OR pode ser usado para garantir que caso um parâmetro seja passado com valor nulo para uma função por exemplo, ele receba um valor default:
_var v = param ||  "default"_

	
  * Expressões ternárias: o uso de OR e AND pode criar uma função ternária em linguagens que não possuem esta construção (Python por exempl0):
var v = (condicao AND valor1) OR valor 2


Aproveito pra levantar um ponto: estilo compacto é algo bom ou ruim? Um argumento muito utilizado contra expressões compactas como as descritas acima é que prejudica a legibilidade. De fato, pode ser mais difícil de ler à primeira vista. Mas mesmo construções mais verborrágicas podem ser dificeis de serem lidas: tudo depende de quão treinado é o olho e o cérebro do leitor. Portanto, eu acho que é apenas uma questão de estar acostumado a ler código de qualidade.
