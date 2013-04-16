---
author: mgalves
layout: post
title: "Vagrant + Chef"
slug: vagrant--chef
comments: true
date: 2013-04-11
description: ""
category: 
tags: [DevOps, Desenvolvimento, Ferramentas, Hardware]
---
{% include JB/setup %}

<div style="text-align: center;" markdown="1">
    ![](http://devopsdotcom.files.wordpress.com/2013/02/devops-define-roles.jpg)
</div>

Desenvolvedor de startup codifica, testa, publica, mantém infra, desenha telas, atende telefone e lava a louça do cafezinho no fim da tarde. E aí, o único jeito de se manter digno e produtivo é automatizar tudo o que puder ser automatizado, economizando tempo e erros bestas. Além do mais, em tempos de computação nas nuvens, hardware virou software e a melhor forma de tirar proveito desta flexibilidade é automatizando o processo de criação e configuração de suas máquinas. Assim, fica possível expandir, reduzir e substituir servidores com um ou dois cliques.

No [SIGA](http://siga.st), usamos intensivamente os serviços da [Amazon AWS](http://aws.amazon.com), temos alguns servidores rodando (e em alguns casos, este número varia automaGicamente conforme a necessidade), e apenas um coitado gerenciando tudo: eu.
Me vi obrigado a procurar soluções, e o [Fabric](http://fabfile.org) caiu como uma luva. Montei um script capaz de gerenciar minhas máquinas na Amazon (start, stop, reboot), os serviços disponíveis em cada, além de configuração inicial e atualização de código.

Tudo muito bom, tudo muito bem, cheguei ao limite desta solução, por vários motivos:

1. Totalmente amarrado à infra da Amazon;
1. Totalmente amarrado ao Ubuntu;
1. Desenvolvido de forma orgânica e sem muito planejamento. A portabilidade do script entre projetos melhorou muito, mas ainda é precária;

Procurando soluções, comecei a prestar mais atenção no [Chef](http://www.opscode.com/chef/). E a coisa realmente começou a me interessar quando fui apresentado ao [Vagrant](http://www.vagrantup.com/). Resumindo muito cada ferramenta, o Chef é um sistema que automatiza a configuração de máquinas e instalação de pacotes, através de receitas (recipes), sendo capaz de lidar com sutilidades de diversos sistemas operacionais.

> Chef provides a flexible model for reuse by enabling users to model infrastructure as code to easily and consistently configure and deploy infrastructure across any platform. 

Já o Vagrant é um criador de máquinas virtuais, sendo capaz de gerar VMs do VirtualBox e VMWare a partir de um script.

> Create a single file for your project to describe the type of machine you want, the software that needs to be installed, and the way you want to access the machine. Store this file with your project code.

Como você já deve ter adivinhado, o Vagrant usa o Chef para configurar e instalar pacotes em uma VM. Ambos permitem transformar a configuração de uma máquina em um simples script, que pode ser facilmente distribuido entre todos os desenvolvedores de um projeto (resolvendo outra dor de cabeça: ambientes heterogêneos. Quem nunca sofreu com isso que jogue a primeira pedra).

Resolvi por a mão na massa e montar setup básico para criar uma VM Ubuntu 12.04 com NGINX servindo uma página HELLO WORLD. Deu certo, e resolvi compartilhar este código com o mundo. Como este texto já está ficando longo, vou dar aqui apenas a receitinha de bolo pra executar o meu setup que, espero, poderá servir de ponto de partida para outros interessados no assunto. 

Vamos lá:

1. Instale o VirtualBox, disponível em <https://www.virtualbox.org/>;

1. Instale Vagrant >= 1.1.X, disponivel no site <http://vagrantup.com>;

1. Instale ruby 1.9;

1. Instale chef:

    `> gem install chef`

1. Instale o plugin vagrant-omnibus. Ele garante que o Chef estará instalado na versão correta na VM:

    `> vagrant plugin install vagrant-omnibus`


1. Instale uma box do Ubuntu 12.04 no Vagrant :

    `> vagrant box add precise64 http://dl.dropbox.com/u/1537815/precise64.box`

    (caso prefira outro sabor de Linux, existe uma lista bastante grande de listadas em <http://www.vagrantbox.es/>)

1. Baixe o meu template de código no GitHub:

    `> git clone git://github.com/mgalves/vagrant-chef-nginx.git`

1. Entre no diretório `vagrant-chef-nginx/chef_repo`;

1. Rode o comando:

    `> vagrant up`

1. Acesse <http://192.168.33.10/>;


1. Hello World!

