---
author: alexandre
comments: true
date: 2008-02-27 16:58:47
layout: post
slug: beleza-booleana-cuidados-a-serem-tomados
title: Beleza booleana - cuidados a serem tomados
wordpress_id: 255
---

Há pouco meu caro amigo Miguel escreveu um [artigo](http://log4dev.com/2008/02/26/beleza-booleana) muito interessante sobre a facilidade que algumas linguagens oferecem ao utilizarmos expressões booleanas. A dica é muito boa, e certamente farei uso dela. No aspecto de legibilidade de código, não vejo problema algum.

No entanto, esta técnica me incomoda no aspecto de parecer anti-natural do ponto de vista da álgebra booleana, onde trabalhamos somente com dois valores (true/false, 0/1). Me parece misturar conversão de tipos de dados, com lógica booleana. Isso somente não me incomodaria, mas me fez pensar: que resultado eu terei de expressões como ( 0 == ""), ("" == null)? Será que ele adota o valor booleano pra comparar? Resolvi testar usando perl, python e javascript, e obtive resultados diferentes:


**Perl**:
_> perl -e ' $a=0; print( "" == $a); print "\n"; '_
_> 1_

_> perl -e ' $a=0; print( nil == $a); print "\n" '_
_> 1_


**Python**:
_> python -c '_a=0; print ( _a ==  "" )'_
_> False_

_> python -c '_a=0; print ( _a ==  None )'_
_> False_


**Javascript**:
_> var a=0; alert( a == "" );_
_> True_

_> var a=0; alert( a == null );_
_> False_


Bom, como podemos ver, cada linguagem de programação tem sua forma de tratar este tipo de comparação. Desta forma, fica aqui o toque para se tomar cuidado com esta técnica, levando-se sempre em conta as especificidades da linguagem que você está utilizando.
