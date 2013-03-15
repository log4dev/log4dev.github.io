---
title: JS, e a batalha pelo controle da tecnologia web
author: Miguel Galves
layout: post
permalink: /2008/08/24/js-e-a-batalha-pela-controle-da-tecnologia-web/
dsq_thread_id:
  - 64842184
categories:
  - Negocios
  - Notícias
tags:
  - Adobe
  - Design
  - ECMAScript
  - Javascript
  - Microsoft
  - Web
---
# 

Há algum tempo atrás, eu escrevi [aqu][1]i sobre a nova especificação do Javascript, oficialmente conhecida como ECMAScript 4.0. Esta versão pretendia modernizar a linguagem, que estava congelada desde 1999 na versão 3.0 (também conhecida como Javascript 1.5). Na semana passada, esta versão foi [oficialmente abandonada][2]: o motivo foi uma longa batalha, que colocou em campos opostos alguns grandes players da internet mundial.

 [1]: http://log4dev.com/2007/02/27/ecmascript/
 [2]: https://mail.mozilla.org/pipermail/es-discuss/2008-August/003400.html

Entre as empresas que apoiavam a versão 4.0, estavam Google, Mozilla (que inclusive criou o projeto [Tamarin][3], cujo objetivo foi criar uma implementação de um engine JS 100% compatível com esta nova especificação), e Adobe. Esta última tinha um interesse especial nesta nova especificação, já que internamente, seus engenheiros chamavam a nova versão de ActionScript 3.0.

 [3]: http://www.mozilla.org/projects/tamarin/

ActionScript é, como todos sabem, a linguagem utilizada para desenvolver programas em Flash, tecnologia amplamente adotada na Internet. A Adobe tinha como planos fazer com que a nova especificação de Javascript fosse compatível com a sua própria linguagem de script. Conseguiria assim dois feitos: primeiro, rebateria as críticas daqueles que a acusavam de querer tornar a web um mundo proprietário. Segundo (e talvez o feito mais importante), unificaria as duas mais populares tecnologias  das duas tecnologias da Internet moderna: Flash e a linguagem que se tornou o pilar básico do AJAX e por consequência da tão falada Web 2.0.

Do outro lado desta batalha, estava nada menos do que a poderosa Microsoft, que luta para se firmar como uma empresa com um real poder de fogo e de influência sobre a grande rede mundial. Oficialmente, o argumento é de que a nova especificação representa uma evolução muito radical em relação à versão anterior, e que o melhor seria focar em desenvolver uma versão 3.1 inicialmente, e depois trabalhar em uma versão mais modesta da especificação 4.0. Devo dizer que concordo com a opinião de que a [nova especificação era muito complexa][4], introduzindo uma quantidade bastante grande de conceitos e palavras chaves.

 [4]: http://www.ecmascript.org/es4/spec/overview.pdf

Mas a realidade é que a Microsoft, representada por Allen Wirfs-Brock, não quer ver uma outra empresa impor sua tecnologia como standard da Internet. E por enquanto conseguiu, como mostra o este trecho do comunicado oficial de Breidan Eich, membro do comitê executivo para definição da ECMAScript: 
> 1. Focus work on ES3.1 with full collaboration of all parties, and target two interoperable implementations by early next year. 2. Collaborate on the next step beyond ES3.1, which will include syntactic extensions but which will be more modest than ES4 in both semantic and syntactic innovation. 3. Some ES4 proposals have been deemed unsound for the Web, and are off the table for good: packages, namespaces and early binding. This conclusion is key to Harmony. 4. Other goals and ideas from ES4 are being rephrased to keep consensus in the committee; these include a notion of classes based on existing ES3 concepts combined with proposed ES3.1 extensions.