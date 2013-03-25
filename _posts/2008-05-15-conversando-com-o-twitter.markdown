---
author: mgalves
comments: true
date: 2008-05-15 01:07:37
layout: post
slug: conversando-com-o-twitter
title: Conversando com o Twitter
wordpress_id: 297
categories:
- Desenvolvimento
- Ferramentas
tags:
- Ferramentas
- Python
- REST
- Twitter
- Web
---

Eu já divulguei aqui que o [Job4Dev](http://job4dev.com.br) tem integração com o sistema de microblog [Twitter](http://twitter.com), através do usuário [job4dev](http://twitter.com/job4dev), onde são enviadas as ofertas de emprego.

O que eu não divulguei ainda é que desde terça está no ar mais um projeto que contou com a minha participação: [sigaseutime.com.br](http://www.sigaseutime.com.br). A idéia é bem simples: utilizar o Twitter para agregar notícias e informações de jogos ao vivo do seu time de futebol favorito. Criamos contas para diversos times do Brasil e do mundo ([sigaCorinthians](http://twitter.com/sigaSeuTime), [sigaPalmeiras](http://twitter.com/sigaPalmeiras), [liveBarcelona](http://twitter.com/liveBarcelona), e por aí vai. Acesse o site para o obter a lista completa).

O que eu não contei também é que fazer integração via software com o Twitter é extremamente simples, graças à API REST de acesso. [REST](http://en.wikipedia.org/wiki/REST)? **RE**presentational **S**tate **T**ransfer, termo criado por [Roy Fielding](http://en.wikipedia.org/wiki/Roy_Fielding), computeiro americano e um dos principais autores da especificação do protocolo [HTTP](http://en.wikipedia.org/wiki/HTTP), em sua tese de PhD.

O próprio REST tem como pilar o protocolo HTTP.  A idéia básica é definir que existem recursos (fontes de informação) que podem ser acessados através de um identificador global (que no caso do HTTP, é conhecido como URL), e que retornam uma representação da informação (XML, JSON, etc). Os recursos são considerados objetos, e o REST utiliza as ações do protocolo HTTP para agir sobre estes objetos: GET, POST (as mais famosas, para quem trabalha com sistemas web e com ajax), PUT e DELETE.



	
  * **GET URI** corresponde à operação de leitura de um objeto

	
  * **POST URI** correponde à operação de criação, atualização ou remoção de um objeto, utilizando dados enviados pelo comando.

	
  * **DELETE URI** corresponde à operação de remoção de um objeto.

	
  * **PUT URI** corresponde, assim como  POST, à operação de atualização ou criação de um objeto.


Assim como no HTTP, o REST não armazena sessão: o acesso tem que ser feito sem que o recurso precise ter conhecimento de requisições passadas, proxys, caches e outros recursos utilizados em sistemas web. Ou seja: qualquer serviço REST pode ser acessado apenas com a URI apropriada e a ação desejada.

A API REST do Twitter permite acesso a todas as funcionalidades do sistema, de forma extremamente simples. Por exemplo: caso eu queira listar as mensagens recebidas pelo usuário job4dev em formato xml, basta acessar a URL [http://twitter.com/statuses/friends_timeline/job4dev.xml](http://twitter.com/statuses/friends_timeline/job4dev.xml). O sistema retorna informações também em JSON (neste caso, bastaria mudar o xml do final por json).

A maioria dos comandos requer autenticação, que no caso do Twitter é feita usando o [Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication): a informação de usuário e senha é enviada em um header chamado **Authorization**, cujo conteúdo é uma string na forma **_Basic &lt;dados em base 64&gt;_**, onde **_&lt;dados em base 64&gt;_** é usuario:senha codificado em [base64](http://en.wikipedia.org/wiki/Base64) (formato muito utilizado para transmissão de dados na web).

Vou colocar aqui um exemplo em Python para enviar uma mensagem nova para uma conta no Twitter. A função encodestring é responsável por converter para base64, e a função urlencode gera uma string no formato correto para colocar na requisição HTTP:
`
auth = encodestring('%s:%s' % (user, password))[:-1]
header["Authorization"] = 'Basic %s' % self.auth
encoded_post_data = urlencode({"status":status})
req = Request(TwitterSender.url, encoded_post_data, header)
url_data = urlopen(req)`

O mais interessante desta API é que além de ser simples, ela é muito bem documentada: [http://groups.google.com/group/twitter-development-talk/web/api-documentation](http://groups.google.com/group/twitter-development-talk/web/api-documentation)
