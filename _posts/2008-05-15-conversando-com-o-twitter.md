---
title: Conversando com o Twitter
author: Miguel Galves
layout: post
permalink: /2008/05/15/conversando-com-o-twitter/
dsq_thread_id:
  - 64846458
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
# 

Eu já divulguei aqui que o [Job4Dev][1] tem integração com o sistema de microblog [Twitter][2], através do usuário [job4dev][3], onde são enviadas as ofertas de emprego.

 [1]: http://job4dev.com.br
 [2]: http://twitter.com
 [3]: http://twitter.com/job4dev

O que eu não divulguei ainda é que desde terça está no ar mais um projeto que contou com a minha participação: [sigaseutime.com.br][4]. A idéia é bem simples: utilizar o Twitter para agregar notícias e informações de jogos ao vivo do seu time de futebol favorito. Criamos contas para diversos times do Brasil e do mundo ([sigaCorinthians][5], [sigaPalmeiras][6], [liveBarcelona][7], e por aí vai. Acesse o site para o obter a lista completa).

 [4]: http://www.sigaseutime.com.br
 [5]: http://twitter.com/sigaSeuTime
 [6]: http://twitter.com/sigaPalmeiras
 [7]: http://twitter.com/liveBarcelona

O que eu não contei também é que fazer integração via software com o Twitter é extremamente simples, graças à API REST de acesso. [REST][8]? **RE**presentational **S**tate **T**ransfer, termo criado por [Roy Fielding][9], computeiro americano e um dos principais autores da especificação do protocolo [HTTP][10], em sua tese de PhD.

 [8]: http://en.wikipedia.org/wiki/REST
 [9]: http://en.wikipedia.org/wiki/Roy_Fielding
 [10]: http://en.wikipedia.org/wiki/HTTP

O próprio REST tem como pilar o protocolo HTTP. A idéia básica é definir que existem recursos (fontes de informação) que podem ser acessados através de um identificador global (que no caso do HTTP, é conhecido como URL), e que retornam uma representação da informação (XML, JSON, etc). Os recursos são considerados objetos, e o REST utiliza as ações do protocolo HTTP para agir sobre estes objetos: GET, POST (as mais famosas, para quem trabalha com sistemas web e com ajax), PUT e DELETE. 
*   **GET URI** corresponde à operação de leitura de um objeto
*   **POST URI** correponde à operação de criação, atualização ou remoção de um objeto, utilizando dados enviados pelo comando.
*   **DELETE URI** corresponde à operação de remoção de um objeto.
*   **PUT URI** corresponde, assim como POST, à operação de atualização ou criação de um objeto. Assim como no HTTP, o REST não armazena sessão: o acesso tem que ser feito sem que o recurso precise ter conhecimento de requisições passadas, proxys, caches e outros recursos utilizados em sistemas web. Ou seja: qualquer serviço REST pode ser acessado apenas com a URI apropriada e a ação desejada.

A API REST do Twitter permite acesso a todas as funcionalidades do sistema, de forma extremamente simples. Por exemplo: caso eu queira listar as mensagens recebidas pelo usuário job4dev em formato xml, basta acessar a URL . O sistema retorna informações também em JSON (neste caso, bastaria mudar o xml do final por json).

A maioria dos comandos requer autenticação, que no caso do Twitter é feita usando o [Basic Auth][11]: a informação de usuário e senha é enviada em um header chamado **Authorization**, cujo conteúdo é uma string na forma ***Basic ***, onde ****** é usuario:senha codificado em [base64][12] (formato muito utilizado para transmissão de dados na web).

 [11]: http://en.wikipedia.org/wiki/Basic_access_authentication
 [12]: http://en.wikipedia.org/wiki/Base64

Vou colocar aqui um exemplo em Python para enviar uma mensagem nova para uma conta no Twitter. A função encodestring é responsável por converter para base64, e a função urlencode gera uma string no formato correto para colocar na requisição HTTP: `
auth = encodestring('%s:%s' % (user, password))[:-1]
header["Authorization"] = 'Basic %s' % self.auth
encodedpostdata = urlencode({"status":status})
req = Request(TwitterSender.url, encodedpostdata, header)
url_data = urlopen(req)`

O mais interessante desta API é que além de ser simples, ela é muito bem documentada: 