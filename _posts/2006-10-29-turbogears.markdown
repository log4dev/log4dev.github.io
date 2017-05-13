---
theme:
  name: twitter
author: mgalves
comments: true
date: 2006-10-29 01:52:13
layout: post
slug: turbogears
title: Turbogears
wordpress_id: 92
tags:
- Engenharia de Software
- Ferramentas
- Python
- Web
---

Recentemente comecei a brincar com **[Turbogears](http://www.turbogears.org/)**. É um framework para desenvolvimento de **aplicações web** em **Python** seguindo o famoso modelo [MVC (Model View Controller)](http://en.wikipedia.org/wiki/Model-view-controller). O pacote é baseado em um conjunto de bibliotecas para as diferentes funcionalidades: [**MochiKit**](http://mochikit.com/) para apresentação (com suporte para AJAX), **[CherryPy](http://www.cherrypy.org/) **para controle e [**SQLObject**](http://www.sqlobject.org/) para a parte de persistência. O interessante é que cada uma dessas bibliotecas é um projeto separado, com equipes de desenvolvimento, site, etc..

O **Turbogears** pode ser integrado com servidor Apache, mas oferece um servidor web caso se deseje rodar standalone.

Comecei a brincar com o Zope, mas achei o ambiente um tanto quanto complexo. O Turbogears é mais parecido com o modelo de desenvolvimento de aplicações Struts, com o qual eu tenho mais experiência.  A vantagem do Turbogears é que ele é bem menos complexo em termos de arquivos de configuração uma vez que as configurações são diretamente codificadas em Python.
