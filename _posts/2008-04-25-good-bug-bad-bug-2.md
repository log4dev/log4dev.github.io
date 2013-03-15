---
title: 'Good bug &#8211; Bad bug'
author: Alexandre Barbosa
layout: post
permalink: /2008/04/25/good-bug-bad-bug-2/
dsq_thread_id:
  - 64842105
categories:
  - Desenvolvimento
tags:
  - Bioinformatica
  - Qualidade de Software
---
# 

Para a felicidade de nosso **editor-chefe**, e para não ficar com a fama de ser o último a atender os incansáveis pedidos do mesmo, eis que após me deparar com um post que li no [Suicyte Notes][1], um blog sobre bioinformática e coisas afins (viu **editor-chefe**, não só escrevo algo, como este algo é sobre bioinformática!!) e me animei a escrever.  
  
  
O [post][1] comenta sobre um [artigo que saiu na Nature][2], onde os autores descobriram um erro no programa utilizado para construir as famosas matrizes [BLOSUM][3] – matrizes utlizadas para pontuar alinhamentos entre aminoácidos, que se baseiam nas probabilidades de substituição de um aminoácido em outro (se tiver mais interesse no assunto, cheque os links). Estas matrizes têm sido empregadas por mais de 15 anos, e servido de base em diversos estudos científicos. Imagine o impacto que a descoberta deste bug não teria, levando milhares de pesquisadores a rever seus resultados.  
  
  
No entanto, para a sorte dos autores do programa – Steven e Jorja Henikoff – que gerou estas matrizes, *Murphy* estava de férias naquele dia. O autor do artigo corrige o problema, refaz as matrizes, e faz a comparação entre as matrizes “zicadas” e as corrigidas. Resultado: as matrizes “zicadas” funcionam melhor que as corrigidas. Quisera [Geoffrey Chang][4] tivesse essa sorte.  
  
  
Chang é um pesquisador que no início do ano passado, teve que se [retratar publicamente][5], após ter publicado cinco artigos sobre estruturas de duas proteínas que ele e sua equipe haviam determinado. Cinco anos depois do primeiro artigo, 720 citações, e a comprovação por parte de outros grupos que as estruturas que eles haviam determinado estavam erradas, Chang e seus amigos descobriram um *bug* no programa que eles haviam criado, que resultou nas estruturas erradas. Ou seja, todos que desenvolveram pesquisas confiando nas descobertas de Chang, se deram mal. Incineração de filme no mais alto grau.  
  
  
Fica aí a dica: se você não testa seus códigos, torça pra ter a sorte de Steve e Jorja, senão você pode se dar mal como Chang.  
  


 [1]: http://suicyte.wordpress.com/
 [2]: http://www.nature.com/doifinder/10.1038/nbt0308-274
 [3]: http://en.wikipedia.org/wiki/BLOSUM
 [4]: http://en.wikipedia.org/wiki/Geoffrey_Chang
 [5]: http://www.the-scientist.com/news/home/39805/