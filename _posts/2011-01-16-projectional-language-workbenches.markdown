---
theme:
  name: twitter
author: bart
comments: true
date: 2011-01-16 16:56:43
layout: post
slug: projectional-language-workbenches
title: Projectional Language Workbenches
wordpress_id: 820
categories:
- Desenvolvimento
- Ferramentas
---

Eu pensei bastante em como traduzir esse nome, mas não gostei de "Bancada Projecional de Linguagens", então me perdoem mas vou usar em inglês mesmo. [Projectional Language Workbench](http://martinfowler.com/articles/languageWorkbench.html) é um termo cunhado pelo [Martin Fowler](http://martinfowler.com) pra descrever um novo tipo de ferramenta usada em programação orientada a linguagens. A idéia deste post é apresentar brevemente os principais conceitos por traz disso. Eu aconselho os interessados a ler os artigos do Martin Fowler e o [guia do MPS](http://confluence.jetbrains.net/display/MPSD1/MPS+User%27s+Guide) (em inglês).

Programação orientada a linguagens é um termo pra descrever a idéia de usar várias linguagens específicas de domínio (domain specific languages, DSLs) para desenvolver software. DSLs são linguagens criadas com um escopo limitado, o "domínio". A vantagem de uma DSL é que ela contém abstrações bem próximas ao domínio, então em teoria usuários conseguem se expressar mais facilmente do que em uma linguagem de propósito geral (general purpose language, GPL). Por exemplo, [lex e yacc](http://dinosaur.compilertools.net/) são DSLs para descrever lexers e parsers, respectivamente. Você não vai escrever o compilador inteiro com elas, mas são ótimas, concisas, pra descrever aquele domínio específico. Se você fez um curso de compiladores sabe muito bem o trabalho que daria pra escrever o lexer e o parser "na mão".

Um problema de se usar várias DSLs pra desenvolver um sistema é que nem sempre os domínios de cada DSL são tão bem separados como no caso de lexers, parsers e o backend do compilador. Muitas vezes as linguagens precisam interagir mais. Por exemplo, imagine que você tem um programa em Java e em alguma parte precisa definir uma máquina de estado. Um jeito é implementar a máquina de estado direto em Java. Outro jeito é criar uma DSL pra máquinas de estado, vamos chamar de SML (state machine language), que você pode reusar em vários projetos e que esconde detalhes da implementação Java. Mas então o código fonte teria que conter código Java e código escrito em SML. O problema é que as duas linguagens interagem, e escrever um compilador que entenda Java e SML é complicado.

É aí que entram projectional language workbenches. A idéia principal, a meu ver, é que o sistema é apresentado e desenvolvido por intermédio de projeções. DSLs são utilizadas pra descrever projeções do sistema e elas são compostas como meta-modelos. Por exemplo, você pode ver e manipular a sua máquina de estado usando uma projeção em Java ou uma projeção em SML. A sintaxe concreta usada pra cada projeção é definida por editores e você pode ter diversos editores pra uma linguagem. Por exemplo, SML pode ter uma sintaxe textual pra máquinas de estado, ou pode ter uma linguagem visual que mostre os estados e as transições como nós e setas. O que importa é que quando se manipula os conceitos no editor, se está manipulando o sistema através dessa projeção.

E qual é a vantagem? A principal, eu acho, é que se elimina o frontend do compilador e com isso vários dos problemas de se combinar linguagens. Ou seja, não existem mais lexers ou parsers, tudo o que existe é a abstract syntax tree (AST). O editor de Java não é um editor de texto, é um editor estruturado que permite manipular a AST diretamente. Dessa maneira, editores de diferentes linguagens podem ser compostos. Por exemplo, no seu editor de Java você pode visualizar a máquina de estados com o editor de SML.

E as desvantagens? Bom, eu acho que ainda existem muitos problemas. Não está claro ainda se desenvolvedores vão ser produtivos em editores estruturados. O fonte do sistema fica dependente de uma certa ferramenta (não se tem mais texto que pode ser compilado por diferentes ferramentas, se tem a descrição do sistema usando o meta-modelo específico daquela ferramenta). Além disso, ainda não está claro que tipo de problemas vão ocorrer agora que estamos compondo linguagens em um nível mais alto de abstração.

E onde pode-se ver esses conceitos em ação? Eu aconselho dar uma brincada com [MPS](http://www.jetbrains.com/mps/). MPS é uma implementação bastante sólida de projectional language workbenches sendo desenvolvida pela [Jetbrains](http://www.jetbrains.com) (que faz o IntelliJ IDEA). Em MPS você pode criar DSLs e combinar com Java e outras DSLs. O [Markus Voelter](http://www.voelter.de/) criou também uma implementacão em C pra desenvolver sistemas embarcados, num projeto chamado [mbeddr](http://mbeddr.wordpress.com/).

Será que projectional language workbenches vai ser o jeito de se programar no futuro? Não sei (provavelmente não), mas vale a pena observar o que está sendo experimentado, pois com certeza é um paradigma interessante e que pode trazer bons insights. E se tudo o que eu escrevi aqui parece abstrato demais, dê uma lida nos textos do Martin Fowler pois ele entra em detalhes. E também não hesite em fazer perguntas (eu tenho um pouco de experiência com MPS e posso tentar ajudar).

