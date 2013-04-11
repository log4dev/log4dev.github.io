---
author: mgalves
comments: true
date: 2011-07-27 13:49:25
layout: post
slug: voce-esta-tentando-implementar-sign-in-com-twitter-em-um-iframe
title: Você está tentando implementar Sign In com Twitter em um iFrame?
wordpress_id: 875
categories:
- Desenvolvimento
---

<div style="text-align: center;" markdown="1">
    ![](https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTURy_L1guwIScIPay1lG9T4iwbmdNGN_YQN5vy6BeFV39I60Jr3g)
</div>

Então desista já. Não perca tempo (como eu perdi algumas várias horas)!

Não funciona!

Fazendo uma rápida pesquisa na internet, descobrimos que o **Twitter** implementou um **Javascript** que impede a página de login de ser exibida caso esteja dentro de um **iFrame** (pode tentar, o resultado final será uma página em branco). O motivo: questões de segurança.

Portanto, ou exiba a página na janela principal do seu navegador, ou use um popup.

E tenho dito.
