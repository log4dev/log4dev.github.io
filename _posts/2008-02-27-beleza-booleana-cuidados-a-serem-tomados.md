---
title: 'Beleza booleana &#8211; cuidados a serem tomados'
author: Alexandre Barbosa
layout: post
permalink: /2008/02/27/beleza-booleana-cuidados-a-serem-tomados/
dsq_thread_id:
  - 64842069
categories:
  - Uncategorized
---
# 

Há pouco meu caro amigo Miguel escreveu um [artigo][1] muito interessante sobre a facilidade que algumas linguagens oferecem ao utilizarmos expressões booleanas. A dica é muito boa, e certamente farei uso dela. No aspecto de legibilidade de código, não vejo problema algum.

 [1]: http://log4dev.com/2008/02/26/beleza-booleana

No entanto, esta técnica me incomoda no aspecto de parecer anti-natural do ponto de vista da álgebra booleana, onde trabalhamos somente com dois valores (true/false, 0/1). Me parece misturar conversão de tipos de dados, com lógica booleana. Isso somente não me incomodaria, mas me fez pensar: que resultado eu terei de expressões como ( 0 == “”), (“” == null)? Será que ele adota o valor booleano pra comparar? Resolvi testar usando perl, python e javascript, e obtive resultados diferentes:

**Perl**: *> perl -e ‘ $a=0; print( “” == $a); print “n”; ‘* *> 1*

*> perl -e ‘ $a=0; print( nil == $a); print “n” ‘* *> 1*

**Python**: *> python -c ‘\_a=0; print ( \_a == “” )’* *> False*

*> python -c ‘\_a=0; print ( \_a == None )’* *> False*

**Javascript**: *> var a=0; alert( a == “” );* *> True*

*> var a=0; alert( a == null );* *> False* 

Bom, como podemos ver, cada linguagem de programação tem sua forma de tratar este tipo de comparação. Desta forma, fica aqui o toque para se tomar cuidado com esta técnica, levando-se sempre em conta as especificidades da linguagem que você está utilizando.