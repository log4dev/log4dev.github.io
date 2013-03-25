---
author: mgalves
comments: true
date: 2008-07-06 17:58:42
layout: post
slug: google-seu-dominio-esquema-profica-de-email
title: Google + seu dominio = esquema profiça de email
wordpress_id: 331
categories:
- Ferramentas
tags:
- Email
- Ferramentas
- Google
- Web
---

Hoje em dia, ter um domínio próprio é tarefa simples e barata. Inclusive no Brasil, desde que a Fapesp começou a [permitir registro de domínios com CPF](http://log4dev.com/2008/04/16/combr-liberado-para-cpf/). Achar bons servidores de hosting também é bastante simples. No meu caso, uso e aconselho fortemente o [Webfaction](http://www.webfaction.com). Mas a lista de opções é grande.

Problema mesmo é a questão do **email**. As ferramentas oferecidas para este fim por estes servidores de hosting em geral são bem  limitadas, tanto em termos de interface quanto em termos de sistemas de anti-spam. Não tem jeito, o Google nos deixou muito mal acostumados com o GMail e suas incríveis funcionalidades.

Mas, espertos dos jeito que são, criaram uma solução à altura e com uma opção gratuíta: [Google Apps](http://www.google.com/a) (a não confundir com [Google Apps Engine](http://code.google.com/appengine/)). A idéia é simples: vc pode criar uma conta para o seu domínio, e dentro dela, criar várias contas de email, acesso ao calendar, gtalk  e documents compartilhado para os membros do domínio. A opção gratuíta oferece uma conta de 6GB para cada usuário, e a paga, 25GB. As funcionalidades são exatamente as mesmas daquelas oferecida pelo Google Documents, Google Calendar e GMail.

Para fazer a configuração completa, é preciso mexer em configurações avançadas do [DNS](http://en.wikipedia.org/wiki/DNS) do seu servidor, como os [MX Records](http://en.wikipedia.org/wiki/MX_record) e CNAME. Isso permite redirecionar todo o fluxo de emails para o Google e permite criar URLs personalizadas, como por exemplo mail.meudominio.com. O lado ruim é que é necessário ter um sistema de hosting que permita mexer nestes parâmetros.

Resumindo: Google Apps é uma solução de altíssima qualidade e baixíssimo custo para oferecer um sistema de email para seu blog, grupo ou empresa.
