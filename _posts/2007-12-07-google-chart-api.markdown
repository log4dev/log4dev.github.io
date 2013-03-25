---
author: mgalves
comments: true
date: 2007-12-07 09:22:04
layout: post
slug: google-chart-api
title: Google Chart API
wordpress_id: 222
categories:
- Desenvolvimento
tags:
- API
- Desenvolvimento
- Google
- Gráfico
- Web
---

Na série "pequenos serviços que a Google oferece gratuitamente en passant e que podem ser uma mão na roda", acabei de ver o anúncio do Google Chart API. Simples: crie uma URL, e o Google te retorna uma imagem com um gráfico.

Alguns exemplos, criados dinamicamente:

![](http://chart.apis.google.com/chart?cht=lc&chs=200x125&chd=s:helloWorld)

`http://chart.apis.google.com/chart?cht=lc&chs=200x125&chd=s:helloWorld`

![](http://chart.apis.google.com/chart?cht=lc&chs=200x200&chd=t:50,20,60,10,5)

`http://chart.apis.google.com/chart?cht=lc&chs=200x200&chd=t:50,20,60,10,5`

Não que isto seja a última bolacha do pacote, existem muitas boas APIs para gerar gráficos por aí open source. Mas pode ser útil para quem não pode instalar coisas no servidor e precisa de gráficos simples. A API oferece gráficos de linha, puiecharts, gráficos de Venn, gráficos de barras, gráficos de pontos e outros.

E a API está bastante bem documentada: [http://code.google.com/apis/chart/](http://code.google.com/apis/chart/) .
