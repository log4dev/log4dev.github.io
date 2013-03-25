---
author: lullis
comments: true
date: 2009-03-06 06:00:04
layout: post
slug: job4dev-no-github
title: Job4Dev no Github
wordpress_id: 471
categories:
- Desenvolvimento
---

Dando prosseguimento ao plano de [tornar o Job4Dev open-source](http://log4dev.com/2009/02/27/job4dev-open-source/), peguei quase tudo que estava no meu computador, criei um repositório do git (local) e publiquei no Github.

Leal público do Log4Dev, conheça o [Jobboard](http://www.github.com/lullis/jobboard). Algumas consideracões:



	
  * Não adicionei ainda os cabeçalhos de licença, mas considere o código como GPLv2. Comparada a uma licença mais liberal, como a BSD ou MIT, a diferença prática é pequena. Mesmo sob GPL, um sujeito pode pegar o código, fazer modificações e não precisa entregar o fonte, já que é uma aplicação web.

	
  * Por outro lado, o nome **Job4Dev** acaba sendo nossa marca, portanto não tem uso livre e irrestrito. Eu passei um bom tempo tirando as referências ao nome Job4Dev do código. Não sei se meu grep foi perfeito. Se encontrar alguma coisa, por favor, mude para o nome "genérico" **jobboard**.

	
  * Esse código **_não_** é o código que está no ar em produção. A versão online ainda é a do Miguel. A versão disponível é um crime cometido por mim.

	
  * Eu duvido que a aplicação vai rodar de cara. Você vai precisar de um arquivo de settings, por exemplo, o qual eu não deixei disponível. Pretendo adicionar um _settings.py.sample_ em breve.

	
  * Se você quiser ajuda para colocar a bagaça para rodar, abra tickets no [assembla](https://www.assembla.com/spaces/tickets/index/bgBoeMcqir3OyGeJe5afGb). Eu até usaria o ClockingIT para isso, mas não achei jeito mais fácil de fazer integração do clockingIT com o Github.

	
  * Há bugs conhecidos e certamente há bugs desconhecidos. Para aprender mais sobre o Django, eu quebrei muita coisa no código do Miguel para tentar depois re-encaixar as peças. Há provavelmente features que foram removidas que precisam ser re-escritas. Há código que está solto. Não estranhe se você encontrar funcionalidade que está implementada só em server-side, mas não client-side, e vice-versa.

	
  * Eu não tive intenção de ter deixado nenhum easter-egg. Portanto, se tiver algum arquivo esquisito - como uma foto minha dançando a macarena, por exemplo - considere tal artefato como um placeholder de (muito) mau-gosto e sinta-se livre para apagar tal arquivo.


