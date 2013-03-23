---
author: mgalves
comments: true
date: 2007-10-23 12:04:49
layout: post
slug: otimizacao-madura
title: Otimização “madura”
wordpress_id: 199
categories:
- Desenvolvimento
- Design
tags:
- Engenharia de Software
- Qualidade de Software
---

Aconselho a leitura do artigo [Mature Optimization](http://cowboyprogramming.com/2007/01/04/mature-optimization-2/), escrito por Mick West.

Ele aborda uma questão interessante: otimização no inicio do projeto é sempre ruim?

Citando Donald Knuth:


> _We should forget about small efficiencies, say about 97% of the time. Premature optimization is the root of all evil_ – Knuth,  Literate Programming, 1992, p28.


O autor tenta mostrar que, as vezes, otimizações no final do projeto podem ser problemáticas:


> _Towards the end of the project we profile the code, and find that 20% of our CPU time is taken up by a function [...] then we fix it. Then we tackle our next function on the profiler’s list; maybe one that takes 10% of the CPU time. We fix that[..] Our game now runs 30% faster[...] However, if after that the code is still too slow, you will now find it is not because of a few weighty functions, but rather a general problem with all of the code. The code is just generally inefficient. By ignoring optimization until the end of the project you have ended up with “sick code” that contains multiple inefficiencies too deeply ingrained within the fabric of the code to be removed in a timely manner._


A idéia do texto é mostrar que existem duas categorias de otimizações a serem consideradas. A primeira, considerada precoce e ruin, é aquela que é feita sem um real entendimento da necessidade dela  e sobretudo do efeito final. As vezes, gastamos um grande tempo otimizando uma função cara que, no final das contas, será chamada apenas uma ou duas vezes durante a execução do programa sem afetar na performance geral.

A segunda categoria é chamada pelo autor de otimização madura. Ela cuida de problemas bem conhecidos em certos domínios de software, que são recorrentes e sobretudo previsíveis em vários projetos. Em geral, são otimizações estruturais que envolvem decisões de arquitetura e que dificilmente podem ser corrigidas ao final do projeto. O autor cita vários exemplos aplicados ao desenvolvimento de jogos, onde performance é crítica. Um exemplo bom é a questão de alocação de memória: é muito mais eficiente utilizar um sistema de pool de objetos do que ficar executando alocação repetitiva e constante na pilha.

No domínio de software que eu tenho trabalhado, o grande gargalo pode ser a quantidade de dados gravados.  Uma simples listagem pode ser um pesadelo caso não seja feita seguindo certas regras simples: usar paginação na base de dados (e nunca na camada de aplicação), tentar filtrar ao máximo os dados extraídos da tabela (extrair apenas o necessário para exibição, evitandoo aumento desnecessário da quantidade de dados). Pode parecer bobo, mas outro dia me deparei com uma listagem simples que demorava em torno de 15 minutos pra rodar...

O problema acima não se encaixa tão bem no quesito "decisão estrutural", porque ao final do código é relativamente simples mudar sem grande impacto no sistema. É apenas chato ter que passar por todas as queries, reescrever e retestar tudo. Sem contar que em geral o problema irá aparecer apenas depois do sistema ter sido instalado no cliente, ou estar em produção (afinal, ele está diretamente ligado à quantidade de dados da base). Mas com certeza é o tipo de problemas que pode ser facilmente mapeado no inicio do projeto e que não impacta em nada no desenvolvimento, se bem organizado.
