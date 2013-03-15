---
title: Ambiente de desenvolvimento
author: Miguel Galves
layout: post
permalink: /2006/04/17/ambiente-de-desenvolvimento/
dsq_thread_id:
  - 8900359
categories:
  - Desenvolvimento
tags:
  - Java
---
# 

Há um tempo atrás eu pensei em escrever um post descrevendo o ambiente de desenvolvimento que eu uso para escrever aplicações Web em Java. Basicamente Eclipse Tomcat Ant. A idéia era fazer um passo a passo, explicando os motivos das esolhas, características e vantagens do setup utilizado. Confesso que nunca escrevi por pura preguiça. Mas hoje resolvi escrever algo sobre ambientes de desenvolvimento de forma mais genérica. Dedico ao meu colega Raphael, que vive dizendo que ama emacs, mas vira e mexe me pentelha porque não consegue trabalhar direito com Eclipse e Tomcat.

Primeira má notícia: configurar ambiente de trabalho pode ser longo e chato. Sobretudo se estiver trabalhando com Linux e ferramentas livres. IDEs pagas em geral são mais bem documentadas e portanto mais fáceis, o que aliás justifica o preço pago. E mesmo assim, tem que se perder um tempinho pra deixar o pacote do jeito desejado. Segunda má notícia: ter um bom ambiente de desenvolvimento é condição sine qua non para ter uma produtividade adequada.

Não vou entrar no mérito de quais ferramentas são as melhores. Isso é muito pessoal, e vai do gosto de cada um…tentar discutir isso é entrar numa guerra de crenças quase religiosas. Até hoje não se chegou a um consendo sobre qual editor é melhor: VI ou Emacs. Eu prefiro Emacs, porque até hoje sou incapaz de abrir um arquivo e editar o seu conteúdo em VI. O fato é que existe uma grande quantidade de setups adequados para se desenvolver uma aplicação desde que bem configurados. Do meu ponto de vista, uma configuração básica deve ter um esquema de controle de versão, um bom editor de código (se possível com syntax highlight, auto-complete, sistema de refactoring, busca eficiente), e um bom sistema para compilação, testes, integração e distribuição do aplicativo. No melhor dos mundos, cada uma dessas ações deve ser executada com apenas um comando (one step build, uma das [características definidas por Joel Spolsky para medir a qualidade de uma empresa de desenvolvimento][1]). O compilador pode ser javac, gcj, jikes, gcc. O builder pode ser o ANT, Make, Shell Script. Sistema de versão pode ser CVS, subversion, ou qualquer outro que exista ou que venha a existir e que eu não conheço. Editor tem aos montes: eclipse, emacs, jEdit, VI, entre outros. Não importa muito qual o conjunto de ferramentas utilizado, desde que seja eficiente, compartilhado por toda a sua equipe de desenvolvimento, e possa ser usado a qualquer momento sem nenhuma grande complicação: ter que modificar comandos manualmente durante o processo ou tentar montar isso emergencialmente pode ser uma fonte de erros e dores de cabeça.

 [1]: http://log4dev.blogspot.com/2006/01/teste-simples-de-qualidade-de.html

Portanto, conselho de amigo: antes de mais nada, defina quais ferramentas você prefere, assuma essa escolha, e passe um tempinho deixando tudo funcionando perfeitamente. Isso com certeza irá poupar muito tempo mais tarde.