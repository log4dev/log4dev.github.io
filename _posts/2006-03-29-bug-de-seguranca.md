---
title: Bug de segurança
author: Miguel Galves
layout: post
permalink: /2006/03/29/bug-de-seguranca/
categories:
  - Desenvolvimento
tags:
  - Web
---
# 

Implementação de aplicações web públicas (ou seja, que tem IP público e que seja acessível or qualquer pessoa) deve ser extremamente cuidadosa, sobretudo se o sistema inclui subsistemas de administração, de acesso restrito. Existem várias técnicas possíveis para proteger acesso à páginas restritas, como cookies, javascript, verificação de página de proveniencia, validação de tamanho de campos na interface para evitar buffer overflow, etc…. Dá pra fazer um curso universitário de um semestre sobre esse assunto. E não sei se sou a pessoa mais indicada para isso, apesar de já ter aprendido bastante na minha curta carreira de desenvolvedor de aplicações Web. O fato é que o seguro morreu de velho, e as vezes o perigo pode vir de lugares inesperados, como do próprio Google ![:-)][1] O artigo “[The Spider of Doom][2]” relata que todo o conteúdo de um CMS foi apagado pelo spider do google (programinha que varre a internet para cadastrar páginas em seu buscador), simplesmente porque este seguiu um link da página contendo instruções para apagar a página. Wooops.

 [1]: http://log4dev.com/wp-includes/images/smilies/icon_smile.gif
 [2]: http://www.thedailywtf.com/forums/65974/ShowPost.aspx