---
theme:
  name: twitter
author: mgalves
comments: true
date: 2008-07-29 00:42:21
layout: post
slug: minhas-primeiras-impressoes-sobre-o-latex
title: Minhas primeiras impressões sobre o LaTeX
wordpress_id: 335
categories:
- Ferramentas
tags:
- Ferramentas
- LaTex
- Tex
---

**Por Rafael Naufal**

Há um bom tempo eu já queria experimentar o [LaTeX](http://en.wikipedia.org/wiki/LaTeX). Sempre ouvi falar muito bem dele, principalmente por amigos que fazem mestrado/doutorado. Quando comecei a fazer meu curso de pós-graduação em Engenharia de Software no ITA, sabia que este era o momento de experimentar esta ferramentatão poderosa . Não via a hora de dar um basta em Word e Open-Office.

E este momento chegou.

Para quem não conhece, o LaTeX é  construído sobre a ferramenta TeX, que permite aos autores de trabalhos acadêmicos obter alta qualidade tipográfica, criado por [Leslie Lamport](http://en.wikipedia.org/wiki/Leslie_Lamport) em meados da década de 80.  O [TeX](http://en.wikipedia.org/wiki/TeX) é um software de tipografia desenvolvido por [Donald Knuth](http://en.wikipedia.org/wiki/Donald_Knuth) na década de 70 para a edição de textos com ótima apresentação gráfica e qualidade tipográfica, principalmente com foco em fórmulas matemáticas. Knuth, na época, desenvolveu o TeX para escrever sua mais famosa coletânea de livros  [The Art of Computer Programming](http://en.wikipedia.org/wiki/The_Art_of_Computer_Programming), pois não encontrava um sistema tipográfico decente na época. Basicamente, o LaTeX  adiciona um conjunto de comandos no texto que definem como o sistema de processamento do TeX irá formatá-lo.

O texto em LaTeX é digitado com vários comandos inseridos, como se fosse um código em alguma linguagem de programação. Estes comandos definem o tipo da fonte, a formatação do texto, capítulos, seções, caracteres especiais, tamanhos de margem, etc. Isto torna o sistema diferente da metodologia [WYSIWYG](http://en.wikipedia.org/wiki/WYSIWYG), em que o texto escrito é exatamente como ele será visto no resultado final do processamento. Apenas para constar, todo comando em se inicia com uma barra invertida (\). Arquivos LaTeX são criados com a extensão **.tex** e o texto deve ser compilado, podendo ser em um arquivo binário de extensão [DVI](http://en.wikipedia.org/wiki/Device_independent_file_format) ou **PDF**. O fato de ter que compilar o texto pode representar uma quebra de paradigma para o editor do texto, mas o resultado final é muito bom, de alta qualidade tipográfica, como se o texto tivesse sido editado e diagramado em uma "editora".

As grandes vantagens que vejo em utilizar o LATEX ao invés de um editor WYSIWYG comum, como o Word ou OpenOffice, são as seguintes:



	
  1. O LATEX, por meio das suas macros, permite que você defina como o texto deve ser apresentado e formatado, da mesma forma como o CSS trabalha com HTML/XHTML. A idéia é com que você se preocupe apenas com seu texto e não como ele deve ser formatado. Deixe esse trabalho para o TEX!!

	
  2. Fórmulas matemáticas, exibidas pelo LATEX, são extremamente elegantes.

	
  3. O LATEX gerencia toda e qualquer numeração de capítulos, seções, listas, figuras e tabelas, rodapés, etc. Quem nunca xingou o M$$ Word por causa de suas numerações e bullets sempre fora de lugar e com o famoso "Continuar com a numeração anterior"? :-)

	
  4. O TEX é portável e gratuito, isso quer dizer que funciona na maioria dos hardwares existentes.

	
  5. É possível informar ao LATEX bibliotecas adicionais para, por exemplo, especificar referências bibliográficas segundo uma norma vigente ( ex: [NBR 6023](http://www.unb.br/ciord/informacoes/defesa/abnt_nbr6023_2002_referencia.pdf)). Um projeto interessante é o [abnTEX](http://abntex.codigolivre.org.br/).

	
  6. Não se preocupe com o layout, apenas com estrutura do documento!!


Como um rápido exemplo, teríamos a seguinte construção em LATEX:  ` `

`\documentclass[a4paper]{article} \begin{document} Seu texto aqui.... \end{document} `

O código acima define um arquivo LATEX mínimo, em que é definida a utilização da classe artigo em um papel de tamanho A4. Dentro das tags _\begin{document}_ e _\end{document}_ o texto deve ser digitado. Estas construções, ao serem compiladas pelo TEX e como opção gerarem um documento **PDF**, já produzem  um resultado final excelente, bem diferente do Word.

Você pode encontrar boas referências sobre o pacote [aqui](http://omnis.if.ufrj.br/%7Eleandro/metcomp/doc/latex.pdf) e  [aqui](http://tug.ctan.org/info/lshort/portuguese-BR/lshortBR.pdf). E deixo aqui um desafio: mesmo que seja fã do Word, tente criar um documento em LaTEX uma vez e veja o resultado final! Aposto que, depois, você não vai querer parar de escrever seus textos com ele!

**Rafael Naufal é Engenheiro de Software, Mestrando pelo ITA e autor do blog [http://rnaufal.livejournal.com](http://rnaufal.livejournal.com)**
