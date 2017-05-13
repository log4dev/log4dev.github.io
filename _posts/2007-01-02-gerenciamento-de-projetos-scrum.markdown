---
theme:
  name: twitter
author: alexandre
comments: true
date: 2007-01-02 15:41:08
layout: post
slug: gerenciamento-de-projetos-scrum
title: Gerenciamento de projetos - SCRUM
wordpress_id: 100
tags:
- Engenharia de Software
- SCRUM
- Desenvolvimento
- Agile
---

Com o objetivo de melhorar a produtividade da equipe com a qual trabalho, costumo sempre pesquisar acerca de temas em engenharia de software que nos ajude a superar nossas limitações - equipe pequena, pessoas inexperientes, mudanças constantes em projetos, excesso de demandas ... na última tentativa recai sobre o tema deste post - gerenciamento de projetos.

Devido ao excesso de mudanças que ocorrem dentro de um projeto (e trabalhamos com vários ao mesmo tempo), o excesso de demandas, e mudanças freqüentes de prioridades, acabamos por não conseguir nos concentrar em um problema tempo suficiente para desenvolver uma solução de boa qualidade. E ainda temos que gastar boa parte de nosso tempo gerenciando estas mudanças, e os problemas que são gerados a partir disto - clientes insatisfeitos (em nosso caso isso é crítico, pois eles estão a dois lances de escada de nós, sempre prontos a exigir que os atendamos), micro-planejamento, etc e tal ... e com isso, o tempo que gastamos desenvolvendo diminui ainda mais.

Pensando nisso, pesquisando um pouco aqui e acolá, comecei a me interessar por desenvolvimento Ágil. Li o [manifesto](http://www.agilemanifesto.org), comecei a achar bacana, e fui me aprofundando ... até que conheci uma técnica ágil chamada SCRUM, através de um [artigo](http://www.crisp.se/henrik.kniberg/ScrumAndXpFromTheTrenches.pdf) de um cara chamado Henrik Kniberg. Neste artigo, ele descreve como ele implementou o SCRUM em uma dada empresa. O texto é muito bom, e para mim, foi bastante inspirador. Com aquilo, resolvemos experimentar a tal metodologia.

Em linhas gerais, qual a idéia do SCRUM (nota: é o que eu entendi. Pode não refletir a verdade plena)? Você e sua equipe devem desenvolver um produto, cujas demandas vão crescendo com o tempo, conforme você vai entregando porções da solução ao cliente. Ele vê o que você fez, encontra bugs, novas funcionalidades, incoerências com o que ele imaginava ... e então você vai acrescentando novas demandas ao seu produto, que vão sendo priorizadas. Com esta lista de demandas, você e sua equipe fazem o planejamento do sprint, que pode ser entendido como um período de tempo onde vocês irão focar no desenvolvimento das principais demandas que vocês se comprometem a entregar ao fim do período (em nosso caso, nossos sprints são de três semanas). Dentro de um sprint, demandas não planejadas podem (e vão) surgir, e vocês podem ou não se dispor a atendê-las (possivelmente comprometendo alguma tarefa previamente planejada). Ao fim, você demonstra tudo o que você fez ao(s) seu(s) cliente(s) - e o que você não fez também. Para tanto, o SCRUM faz uso de algumas pequenas ferramentas:

- Sprint planning: reunião inicial onde a equipe define o que fará no sprint
- Daily Scrum: reunião diária (no máximo 15 minutos) para que a equipe relate o andamento das tarefas
- Sprint demo: reunião com o cliente para apresentar o resultado do sprint

Ao fim de nosso primeiro sprint, pudemos observar algumas mudanças interessantes:
- a equipe parece mais motivada, por participar ativamente das decisões de planejamento
- os clientes parecem mais felizes por receberem feedbacks periódicos sobre os produtos
- conseguimos encontrar problemas em períodos menores de tempo (logo na primeira apresentação de um produto, os clientes relataram uma necessidade crucial, não relatada antes, ao visualizar o protótipo de uma solução)

É claro que nem tudo correu às mil maravilhas. Temos vários problemas ainda, mas estamos empolgados com os primeiros resultados. Ainda temos outros planos, que vão além do SCRUM, que descreverei conforme forem sendo implementados. Mas a mudança já nos deu um gás novo. Isso é muito bom para nós.

Posteriormente, descreverei com mais detalhes como está se dando a implantação do SCRUM aqui, e espero daqui uns seis meses dizer se vale a pena o investimento ou não. Mas já acho que vale a pena tentar.
