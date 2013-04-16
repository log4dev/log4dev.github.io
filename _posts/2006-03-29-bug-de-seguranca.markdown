---
author: mgalves
comments: true
date: 2006-03-29 10:46:50
layout: post
slug: bug-de-seguranca
title: Bug de segurança
wordpress_id: 54
categories:
- Desenvolvimento
tags:
- Web
- Google
---

Implementação de aplicações web públicas (ou seja, que tem IP público e que seja acessível or qualquer pessoa) deve ser extremamente cuidadosa, sobretudo se o sistema inclui subsistemas de administração, de acesso restrito. Existem várias técnicas possíveis para proteger acesso à páginas restritas, como cookies, javascript, verificação de página de proveniencia, validação de tamanho de campos na interface para evitar buffer overflow, etc.... Dá pra fazer um curso universitário de um semestre sobre esse assunto. E não sei se sou a pessoa mais indicada para isso, apesar de já ter aprendido bastante na minha curta carreira de desenvolvedor de aplicações Web. O fato é que o seguro morreu de velho, e as vezes o perigo pode vir de lugares inesperados, como do próprio Google :-) O artigo "[The Spider of Doom](http://www.thedailywtf.com/forums/65974/ShowPost.aspx)" relata que todo o conteúdo de um CMS foi apagado pelo spider do google (programinha que varre a internet para cadastrar páginas em seu buscador), simplesmente porque este seguiu um link da página contendo instruções para apagar a página. Wooops.
