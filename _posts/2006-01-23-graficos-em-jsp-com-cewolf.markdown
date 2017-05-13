---
theme:
  name: twitter
author: mgalves
comments: true
date: 2006-01-23 19:35:20
layout: post
slug: graficos-em-jsp-com-cewolf
title: Graficos em JSP com Cewolf
wordpress_id: 39
categories:
- Desenvolvimento
tags:
- Ferramentas
- Interfaces
- Web
- Java
---

Num tópico anterior, eu falei sobre a biblioteca JFreeChart para criação de gráficos, e mencionei uma taglib chamada [Cewolf](http://cewolf.sourceforge.net/new/index.html) para inserir gráficos gerados pela JFreeChart em páginas JSP. Na época não havia utilizado a taglib em questão..mas nos últimos dias usei bastante, portanto me sinto no dever de relatar a experiência.A biblotece fornece tags que encapsulam o processo de criação de gráficos usando JFreechart. A idéia é boa, porque JFreeChart gera uma grande quantidade de gráficos muito bonitos, e a documentação não está disponível, tornando sua utilização um pouco mais trabalhosa, sobretudo quando os prazos de seu software estão estourando a muito tempo. Para funcionar, é necessário instalar bibliotecas para manipulação de SVG, e XML, além obviamente do próprio JFreechart.

No site, tem um passo a passo bem legal, que permite que em poucos minutos se tenha um demo com gráfico na sua aplicação. A geração de dados é bastante simples, e requer apenas algumas linhas de código para obter os dados e converte-los no formato adequado. A taglib permite também gerar tooltips para os pontos do gráfico, e criar um mapa de links, fazendo com que o gráfico tenha funções de hipertexto, o que pode ser muito útil em alguns casos.

Porém, nem tudo são flores.....

O primeiro problema (que não é realmente um problema, mas sim uma restrição) é que nem todos os tipos de gráficos do JFreeChart estão disponíveis no Cewolf. Até que me provem o contrário, isto é pura preguiça. Mas talvez existam motivos mais nobres. Mas tudo bem, os principais tipos estão contemplados.

O segundo problema, um pouco mais chato, é que a parte de geração dos dados, que deve ser implementada pelo usuário, requer algun conhecimento mínimo do JFreeChart. Portanto, algumas visitas à API da biblioteca são necessárias.

O terceiro (e principal problema) é, pra variar um pouco, documentação. Como todo softwarte livre, ela é problemática. Mas neste caso, tem um agravante: a pouca documentação que existe no site está ERRADA !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
O site contém a API das taglibs, com informações sobre as tags, parâmetros possíveis e valores aceitos para cada parâmetro. Com exceção de alguns parâmetros que se mantém, a impressão que tive é que a documentação está defasada em relação à biblioteca. No meu caso, só não se tornou um pesadelo porque os comentários dentro do descritor da taglib estão corretos, e estes comentários são lidos pelo eclipse e exibidos como documentação, e eu uso eclipse, e assim por diante....

Assim sendo:

Nota final: 10 pela idéia, 6 pela implementação, 0 pra documentação. Média 5 e alguma coisa.

No final das contas, vale a pena dar uma olhada, porque ainda acho que enfiar gráficos dinâmicos a seco deve ser mais trabalhoso.
