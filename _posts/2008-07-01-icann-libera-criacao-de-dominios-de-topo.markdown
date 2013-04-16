---
author: laggarcia
comments: true
date: 2008-07-01 21:05:11
layout: post
slug: icann-libera-criacao-de-dominios-de-topo
title: ICANN libera criação de domínios de topo
wordpress_id: 326
categories:
tags:
- DNS
- IANA
- ICANN
- Internet
---

A [ICANN](http://www.icann.org/) (Internet Corporatoin for Assigned Names and Numbers) deciciu recentemente levar a cabo uma idéia que vinha sendo estudada e maturada desde o fim da década passada: liberar o registro de domínios de topo na Internet.

Para quem não conhece, a ICANN, junto com a [IANA](http://www.iana.org/) (Internet Assigned Numbers Authority), são as entidades mundiais responsáveis por definir as regras de distribuição de números IP e registro de nomes na Internet. São eles por exemplo que definem que os endereços registrados no Brasil devem terminar em .br ou que endereços registrados  nos EUA podem terminar apenas em .com ou .edu sem ter um .us depois. Ou seja, eles são responsáveis pelo controle da última parte dos nomes de domínios da Internet: aquilo que vem depois do último ponto.

Esta última parte do domínio é conhecia como gTLD (generic top-level domain). Hoje existem relativamente [poucos gTLDs](http://www.iana.org/domains/root/db/) oficialmente suportados. Com a proposta que eles aprovaram virtualmente qualquer pessoa ou empresa poderá registrar seu próprio gTLD. Por exemplo a IBM poderá registrar o .ibm. e assim seu site principal poderá responder apenas por "ibm" ou invés de "ibm.com" como é hoje. Se eu fosse uma pessoa muito egocêntrica (e rica) eu poderia registrar o .laggarcia e mudar meus esparsos posts neste blog para blog.laggarcia.

É claro que o registro não vai ser um processo fácil nem barato. Vi estimativas na Internet variando de US$ 50K a US$ 400K. Além disso eles impuseram uma série de regras para que não seja criado um mercado de gTLDs: ou seja, qualquer um registra o gTLD .ibm e depois tenta fazer a IBM pagar uma bagatela para ceder a ela o direito de uso deste gTLD.

Outra decisão interessante que eles tomaram foi liberar endereços com caracteres em chinês, árabe e outras línguas que não usam um alfabeto latino. Mas acho que isso pouco deve afetar a maior parte dos brasileiros que acessam a Internet...

Todas estas mudanças devem gerar, é claro, um grande impacto na escalabilidade do sistema. Todos as buscas por gTLDs na Internet toda são processados por não mais que duas dezenas de servidores. Não sou um especialista em redes, mas imagino que estas buscas não são tão constantes hoje em dia porque estes valores são bem fixos, mas tornando a coisa mais flexível o sistema também sofrerá uma sobrecarga muito provavelmente. Ai está outro ponto interessante: parece que eles também querem que haja competição entre as empresas que fornecem este tipo de serviço de resolução de gTLDs.

Minha primeira impressão disso tudo foi: que bagunça! Mas, pensando melhor, até que eu acho que a idéia não é tão ruim no sentido que ela vai ampliar o alcance da Internet, já que os endereços passarão a ser, em alguns casos, mais naturais para pessoas não sistemáticas como em geral computeiros são, além de estimular a competição entre os provedores deste tipo de serviço. Já com relação aos problemas técnicos, não saberia dizer quão complicado isso poderia ser, mas imagino que estas autoridades já devem ter pensado neste problema também (caso contrário o sistema de DNS entraria em colapso, o que seria sentido por todos que usam a Internet).
