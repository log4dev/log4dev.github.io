---
author: alexandre
layout: post
title: "Calatrava"
slug: calatrava
comments: true
date: 2013-09-12
description: ""
category: 
tags: [Mobile, iOS, Android]
---
{% include JB/setup %}

A questão da experiência do usuário (UX) tem se tornado cada vez mais importante no desenvolvimento de aplicações, em especial no mundo das aplicações móveis, em função das limitações físicas dos dispositivos, e das especificidades de cada plataforma. Idealmente, desenvolver uma aplicação nativa para cada plataforma seria a melhor solução, pois pode-se assim entregar ao usuário a melhor experiência de acordo com os padrões definidos para o seu dispositivo. No entanto, isto implicaria em um alto investimento em desenvolvimento. Neste instante, passamos a pensar em alternativas para reduzir este investimento.

[Calatrava](http://calatrava.github.io/) é um _framework_ que se apresenta como uma destas alternativas (ao menos quando se pensa em _iOS_, _Android_ e _Web Mobile_). Diferente de outros _"cross platform frameworks"_ como [PhoneGap](http://phonegapcom) que substitui o poder das interfaces nativas por interfaces _web_, **Calatrava** permite que você desenvolva a lógica de sua aplicação em _JavaScript_, e então a compartilhe entre as diversas plataformas.

Para tanto este _framework_ faz uso da separação entre a camada de apresentação e a lógica do domínio. **Calatrava** define o conceito de _Page_, que corresponde à uma tela ou página de sua _app_. Em uma aplicação para _iOS_ uma _Page_ é implementada por uma _ViewController_, em _Android_ por uma _Activity_, e para _Web Mobile_ por um trecho de [Haml](http://haml.com) e [CoffeeScript](http://coffescript.com).

Uma _Page_ emite eventos que são processados por _controllers_, que implementam a lógica de sua aplicação em _JavaScript_. Estes _controllers_ são executados em um interpretador _JavaScript_ embarcado na aplicação nativa. **Calatrava** então provê uma _bridge_ nativa, que faz a orquestração entre as _pages_ e os _controllers_.

Esta estratégia permite ainda uma estratégia de desenvolvimento evolutivo: desenvolva inicialmente sua aplicação para _Web Mobile_ e então utilize a interface _web_ implementada nas aplicações _iOS_ e _Android_. Para tanto, basta que em _iOS_ as _pages_ sejam implementadas por extensões de _WebViewController_, e em _Android_ por extensões de _WebViewActivity_. A partir disto, pode-se evoluir as aplicações nativas _iOS_ e _Android_ uma _page_ de cada vez, iniciando-se por aquelas que mais se beneficiariam com os elementos nativos.

O projeto é recente, e tem ainda muito a caminhar. Atualmente, a maior deficiência desta plataforma está no restrito número de _plugins_ para integração de elementos nativos com o código de negócio. No entanto, o código é aberto, o que permite que qualquer um colabore para sua evolução, e por isto acredito que em breve esta plataforma estará em um nível de maturidade comparável ao [PhoneGap](http://phonegapcom), por exemplo.
