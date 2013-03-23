---
author: mgalves
comments: true
date: 2006-04-12 10:18:14
layout: post
slug: divs-e-combos-no-ie
title: Divs e combos no IE
wordpress_id: 59
categories:
- Desenvolvimento
tags:
- Interfaces
- Javascript
- Web
---

Aposto que muitos desenvolvedores **Web** já tiveram o seguinte problema com **Internet Explorer**: criam um **DIV** (por exemplo, em um menu contextual, ou um tooltip), que aparece bonitinho na tela, mas que para seu desespero fica embaixo de uma caixa de seleção (o famoso combo box). O pior é quando se descobre isso um mês depois, quando um cliente resolve redimensionar a janela, e o combo box em questão vai parar no meio da área visível do **DIV**.

Quem já teve este problema, sabe que mudar o **z-index** não adianta nada, porque no **IE** o **combobox** fica acima de tudo, não levando em conta o parâmetro de profundidade.

Graças a algumas pesquisas do meu colega Christian, encontramos uma solução para isso: basta criar um **IFRAME** e colocar exatamente embaixo do **DIV**, com as mesmas coordenadas e tamanho e com zindex do **IFRAME** inferior ao do **DIV**. Por algum motivo que me escapa, o IFRAME encobre o COMBOBOX, e mesmo assim aceita o parâmetro de profundidade, exibindo o DIV de forma correta.
