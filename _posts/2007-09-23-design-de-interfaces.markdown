---
theme:
  name: twitter
author: mgalves
comments: true
date: 2007-09-23 19:55:28
layout: post
slug: design-de-interfaces
title: Design de interfaces
wordpress_id: 188
categories:
- Desenvolvimento
- Design
tags:
- Interfaces
- Qualidade de Software
---

Aproveitando o [artigo do Raphael sobre o design de um produto ou de uma solução](http://log4dev.com/2007/09/21/startup-mantra-i-design-e-tudo-que-importa/), quero falar aqui sobre o design de um dos aspectos de um produto de software, que é a **interface homem máquina**.

Se perguntarmos para 100 pessoas qual a principal característica da Apple por exemplo, muito provavelmente 98 dirão que é o design de seus produtos (os 2 outros dirão que é o preço absurdo..mas isto está mudando!). Tudo o que sai da empresa do Tio Jobs prima pela beleza, atenção nos detalhes e simplicidade de uso. Nada mais simples e clean do que um iPod shuffle, com seus 4 controles. Alguém me disse um dia que primeiro eles definem como o produto vai ser, depois eles pensam como fazer para que ele seja daquele jeito. Não duvido disso.

A Google é outra que merece destaque no quesito interfaces. Não pela beleza: as interfaces deles são muitas vezes feias. Mas eles inovaram no quesito simplicidade, usabilidade e interatividade, mostraram ao mundo um novo jeito de interagir com sites na internet. O melhor exemplo disso é a tela inicial do motor de busca, uma tela branca e um campo de texto (na verdade, o motivo inicial desta tela espartana foi a falta de conhecimento de HTML dos fundadores Brin e Page). E nada mais eficiente, rápido e leve do que a interface do GMail, ou do Google Maps. E basta ver a quantidade de ofertas de empregos para engenheiros de interação em Seattle ou New York.

E existem muitas outras empresas que claramente se preocupam com a qualidade da forma como os usuários irão interagir com seus produtos. Flickr, Adobe, 37 signals...

Ok, back to Brazil.

A minha experiência pessoal é de que interface é encarada como um mal necessário na maioria dos projetos. Sobretudo em projetos para empresas. Infelizmente ainda não tive a oportunidade de trabalhar em projetos para o grande público, ou pelo menos em projetos onde quem paga é efetivamente quem usa. Talvez seja diferente. Mas em projetos enterprise, é assim.

Em projetos web, o melhor que podemos ter é uma interface construída em photoshop e um web designer para dar um ar mais profissional para a coisa. Daí o cliente vê a interface (em geral photoshop), e usa todo o seu conhecimento (em geral inexistente) em interação para aprovar. Por fim pegam algum computeiro que esteja sem nada melhor pra fazer e mandam ele implementar a interface.

Eu posso contar nos dedos de uma mão o número de desenvolvedores que eu conheço que gostam de trabalhar com interfaces. Acho que não preciso discutir os problemas de pôr alguém pra fazer algo que não gosta, e que acha que é um mal necessário. Preciso?

Sem contar que a maioria das vezes, as interfaces se resumem a listagens gigantescas e formulários. Nada contra eles,  muitas vezes resolvem. A questão é quando tratamos com quantidade gigantescas de dados (o que é bastante comum hoje em dia, tanto em sistemas empresariais quanto em sistemas para o grande público). Grandes chances de que muito rapidamente se perceba que a interface é pouco produtiva, lenta...

Não estou aqui advogando pela otimização precoce de um sistema. Estou advogando pelo estudo cuidadoso de projetos de interface e interação quando a questão da quantidade de dados/eficiência de uso é algo facilmente previsível e sobretudo crítico para o sucesso do projeto. Exemplos de interfaces que requerem um certo estudo? Que tal uma tela que tenha que sintetizar graficamente uma tabela de excel de 500 colunas por 3000 linhas, permitindo que decisões possam ser tomadas a partir de uma análise rápida do conjunto ou então que dados isolados sejam facilmente encontrados e manipulados em um mesmo ambiente? Ou então uma listagem com milhares de nomes acessada centenas de vezes por dia, onde seja imperativo encontrar um nome específico ou  conjunto de nomes que atendam certas características de forma rápida?

Um bom projeto de interface requer uma equipe especializada nisso, que saiba lidar com aspectos teóricos (usabilidade, acessibilidade, modelos mentais, metáforas, affordance), com aspectos técnicos (Javascript, HTTP, programação backend eficiente), e com aspectos gráficos e de layout (cores, fontes, posicionamento de elementos). Requer gente que tenha interesse pelo assunto, e que se preocupe com detalhes. Requer estudos, protótipos, testes. Requer  coerência com o resto do sistema, e com o tipo de usuário que deverá utilizar o sistema. Requer pensar um pouco out of the box: muitas vezes, as soluções padrão não resolvem o problema adequadamente.

Resumindo: requer dedicação e tempo.  Não pensar nisso pode ser o barato que sai caro.

Sugiro, a quem tiver interesse em trabalhar com design de interfaces, dar uma lida no texto do Joel Spolsky sobre tema: [**User Interface Design for Programmers.** ](http://www.joelonsoftware.com/uibook/chapters/fog0000000057.html)
