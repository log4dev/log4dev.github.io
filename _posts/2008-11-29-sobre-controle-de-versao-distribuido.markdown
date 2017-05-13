---
theme:
  name: twitter
author: mgalves
comments: true
date: 2008-11-29 17:47:44
layout: post
slug: sobre-controle-de-versao-distribuido
title: Sobre controle de versão distribuído
wordpress_id: 374
categories:
- Desenvolvimento
- Ferramentas
tags:
- Desenvolvimento
- Ferramentas
- Mercurial
- SVN
---

Um dos grandes desafios da vida de um profissional de tecnologia é de se manter atualizado em relação às novidades e rumos do mundo da computação. A quantidade de fontes de informação é "gigantescamente" enorme, e é necessário ter um bom filtro interno para conseguir separar o joio do trigo, extrair aquilo que nos interessa e manter a sanidade mental.

O meu processo de absorção de novidades é por etapas. Em geral eu leio ou ouço falar sobre algo novo, e guardo em um lugar remoto do meu cérebro. Muitas vezes, eu conto com a colaboração do meu colega de blog e junkreader profissional, senhor Lullis, Raphael Lullis. Com o passar do tempo, algumas das novidades vão sendo eliminadas, e algumas poucas são promovidas para a próxima fase. Após alguns paredões, eu acabo resolvendo aprender as que sobreviveram. Normalmente, as tecnologias que ficam são aquelas que por algum motivo se tornam necessárias no meu cotidiano.

Foi assim com django, com Ajax, com python. E agora, sistemas de controle de versão distribuídos ([Mercurial](http://www.selenic.com/mercurial/wiki/) ou [Git](http://git.or.cz/)) estão próximos da fase final de aprovação. Pra variar, o Raphael é parcialmente culpado por isso. Ele tem um lado Cuco: a cada 2 dias reaparece e martela sobre um tema. E vira e mexe ele vem me falar das maravilhas do uso de um Mercurial da vida. No começo achei um tanto quanto viajado. Mas agora, me parece extremamente útil.

Aliás, quero aproveitar antes para falar sobre o conceito de repositório. Pelo fato de um sistema distribuído não ter o conceito de repositório central, algumas pessoas acham que a coisa tende ao caos. Eu pensava assim. O grande lance é que ao contrário de um sistema como SVN onde existe um repositório e as pessoas baixam working copies, num sistema distribuído cada máquina é um repositório.

Dois elementos me parecem muito atraentes nestes sistemas, e me fazem falta atualmente: a **possibilidade de ter um repositório local**, e a **possibilidade de compartilhar seu trabalho com outras pessoas sem a necessidade de passar por um repositório central**.

O primeiro elemento é algo que pode ser parcialmente resolvido por bons IDEs como o Eclipse, que oferece um histórico local. Mas históricos locais são ótimos para resolver problemas em arquivos separados. A coisa se torna mais complicada quando queremos voltar conjuntos de arquivos. Para isso, já nos acostumamos a ter uma ferramenta de controle de versão, que permite comitar e comentar checkpoints de trabalhos. O fato é que quando se trabalha em grupo, o ideal é que os commits no repositório central sejam completos. Mas muitas vezes, uma implementação pode ser quebrada em várias sub-tarefas que não podem/devem ser compartilhadas com a equipe, e ter um histórico apurado destas subtarefas pode ser muito útil. Que jogue a primeira pedra aquele que nunca passou horas e horas escrevendo código,  e que no final das contas teve que voltar tudo atrás usando um revert.

O segundo elemento é algo que pode resolver vários problemas. Um deles é  permitir criar níveis de repositórios: um de desenvolvimento, um de testes, um de produção. Todos com histórico, tags, versões e afins. Trabalhei num projeto onde muitas vezes o repositório ficava instável, e era um deusnosacuda para montar uma versão para cliente.

Outra característica interessante é permitir que subgrupos dentro de uma equipe de desenvolvimento possam compartilhar código sem a necessidade de ter que criar um branch ou, pior, zipar o diretório e mandar por email. Tudo se resolveria com um merge simples entre pares.

Eu sei perfeitamente que para que tudo isso funcione, é necessário uma readaptação da equipe à nova ferramenta e sobretudo, ao novo modus operandi. Mas parto do pressuposto que as pessoas que trabalham comigo são espertas o suficiente para isso. E pensando bem, se fomos capazes de aprender a trabalhar com sistema de controle de versões, porque não seríamos capazes de aprender a trabalhar com um sistema distríbuido?
