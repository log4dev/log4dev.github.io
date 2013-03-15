---
title: ClockingIT
author: Miguel Galves
layout: post
permalink: /2008/04/12/clockingit/
dsq_thread_id:
  - 64842087
categories:
  - Desenvolvimento
  - Design
tags:
  - Desenvolvimento
  - Design
  - Ferramentas
  - Web
---
# 

Existe uma **ferramenta** muito legal para **controle de projetos**, bugs, releases e afins disponível na web: [ClockingIT][1].

 [1]: http://www.clockingit.com

Este projeto tem uma história bem peculiar: foi desenvolvido por um casal norueguês, Erlend e Ellen Simonsen. Erlend é desenvolvedor e é responsável por toda a parte de programação. Ellen é designer e cuida de toda a parte visual.

O **ClockingIT** segue a mesma receita de muitos projetos de alta qualidade e valor agregado disponíveis por aí: nasceu de uma necessidade do próprio desenvolvedor. Erlend é um consultor de tecnologia independente e desenvolve projetos sob medida para vários clientes, e sentia a necessidade de ter uma boa ferramenta de gerenciamento de projetos. Seguindo a filosofia do **Getting Real**, resolveu por a mão na massa e começou a desenvolver o **ClockingIT** usando a plataforma **Ruby On Rails**.

O sistema permite o cadastro de diversos projetos e colaboradores. Em cada projeto, é possível criar milestones e tarefas (com diversos graus de prioridade, nível de dificuldade, tempo estimado de execução e data de entrega) e designar um colaborador para sua execução. Além disso, o sistema permite a criação de subtarefas e permite registrar o tempo levado para executar cada tarefa, gerando um log de trabalho. Com estes dados, é possível criar relatórios diversos, como timesheets que são extremamente úteis para consultores que ganham por hora. E o sistema ainda oferece vários modos de visualização de todos estes dados: timeline, schedule, lista de tarefas…

Mas o grande diferencial, aquilo que me faz ter vontade de escrever sobre o **ClockingIT** neste blog, é a qualidade da interface. O design gráfico é simples, limpo e extremamente intuitivo. E o site faz um uso intensivo e **inteligente** de scripts e recursos assíncronos. Eu destaquei a palavra inteligente porque hoje em dia vemos muitos sites usando Ajax simplesmente por usar, apenas para baterem no peito e gritar “Eu sou uebi doispontuzeru!!!”. Olhando a interface do Clocking IT, talvez muitos resolvem repensas suas visões. A interação como o site é extremamente ágil e leve, exatamente como em software desktop. Qualquer ação efetuada por algum usuário é imediatamente refletida na tela de outros usuários conectados no mesmo projeto. É possível saber em tempo real quem está conectado no sistema, o que está fazendo, a quanto tempo está fazendo. E graças ao chat embutido, é possível até conversar com outros colaboradores.

Last, but not least, o sistema oferece integração com iCal (pode ser integrado com Google Calendar ou com o calendário da Apple por exemplo), sistema de RSS, um wiki, fórum , e uma speedbar (uma janelinha pequena) que permite que o usuário marque o início e fim de uma tarefa (com botões de start, stop e pause e um cronômetro rodando em tempo real).

É, definitivamente o ClockingIT não deixa nada a desejar de ferramentas tradicionais de gerenciamento de projetos. E com certeza ele é uebidoispontuzero.