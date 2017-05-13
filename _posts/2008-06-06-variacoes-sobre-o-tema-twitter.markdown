---
theme:
  name: twitter
author: mgalves
comments: true
date: 2008-06-06 01:25:13
layout: post
slug: variacoes-sobre-o-tema-twitter
title: Variações sobre o tema Twitter
wordpress_id: 310
categories:
- Desenvolvimento
- Opinião
tags:
- Base de Dados
- Redes Sociais
- Escalabilidade
- Twitter
---

Hoje de manhã li uma notícia sobre o [Twitter](http://twitter.com) que gerou várias discussões interessantes com várias pessoas sobre vários temas que considero relevantes. Achei que seria interessante repassar os pontos discutidos aqui.

Tudo começou com uma discussão sobre as causas da instabilidade que vem assombrando o Twitter nos últimos dias. Fenômeno da internet, o microblog parece estar sofrendo dos altos índices de popularidade e tem passado mais tempo fora do ar do que dentro dele (aliás, neste momento em que vos falo, o dito cujo nem responde com a tradicional tela de erro).

Quem acabou levando a culpa foi o também famoso [Ruby On Rails](http://www.rubyonrails.org/), que serve de base para o funcionamento do site. Foi noticiado que eles estariam com problemas de escalabilidade (ah... a escalabilidade... suspiros), e que a equipe de desenvolvimento estaria considerando migrar para PHP ou Java. Obviamente os advogados de Java de plantão se uniram e começaram a malhar o Rails. Afinal, como todos sabemos, "só Jesus salva, e só Java escala."

Neste momento, cabe um comentário: programo em Java desde 96, adoro a linguagem e inclusive ganho o meu pão de cada dia com ela. Mas esse mito da escalabilidade única de Java me dá calafrios...

E ainda cabe outro comentário: a dúvida entre PHP e Java é pouco lisonjeadora pra esta última....

Voltando: eu não conheço RoR, não conheço Ruby, não sou fã da sintaxe da linguagem, e sinceramente não tenho motivos pra defender ou atacar nenhum dos dois. Mas, como diria meu colega Raphael: **linguagem não escala**, **quem escala é a arquitetura do sistema**, e parecia óbvio que havia um problema de arquitetura e infraestrutura por trás.

E não deu outra. No final de maio, o [próprio blog do Twitter](http://blog.twitter.com/2008/05/its-not-rocket-science-but-its-our-work.html) publicou uma entrevista comentando os problemas que eles vem enfrentando e ficou claro que no caso deles, o buraco é bem mais embaixo:

_Q: Is it true that you only have a single master MySQL server running replication to two slaves, and the architecture doesn’t auto-switch to a hot backup when the master goes down?
A: We currently use one database for writes with multiple slaves for read queries. As many know, replication of MySQL is no easy task, so we've brought in MySQL experts to help us with that immediately. We've also ordered new machines and failover infrastructure to handle emergencies. _

Resumindo: o Twitter tem como base 3 computadores!!!  Provavelmente eles são adeptos da famosa frase do Knuth que diz que otimização prematura é fonte de problemas. Eu também concordo com isso, mas com ressalvas. Acho que existem [otimizações maduras](http://log4dev.com/2007/10/23/otimizacao-madura/) que são necessárias e sempre bem vindas.

Mais pra frente, existe um outro ponto que achei interessante: Segundo o artigo, eles contrataram alguns ex-engenheiros do Google, que irão trabalhar na escalabilidade do sistema, e em particular, irão migrar para um sistema de armazenamento de dados baseado em sistema de arquivo, substituindo o sistema de base de dados.

Você sabia que o Google não usa base de dados para o seu incrível sistema de buscas? Pois é, tudo se baseia no [BigTable](http://labs.google.com/papers/bigtable.html), uma espécie de mega-arquivo distribuído que entre outras coisas não permite operações de joins, por questões de escalabilidade e velocidade.

E isso suscitou uma outra discussão com um colega de trabalho: hoje em dia, pensou em persistência, pensou em sistema de base de dados. Mesmo que isso não seja realmente necessário.

Sistemas de base de dados são ferramentas extremamente úteis, eficientes e importantes no dia a dia da computação, sobretudo quando falamos de sistemas web. Mas é sempre bom lembrar que as vezes um simples arquivo em disco resolve muito bem. Quando? Quando não precisamos de operações como buscas, joins, filtros, histórico....

Exemplo: no [job4dev](http://job4dev.com), o sistema de envios de mensagens para o Twitter é assíncrono. Ou seja, a vaga é adicionada no sistema, e de tempos em tempos uma tarefa cron (sim, o bom e velho crontab do linux que funciona perfeitamente) pega  o título e url das vagas e envia para o microblog. Para simplificar minha vida, eu salvo as informações que eu quero enviar em um arquivo (cada vaga é gravada em um arquivo diferente) em um diretório pré-determinado, que a tarefa cron lê. Simples, eficiente. E aposto que 95% das pessoas que fizessem isso pensariam de cara em salvar num BD, só para ter que fazer um select depois.

Outro exemplo de uso de BD que eu achava inútil: durante muito tempo eu trabalhei em uma empresa que desenvolve soluções para análise de dados biológicos. Um dos nossos sistemas era um visualizador de lotes de seqüências genéticas. Obviamente, todos estes dados estavam armazenados em uma linda base de dados normalizada. Para carregar um lote, era necessário sempre fazer uma enorme quantidade de joins e selects. O detalhe é que  NUNCA o sistema fazia  buscas  nestas sequências, NUNCA o sistema filtrava apenas alguns dados do lotes, e SEMPRE o lote era carregado de uma vez e salvo de uma vez, em um sistema Desktop onde o gerenciamento de dados em memória é bem simples. E ainda assim, os meus apelos para usarmos arquivos em disco foram inúteis.

O que eu gostaria de deixar como ponto importante deste post que as vezes é bom pensar fora da caixa, procurar novas abordagens para resolução de problemas, sair um pouco da rede de proteção que algumas ferramentas já bem estabelecidas supostamente oferecem. Estas ferramentas são boas, não tem como negar isso e dizer que elas não servem pra nada.  Elas servem, e muito.

Mas o status quo não leva a evoluções. Se você dissesse hoje que iria fazer um sistema de buscas de páginas sem usar BD, provavelmente muitos diriam que você é louco.
