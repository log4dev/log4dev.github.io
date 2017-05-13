---
theme:
  name: twitter
author: mgalves
comments: true
date: 2006-06-13 00:18:36
layout: post
slug: python-primeiras-impressoes
title: '[Python] Primeiras impressões'
wordpress_id: 69
tags:
- Linguagens de Programação
- Python
---

Bom, lendo meus últimos artigos, dá pra perceber que ultimamente andei brincando com Python. Fazia algum tempo que queria aprender esta linguagem, mas sempre rolava aquela preguiça básica. Há 3 semanas atrás tomei coragem, e comecei a programar.

Os motivos que me fizeram ficar interessado foram vários. Ouvi pela primeira vez falar de Python quando trabalhava no projeto AURORA, no CenPRA. Na época, a definição que me deram era que Python era uma ótima linguagem para integração de sistemas: uma espécie de cola. Depois li vários artigos que elogiavam a linguagem pela  limpeza sintática e pela facilidade e velocidade de desenvolvimento de código. Além do mais, eu frequentemente preciso escrever alguns scripts para execução de tarefas cotidianas: a solução adotadas por outros desenvolvedores que trabalham comigo é Perl, que apesar de ser altamente poderosa, eu tenho sérios bloqueios com a sintaxe. No final, acabava optando por Java que pra pequenas tarefas cotidianas não é a mais adequada em geral, apesar de ser minha linguagem preferida e na qual tenho maior fluência. O argumento derradeiro foi saber que o  Google utiliza muito Python...

O fato é que acabei começando a aprender, e devo dizer que gostei. A estratégia de aprendizagem foi simples: comecei programando algoritmos básicos de computação (merge  sort, quicksort, selection sort, heap sort, lista ligada, fibonacci, fatorial), para exercitar comandos básicos da linguagem como recursão, chamada de funções, if-then-else, loops, declaracão de variáveis, manipulação de listas, dicionário, tuplas e outras estruturas de dados. Depois, comecei a usar Python para escrever scripts "real life", ou seja, scripts que tinham alguma funcionalidade no meu dia a dia. Veio a calhar pois atualmente estou processando algumas dezenas de milhares de arquivos contendo dados genéticos, e preciso executar operações como leitura e escrita de arquivos, análise de textos utilizando expressões regulares e geração de relatórios simples.

Não sou expert na linguagem ainda. Longe disso. Apenas escrevi algumas centenas de linhas de código, e não utilizei todos os recursos disponíveis (como orientação a objeto), portanto as impressões que colocarei aqui são apenas preliminares...

De fato a linguagem é bem limpa sintaticamente, e bem fácil de escrever. A questão do uso de indentação para separação dos blocos, que é o motivo principal de reclamação das pessoas que não gostam de Python, não chega  a ser um problema quando se tem um editor apropriado (no meu caso estou usando Emacs  com Python Mode): o efeito colateral é que  o código é naturalmente  organizado e fácil de ler. A documentação, centralizada no site  [www.python.org](http://www.python.org),  é bem feita, com tutoriais para vários níveis, referencias, livros e mini how-tos, além de listas de discussões bem ativas.

As  listas, tuplas e dicionários  (também conhecidos como hashes) são o grande forte da linguagem, que possui funções e recursos sintáticos muito poderosos para manipulação destas. Segundo artigos que li, a implementação de hash de Python é uma das mais eficientes que existe. As  variáveis  em Python são dinamicamente tipadas: não se declara tipo de uma variável, mas uma vez que se atribui um tipo de variável, não se pode atribuir outro tipo de objeto.

O processo de IO (leitura e escrita básica de dados em arquivo) é muito simples e eficiente, assim como  a implementaçnao de  regexp. O modo de uso deste último não é tão direto quanto Perl, e se assemelha muito ao modelo implementado por Java, com patterns e matchers. Não consegui encontrar nenhum artigo comparando a performance das duas linguagens nesse quesito, mas minha experiência atual mostra que não existe uma grande diferença de velocidade...algum dia verifico isso.

Um ponto que eu não gostei muito: o fato de que Python, ao contrário de Perl, Java, C, C++ e outras linguagens, não possui escopo de bloco para variáveis. Ou seja: variáveis declaradas dentro de um bloco for, if ou while são  válidas e visíveis fora dele. O escopo de  variáveis é função, módulo, objeto ou método. Também não gosto muito do fato de bastar atribuir um valor a uma variável que ela passa a existir: um modo strict semelhante ao Perl seria bem vindo.

Alguns pontos importantes restam a ser analisados e aprendidos, como orientação a objeto, reflection, organização de pacotes e uso de bibliotecas como processamento de XML, sockets, HTTP e acesso à base de dados. Isso fica para um próximo artigo.
