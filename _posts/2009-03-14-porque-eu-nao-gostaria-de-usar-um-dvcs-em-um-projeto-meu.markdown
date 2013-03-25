---
author: laggarcia
comments: true
date: 2009-03-14 00:54:05
layout: post
slug: porque-eu-nao-gostaria-de-usar-um-dvcs-em-um-projeto-meu
title: Porque eu não gostaria de usar um dvcs em um projeto meu
wordpress_id: 483
categories:
- Desenvolvimento
- Ferramentas
- Opinião
tags:
- confiança
- Controle de versão
- dvcs
- git
- SVN
---

Há quase um ano atrás (confesso que não imaginava que era há tanto tempo), o Raphael falou [aqui](http://log4dev.com/2008/04/22/o-que-tem-de-tao-legal-em-usar-um-dvcs/) sobre o que há de legal em se usar um dvcs. É óbvio que as vantagens existem. Não vou nem tentar discordar disso. Mas queria compartilhar uma experiência, ainda que curta, que tive recentemente.

Trabalhei por algumas semanas em um projeto que estava utilizando git. A primeira impressão que me deu é que este tipo de sistema de controle de versão é muito mais burocrático que sistemas centralizados, como o SVN, por exemplo, com o qual trabalhei nos últimos 3 anos. Simplesmente porque alguém precisa ter uma árvore de código central e precisa administrar esta árvore. Quando você está utilizando um sistema de código centralizado todos acessam a mesma árvore de código e todos tem a mesma visão do estágio atual de evolução do código.

No caso de um dvcs cada pessoa tem sua própria árvore, o que certamente facilita o desenvolvimento em paralelo de algumas coisas, mas, no final das contas, sempre existe o trabalho de juntar todas as alterações em uma árvore central. E isso acaba gerando uma sobrecarga em cima da pessoa que é responsável por esta árvore.

No caso do projeto em que eu estava trabalhando tínhamos apenas uns 7 desenvolvedores, sendo apenas 3 ou 4 mais ativos, que, de certa forma, eram "obrigados" a confiarem um nos outros, já que todos estavam trabalhando para o mesmo projeto em uma mesma empresa. Ou seja, o argumento de confiança, que é muito forte em projetos de código aberto com dezenas ou até milhares de contribuidores, perde um pouco de força. E, ainda que todos confiem em todos, ainda existia a sobrecarga de um deles que administrava a árvore central de desenvolvimento.

Ou seja, no fim das contas, achei o processo mais burocrático e menos produtivo que se utilizássemos um sistema de controle de versão centralizado.

Agora, quer saber se eu fui contra o uso de git? Não fui. Por que? Porque todos na equipe nunca tinham usado um sistema de controle de versão distribuído e todos estavam a fim de aprender. E a melhor forma de aprender é colocando as coisas em prática com o comprometimento de todos. Mesmo que para alguns o processo seja mais burocrático e mais complicado que outras soluções disponíveis.
