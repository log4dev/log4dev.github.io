---
title: Você está tentando implementar Sign In com Twitter em um iFrame?
author: Miguel Galves
layout: post
permalink: /2011/07/27/voce-esta-tentando-implementar-sign-in-com-twitter-em-um-iframe/
dsq_thread_id:
  - 370056635
categories:
  - Desenvolvimento
---
# 

Então desista já. Não perca tempo (como eu perdi algumas várias horas)!

Não funciona!

Fazendo uma rápida pesquisa na internet, descobrimos que o **Twitter** implementou um **Javascript** que impede a página de login de ser exibida caso esteja dentro de um **iFrame** (pode tentar, o resultado final será uma página em branco). O motivo: questões de segurança.

Portanto, ou exiba a página na janela principal do seu navegador, ou use um popup.

E tenho dito.