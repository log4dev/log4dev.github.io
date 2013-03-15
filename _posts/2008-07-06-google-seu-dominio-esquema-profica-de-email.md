---
title: Google + seu dominio = esquema profiça de email
author: Miguel Galves
layout: post
permalink: /2008/07/06/google-seu-dominio-esquema-profica-de-email/
dsq_thread_id:
  - 8917597
categories:
  - Ferramentas
tags:
  - Email
  - Ferramentas
  - Google
  - Web
---
# 

Hoje em dia, ter um domínio próprio é tarefa simples e barata. Inclusive no Brasil, desde que a Fapesp começou a [permitir registro de domínios com CPF][1]. Achar bons servidores de hosting também é bastante simples. No meu caso, uso e aconselho fortemente o [Webfaction][2]. Mas a lista de opções é grande.

 [1]: http://log4dev.com/2008/04/16/combr-liberado-para-cpf/
 [2]: http://www.webfaction.com

Problema mesmo é a questão do **email**. As ferramentas oferecidas para este fim por estes servidores de hosting em geral são bem  limitadas, tanto em termos de interface quanto em termos de sistemas de anti-spam. Não tem jeito, o Google nos deixou muito mal acostumados com o GMail e suas incríveis funcionalidades.

Mas, espertos dos jeito que são, criaram uma solução à altura e com uma opção gratuíta: [Google Apps][3] (a não confundir com [Google Apps Engine][4]). A idéia é simples: vc pode criar uma conta para o seu domínio, e dentro dela, criar várias contas de email, acesso ao calendar, gtalk  e documents compartilhado para os membros do domínio. A opção gratuíta oferece uma conta de 6GB para cada usuário, e a paga, 25GB. As funcionalidades são exatamente as mesmas daquelas oferecida pelo Google Documents, Google Calendar e GMail.

 [3]: http://www.google.com/a
 [4]: http://code.google.com/appengine/

Para fazer a configuração completa, é preciso mexer em configurações avançadas do [DNS][5] do seu servidor, como os [MX Records][6] e CNAME. Isso permite redirecionar todo o fluxo de emails para o Google e permite criar URLs personalizadas, como por exemplo mail.meudominio.com. O lado ruim é que é necessário ter um sistema de hosting que permita mexer nestes parâmetros.

 [5]: http://en.wikipedia.org/wiki/DNS
 [6]: http://en.wikipedia.org/wiki/MX_record

Resumindo: Google Apps é uma solução de altíssima qualidade e baixíssimo custo para oferecer um sistema de email para seu blog, grupo ou empresa.