---
theme:
  name: twitter
author: mgalves
layout: post
title: "Vagrant + Chef + AWS"
slug: vagrant-chef-aws
comments: true
date: 2013-04-26
description: ""
category: 
tags: [DevOps, Desenvolvimento, Ferramentas, Hardware, AWS]
---
{% include JB/setup %}

<div style="text-align: center;" markdown="1">
    ![]({{BASE_PATH}}/images/phyno.jpg)
</div>

Quando comecei a me interessar pelo tema __Vagrant + Chef__ (cuja solução eu descrevi [aqui]({% post_url 2013-04-11-vagrant--chef %})), uma questão básica que eu quis responder desde o início era:


> OK, eu consigo montar uma VM local e ter um ambiente de desenvolvimento / testes idêntico ao ambiente de produção. 
> Mas como eu uso essas ferramentas para criar o meu ambiente de produção no AWS?

A versão 1.1 do Vagrant trouxe uma resposta parcial para o meu questionamento, ao criar o conceito de __PROVIDER__ de virtualização, e permitir o uso de outros serviços além do VirtualBox. Entre eles, o uso de AWS. O Vagrant 1.2, lançado recentemente, parece permitir a gestão de diversas máquinas usando vagrant (coisa que acabo de descobrir, e que será objeto de nova pesquisa e novo post).

Vamos a mais uma receitinha de bolo. Sigam-me os bons:

- Execute o passo-a-passo descrito no post [Vagrant + Chef]({% post_url 2013-04-11-vagrant--chef %});

- Crie uma conta no AWS, caso já não tenha uma (sempre é bom verificar...);

- Instale o plugin vagrant-aws:
    
    `> vagrant plugin install vagrant-aws`

- Adicione uma Dummy Box no vagrant, que será considerada como um box AWS. O jeito mais simples de fazer isso é utilizando a box criada por Mitchell Hashimoto:
    
    `> vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box`


- Adicione um bloco novo no seu Vagrantfile, descrevendo e parametrizando a instância a ser criada no EC2:
    
        Vagrant.configure("2") do |config|
            config.vm.provider :aws do |aws|
                aws.access_key_id = "CHAVE DE ACESSO API AWS"
                aws.secret_access_key = "CHAVE SECRETA DE ACESSO API AWS"
                aws.keypair_name = "NOME DO PAR CHAVE/VALOR PARA ACESSO SSH"
                aws.ssh_private_key_path = "CAMINHO DO ARQUIVO CHAVE/VALOR PARA ACESSO SSH"
                aws.ami = "ami-3d4ff254"
                aws.ssh_username = "USERNAME"
                config.ssh.username = "USERNAME"
                aws.instance_type = "TIPO DE INSTANCIA. Ex: c1.medium"
                aws.security_groups = ["LISTA DE GRUPOS DE SEGURANCA",]
            end
        end

- Execute:
    
    `> vagrant up --provider=aws`


Seguindo este passo-a-passo, o resultado final será uma instancia do EC2 provisionada com seus scripts Chef. Caso tenha usado o script descrito no post anterior, você terá um servidor NGinx servindo um `Hello World`. 

O plugins vagrant-ssh está disponível no [github](https://github.com/mitchellh/vagrant-aws/blob/).
