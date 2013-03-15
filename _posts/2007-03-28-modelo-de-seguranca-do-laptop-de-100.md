---
title: Modelo de segurança do laptop de $100
author: Miguel Galves
layout: post
permalink: /2007/03/28/modelo-de-seguranca-do-laptop-de-100/
dsq_thread_id:
  - 64842234
categories:
  - Uncategorized
tags:
  - Hardware
  - Redes
  - Segurança
---
# 

Confesso que não acreditei muito no projeto, quando a idéia foi lançada pelo Negroponte há alguns anos atrás.

Mas vendo  [o site do **XO**][1]** **(nome dado ao computador) e o [wiki][2], percebi que o produto final é bastante interessante. Ele contém um pacote de programas bem completo (processador de textos, RSS, leitor de emails, chat, VoIP, shell, ambiente gráfico e de áudio, debugger),  é todo voltado para funcionamento em rede e usa Python, Javascript e Smalltalk como linguagens de base.

 [1]: http://www.laptop.org/index.shtml
 [2]: http://wiki.laptop.org/go/Main_Page

Mas um outro ponto que chama bastante atenção é o [**modelo de segurança**][3] adotado. Cada programa roda em uma **máquina virtual** separada, com um conjunto de permissões delimitadas.  Um exemplo é o fato que um programa de visualização de imagens não pode acessar a internet, impedindo que arquivos maliciosos executem ações de rede que possam trazer problemas. Além disso, programas maliciosos tem acesso limitado ao hardware. Assim, o funcionamento padrão do sistema impede  qualquer ataque de vírus ou spyware. Um software somente pode requisitar um conjunto diferente de permissões durante a instalação caso ele seja certificado por uma autoridade certificada, ou modificado manualmente pelo usuário. Tendo em vista que o público alvo são crianças que tem pouco ou nenhum conhecimento sobre computação, isto dificilmente vai acontecer.

 [3]: http://www.wired.com/software/webservices/news/2007/02/72669