---
theme:
  name: twitter
author: mgalves
comments: true
date: 2009-03-22 20:42:02
layout: post
slug: buscadores-google-e-blogs
title: Buscadores, Google e Blogs
wordpress_id: 493
categories:
- Meta
tags:
- Google
- Web
---

No final do ano passado, descobrimos um problema no nosso engine de blog (descrito pelo Raphael [aqui](http://log4dev.com/2009/01/08/faxina-de-ano-novo/)) que fez com que nosso page rank do Google caísse, e que nossa visitação despencasse. O problema foi sanado com um upgrade do engine do Wordpress. Mas mesmo assim, não houve uma melhora significativa.

Como uma imagem vale mais do que 1000 palavras, eis o nosso gráfico de visitas dos últimos meses:

<table align="center" style="margin-top: 2em; margin-bottom: 2em">
    <caption align="bottom">Efeitos da falta do Google no blog....</caption>
    <tr><td>
     <img src="/images/2009-03-22-buscadores-google-e-blogs/log4dev.png" />
    </td></tr>
</table>

Existem 3 momentos interessantes a serem analisados neste gráfico, dois dos quais foram citados pelo Raphael: o início do problema, em agosto de 2008. A resolução dele em dezembro de 2008. E a retomada em março de 2009.

Em agosto, um arquivo problemático ferrou nosso Page Rank, e as consequências foram crueis. Em dezembro, Raphael atualizou a versão em teoria resolveu tudo. No início de janeiro, uma leva de textos novos me fez pensar que momentos gloriosos estavam por vir. Não vieram. Era um mistério.

Mistério esse que foi resolvido por acaso. O Leo me perguntou sobre uma funcionalidade do Wordpress, e fuçando no Admin para descobrir se ela existia ou não, percebi que o sistema estava configurado para bloquear os buscadores. Mudei esta configuração, e como num passe de mágica, textos antigos voltaram a ser acessados, e como pode ser visto no gráfico, nossos acessos começaram a crescer novamente. Ainda falta muito, mas é um início.

Interessante sentir na pele algo que já é fato sabido na internet de hoje: mecanismos de busca são fatores essenciais para o sucesso de um blog (logo depois da qualidade dos textos). Aliás, deixando o politicamente correto de lado, o Google é fator essencial para o sucesso de um blog.

Hoje, 47%  do tráfego do blog vem de mecanismos de busca, 30% de links externos e apenas 23% acessam diretamente (basicamente, os assinantes do nosso feed RSS). Do tráfego gerado pelos buscadores, 97% vem do Google e apenas 1% vem do Yahoo. Aliás, li no blog do Coding Horror que a grande maioria do tráfego do próprio Yahoo vem do Google. Definitivamente, não é desprezivel.

Portanto, eis a dica **SEO** Log4Dev do dia: ajuste o robots.txt, o maps.txt e nunca, nunca mesmo, bloqueie os buscadores.

E escreva coisas interessantes....
