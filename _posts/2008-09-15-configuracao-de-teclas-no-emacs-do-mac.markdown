---
theme:
  name: twitter
author: mgalves
comments: true
date: 2008-09-15 23:26:00
layout: post
slug: configuracao-de-teclas-no-emacs-do-mac
title: Configuração de teclas no Emacs do Mac
wordpress_id: 352
categories:
- Ferramentas
tags:
- Emacs
- Ferramentas
- Mac
---

O trio Mac + Python + Emacs tem me ajudado muito a ser produtivo e a desenvolver meus projetos. O [Aquamacs](http://aquamacs.org/) é um porte nativo do Emacs para a o OS X que consegue misturar bastante bem o poder do Emacs com elementos clássicos da interface Mac, como atalhos e afins. Mas para que as coisas funcionem corretamente, alguns ajustes específicos são necessários, como em relação tecla Alt+Option.

Usuários do Emacs sabem que esta tecla é o atalho para o Meta, base para a maioria dos comandos. Mas é também, infelizmente, a tecla necessária para se escrever a maioria dos acentos no teclado Mac: Alt+e+e = é, Alt+c = ç, Alt+n+a = ã, e assim por diante.  Aliás, isto apenas corrobora o fato de que nada é perfeito no mundo.

Por default, o Emacs processa o Alt como Meta. Portanto, enquanto a Apple não lança um teclado decente, devemos abdicar dos acentos?

Não! O povo do Aquamacs ofereceu uma ótima solução. Os comandos

_(setq mac-option-modifier nil)
(setq mac-pass-option-to-system t)_

dentro do arquivo .emacs forçam o editor a repassar o controle da tecla Alt para o sistema operacional, reestabelecendo a funcionalidade do acento. Mas desta forma, temos que usar o pouco ergonômico ESC para obter o Meta?

Também não! É possível mapear outras teclas para esta função. Uma possibilidade é o Command (tecla da maçã), através do comando

_(setq mac-command-modifier 'meta)_
que inclusive apresenta a vantagem de ser ao lado da tecla Alt. Por outro lado, bloqueia o acesso a atalhos específicos do Mac, como Command + S. Isso talvez não seja nenhum problema para os mais puristas do sistema do Stallman.

Outra solução é mapear a tecla Fn (function) para assumir a função de Meta, através do comando

_(setq mac-function-modifier 'meta)_

Esta foi a minha solução favorita e definitiva!
