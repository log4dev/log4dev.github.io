---
theme:
  name: twitter
author: laggarcia
comments: true
date: 2007-12-02 21:04:21
layout: post
slug: usando-regexp
title: Usando Regexp
wordpress_id: 217
categories:
- Desenvolvimento
- C++
- C
- Regexp
---

Há menos de um mês atrás o Miguel escreveu um [post](http://log4dev.com/2007/11/19/regexp-nossa-de-cada-dia/) muito interessante sobre regexp. Como ele disse lá, expressões regulares são uma das ferramentas que devem fazer parte da caixinha de maldades de qualquer desenvolvedor. Concordo plenamente. O uso de expressões regulares não só deixa o código menor como mais inteligível também.

A única coisa que acho que faltou no post anterior foi um exemplo que mostrasse estas vantagens nuas e cruas. E por isso vou colocar aqui um exemplo real extraído do CDT, o C/C++ Development Toolkit do Eclipse. Dentre as inúmeras necessidades de interpretação de conteúdos de String que o CDT precisa uma delas é especial: o CDT precisa interpretar a saída do compilador para poder "entender" os eventuais erros de compilação e mostrá-los na interface gráfica. No caso dos comandos de compilação executados pelo GCC isso é tratado pela classe org.eclipse.cdt.internal.errorparsers.GCCErrorParser. Tirando alguns detalhes da arquitetura interna do CDT que mudaram da versão 3.0 para a 4.0, se olharmos o código desta classe dá pra ver nitidamente várias coisas interessantes.

[Versão 3.0](http://dev.eclipse.org/viewcvs/index.cgi/org.eclipse.cdt/all/org.eclipse.cdt.core/src/org/eclipse/cdt/internal/errorparsers/GCCErrorParser.java?revision=1.16&root=Tools_Project&view=markup)

[Versão 4.0](http://dev.eclipse.org/viewcvs/index.cgi/org.eclipse.cdt/all/org.eclipse.cdt.core/src/org/eclipse/cdt/internal/errorparsers/GCCErrorParser.java?revision=1.26&root=Tools_Project&view=markup)

Quem deu uma olhada nos links acima pode ver que a primeira coisa que se nota é que a classe que usa regexp tem 65 linhas enquanto a versão anterior possui 298! É claro que ouveram outras alterações na arquitetura dos ErrorParsers do CDT entre as versões, mas a maior diferença se deve à mudança no paradigma de programação. Isso porque se olharmos bem a classe da versão 3.0 é possível ver que ela usa métodos da classe String para agilizar o trabalho de parsing. Se ao invês disso fosse usado o processamento byte a byte da String ela seria **muito** maior!

O uso de expressões regulares neste caso não só deixa o código menor mas também muito mais fácil de ser lido. É bem mais fácil entender o que é feito na classe da versão 4.0 do que na classe da versão 3.0. É claro que a eficiência de um mecanismo de interpretação de expressões regulares deve ser um pouco menor que um parsing direto da String. No entanto é importante lembrar de duas coisas neste caso: 1) pouco provavelmente você conseguirá desenvolver parsers do zero que sejam tão otimizados quanto as rotinas de regexp disponíveis e 2) manutenibilidade do código é tão primordial quanto eficiência e, no caso de mecanismos de parser, facilidade de leitura do código e entendimento é mais primordial ainda já que um código obfuscado pode simplesmente esconder o que o desenvolvedor queria fazer.
