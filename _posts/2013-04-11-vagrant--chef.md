---
author: mgalves
layout: post
title: "Vagrant + Chef"
slug: vagrant--chef
comments: true
date: 2013-04-11
description: ""
category: 
tags: []
---
{% include JB/setup %}

<div style="text-align: center;" markdown="1">
    ![](http://devopsdotcom.files.wordpress.com/2013/02/devops-define-roles.jpg)
</div>

DevOps foi o buzz do ano passado. Em resumo: o pessoal de desenvolvimento não se fala / bica com o pessoal de operações e infra? Criemos um cargo híbrido que seja capaz de falar com os dois lados e manter a paz na terra.

A verdade é que se você é fundador e/ou funcionário de uma startup, ou simplesmente trabalha em uma empresa pequena, grandes são a chances de que você já seja um deles (os DevOps), sem saber (e ganhando salário apenas de Dev ou de Ops). Desenvolvedor de startup codifica, testa, publica, mantém infra, desenha telas, atende telefone e lava a louça do cafezinho no fim da tarde. E aí, o único jeito de se manter digno e produtivo é automatizar tudo o que puder ser automatizado, economizando tempo e erros bestas.

Além do mais, em tempos de computação nas nuvens, hardware virou software e a melhor forma de tirar proveito desta flexibilidade é automatizando o processo de criação e configuração de suas máquinas. Assim, fica possível expandir, reduzir e substituir servidores com um ou dois cliques.

No [SIGA](http://siga.st), usamos intensivamente os serviços da [Amazon AWS], temos alguns servidores rodando (e em alguns casos, este número varia automaticamente conforme a necessidade), e apenas um coitado gerenciando tudo: eu. o estado da arte até semana passada era um script fab criado e refinado para gerenciar máquinas e instalar / atualizar sistemas.

1. Instale Vagrant, disponivel no site <http://vagrantup.com>;
1. Instale ruby 1.9;
1. Instale chef:

    `> gem install chef`

1. Instale uma box do Ubuntu 12.04 (caso prefira outro sabor de Linux, existe uma lista bastate grande de opções de VMs para Vagrant em <http://www.vagrantbox.es/>:

    `> vagrant box add http://dl.dropbox.com/u/1537815/precise64.box`

1. Baixe o meu template de código no GitHub;
1. Rode o comando:

    `> vagrant up`

1. Acesse <http://192.168.10.33/>;
1. Voilá!

