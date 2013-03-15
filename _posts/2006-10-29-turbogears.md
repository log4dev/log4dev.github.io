---
title: Turbogears
author: Miguel Galves
layout: post
permalink: /2006/10/29/turbogears/
dsq_thread_id:
  - 
categories:
  - Uncategorized
tags:
  - Engenharia de Software
  - Ferramentas
  - Python
  - Web
---
# 

Recentemente comecei a brincar com **[Turbogears][1]**. É um framework para desenvolvimento de **aplicações web** em **Python** seguindo o famoso modelo [MVC (Model View Controller)][2]. O pacote é baseado em um conjunto de bibliotecas para as diferentes funcionalidades: [**MochiKit**][3] para apresentação (com suporte para AJAX), **[CherryPy][4] **para controle e [**SQLObject**][5] para a parte de persistência. O interessante é que cada uma dessas bibliotecas é um projeto separado, com equipes de desenvolvimento, site, etc..

 [1]: http://www.turbogears.org/
 [2]: http://en.wikipedia.org/wiki/Model-view-controller
 [3]: http://mochikit.com/
 [4]: http://www.cherrypy.org/
 [5]: http://www.sqlobject.org/

O **Turbogears** pode ser integrado com servidor Apache, mas oferece um servidor web caso se deseje rodar standalone.

Comecei a brincar com o Zope, mas achei o ambiente um tanto quanto complexo. O Turbogears é mais parecido com o modelo de desenvolvimento de aplicações Struts, com o qual eu tenho mais experiência.  A vantagem do Turbogears é que ele é bem menos complexo em termos de arquivos de configuração uma vez que as configurações são diretamente codificadas em Python.