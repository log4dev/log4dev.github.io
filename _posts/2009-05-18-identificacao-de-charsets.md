---
title: Identificação de charsets
author: Leonardo Garcia
layout: post
permalink: /2009/05/18/identificacao-de-charsets/
dsq_thread_id:
  - 64846575
categories:
  - Desenvolvimento
  - Design
  - Ferramentas
  - Teoria
tags:
  - charset
---
# 

Hoje, para variar, vou falar sobre outra coisa que me incomoda. Aliás, que me incomodava.

Sempre fiquei muito intrigado com um fato que recorrentemente eu presenciava: precisava ler um arquivo de “texto puro” mas, quando abria o arquivo, lá estavam vários caracteres esquisitos ou pontos de interrogação ou qualquer coisa que não deveria estar lá. Ou seja, o programa que eu estava usando não conseguia reconhecer adequadamente o *charset* do arquivo e, quando tentava mostrar os caracteres usando o *charset* padrão do programa, um punhado de coisa ficava zuada.

Ficava sempre pensando que alguma coisa idiota devia estar acontecendo, afinal de contas, como um programa não conseguia reconhecer um *charset*? Tantos anos de evolução na computação e uma coisa simples como esta ainda não funcionava direito? Tentava de várias formas bolar uma solução para isso mas, qualquer coisa que eu pensava, não era uma solução que eu achasse viável. Afinal, a maneira mais fácil de identificar um *charset* seria colocar uma espécia de meta-dado no arquivo, como é (deveria ser) feito com páginas web (mas nem sempre funciona também por falhas nos programas!). E aí o arquivo deixaria de ser um arquivo de “texto puro”.

Enfim, não tinha uma solução para este “problema” e, pelo jeito, via que ninguém mais tinha, afinal o problema continuava existindo. Mas ele continuava me incomodando de tempos em tempos.

Até que li [este texto][1] do Joel. E aquietei meu espírito em relação a este problema. O texto inteiro é bom, especialmente a parte final *The Single Most Important Fact About Encodings*. E o que resume tudo é esta frase: *There Ain’t No Such Thing As Plain Text*. Ou, numa tradução livre: “Não existe algo como texto puro”.

 [1]: http://www.joelonsoftware.com/articles/Unicode.html

Ou seja, tudo aquilo que é mostrado pelo programa que abre arquivos de “texto puro” é simplesmente uma abstração. Esqueça os caracteres. Eles são apenas interpretação dos dados reais binários. Qualquer representação dada a eles é apenas resultado de algum processamento por trás que tenta ou não identificar qual foi o *charset* usado para criar o arquivo.

Por mais óbvio que isso seja e por mais que eu soubesse disso, é engraçado como eu não ligava este simples fato à minha inquietudade em relação ao processamento de arquivos textos pelos programas.

Feito isso, com a ajuda do Joel, problema resolvido!