---
theme:
  name: twitter
author: alexandre
comments: true
date: 2008-04-25 16:45:05
layout: post
slug: good-bug-bad-bug-2
title: Good bug - Bad bug
wordpress_id: 283
categories:
- Desenvolvimento
tags:
- Bioinformatica
- Qualidade de Software
---

Para a felicidade de nosso **editor-chefe**, e para não ficar com a fama de ser o último a atender os incansáveis pedidos do mesmo, eis que após me deparar com um post que li no [Suicyte Notes](http://suicyte.wordpress.com/), um blog sobre bioinformática e coisas afins (viu **editor-chefe**, não só escrevo algo, como este algo é sobre bioinformática!!) e me animei a escrever.  
  
  
O [post](http://suicyte.wordpress.com/) comenta sobre um [artigo que saiu na Nature](http://www.nature.com/doifinder/10.1038/nbt0308-274), onde os autores descobriram um erro no programa utilizado para construir as famosas matrizes [BLOSUM](http://en.wikipedia.org/wiki/BLOSUM) - matrizes utlizadas para pontuar alinhamentos entre aminoácidos, que se baseiam nas probabilidades de substituição de um aminoácido em outro (se tiver mais interesse no assunto, cheque os links). Estas matrizes têm sido empregadas por mais de 15 anos, e servido de base em diversos estudos científicos. Imagine o impacto que a descoberta deste bug não teria, levando milhares de pesquisadores a rever seus resultados.  
  
  
No entanto, para a sorte dos autores do programa - Steven e Jorja Henikoff - que gerou estas matrizes, _Murphy_ estava de férias naquele dia. O autor do artigo corrige o problema, refaz as matrizes, e faz a comparação entre as matrizes "zicadas" e as corrigidas. Resultado: as matrizes "zicadas" funcionam melhor que as corrigidas. Quisera [Geoffrey Chang](http://en.wikipedia.org/wiki/Geoffrey_Chang) tivesse essa sorte.  
  
  
Chang é um pesquisador que no início do ano passado, teve que se [retratar publicamente](http://www.the-scientist.com/news/home/39805/), após ter publicado cinco artigos sobre estruturas de duas proteínas que ele e sua equipe haviam determinado. Cinco anos depois do primeiro artigo, 720 citações, e a comprovação por parte de outros grupos que as estruturas que eles haviam determinado estavam erradas, Chang e seus amigos descobriram um _bug_ no programa que eles haviam criado, que resultou nas estruturas erradas. Ou seja, todos que desenvolveram pesquisas confiando nas descobertas de Chang, se deram mal. Incineração de filme no mais alto grau.  
  
  
Fica aí a dica: se você não testa seus códigos, torça pra ter a sorte de Steve e Jorja, senão você pode se dar mal como Chang.  
  

