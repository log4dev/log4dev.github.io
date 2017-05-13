---
theme:
  name: twitter
author: mgalves
comments: true
date: 2007-08-10 10:12:11
layout: post
slug: lendas-urbanas-custo-de-alocacao-em-java
title: 'Lendas urbanas: custo de alocação em Java'
wordpress_id: 164
categories:
- Desenvolvimento
tags:
- C
- Java
- Linguagens de Programação
- Pesquisa
---

Segundo [este artigo](http://www-128.ibm.com/developerworks/java/library/j-jtp09275.html?ca=dgr-jw22JavaUrbanLegends) da IBM, estudos mostram que o **tempo de alocação de um objeto** em **Java**,  utilizando a palavra chave new, **é menor que o custo de um malloc em C**. Os dados são interessantes: um new requer 10 instruções de máquina, enquanto que um malloc requer entre entre 60 e 100 instruções.  Outro dado interessante do artigo é que o uso do **Garbage Collector** tornaria o processo mais eficiente do que o gerenciamento manual de memória, pelo fato do primeiro tratar de blocos maiores.

Meus comentários a respeito:



	
  1. A performance de Java melhorou muito ao longo do tempo. Mas o footprint da JVM, para qualquer programinha,  ainda é muito grande. Alocação de objetos em Java pode ser mais rápido do que em C/C++, mas com certeza programas em C/C++ fazem um uso mais racional de memória.

	
  2. Esta área de otimização de memória, footprint, execução é a área de aprimoramento que a Sun deveria se concentrar exclusivamente, em vez de ficar inventando moda com closures, Java FX e outras coisas script-like. Java não vai conseguir concorrer com linguagens de script. Java tem que concorrer com C++.

	
  3. A minha experiência com alocação de grandes quantidades de dados em Java, aplicada ao processamento de sequências genéticas, não foi das melhores.


