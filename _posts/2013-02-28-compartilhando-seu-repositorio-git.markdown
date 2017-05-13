---
theme:
  name: twitter
author: alexandre
comments: true
date: 2013-02-28 18:19:19
layout: post
slug: compartilhando-seu-repositorio-git
title: Compartilhando seu repositório GIT
wordpress_id: 926
categories:
- Ferramentas
---

Quando comecei a utilizar sistemas de controle de versão distribuídos (ou DCVS), iniciei com o Mercurial, basicamente porque achei que a documentação era mais simples do que a qe o Git oferecia. No entanto, profissionalmente, Git se transformou no padrão (pelo menos na minha experiência), e tive que aprender a lidar com ele. Tendo compreendido os conceitos do Mercurial, a transição não foi difícil. Só havia uma coisa que eu sentia bastante falta, e agora não mais - o **hg serve**.

Basicamente este comando permite que outros se conectem ao seu repositório particular. Isto é bastante interessante quando você pareia com alguém em sua máquina, faz algumas mudanças que ainda não estão prontas para ser enviadas ao repositório central, e então precisa que estas mudanças estejam na máquina do seu par porque amanhã você não poderá vir ao escritório por exemplo. E isto só é possível porque o sistema é descentralizado, ou seja, qualquer repositório pode servir outro repositório.

As alternativas com o Git seria criar um patch e enviar ao seu parceiro, ou criar um branch no repositório central. Nestes momentos, sempre me lembrava com nostalgia do Mercurial. Mas agora descobri que é possível fazer algo similar com o Git:

    git daemon --reuseaddr --base-path=. --export-all --verbose ./.git

Executando este comando em seu repositório local irá permitir que outros o acessem da mesma forma que fazemos usualmente com o repositório central. Basta que os interessados adicionem sua máquina com um repositório remoto ( **git remote add** ).

A fonte desta dica vem [desta pergunta do StackOverflow](http://stackoverflow.com/questions/377213/git-serve-i-would-like-it-that-simple).
