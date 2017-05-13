---
theme:
  name: twitter
author: mgalves
comments: true
date: 2007-04-13 12:27:34
layout: post
slug: envio-de-arquivos-com-nomes-corretos
title: Envio de arquivos com nomes corretos
wordpress_id: 126
categories:
- Desenvolvimento
tags:
- Java
- Web
---

Quando clicamos em um **link direto** para um **arquivo** em uma **página web**, o servidor se encarrega de gerenciar a transmissão dos dados e de gerar o cabeçalho correto para que a transferência se faça corretamente.

Mas muitas vezes, a transmissão do arquivo é executada por um serviço que o desenvolvedor está implementando. Isto acontece muito quando o **documento é gerado dinâmicamente pelo servidor** a cada requisição. Por exemplo, um serviço que gere um boleto para pagar uma conta. Provavelmente o boleto não está gravado no HD do servidor, mas é criado a cada requisição.

Neste caso, muitas vezes quando queremos salvar o arquivo gerado no HD local, o nome sugerido para o arquivo pelo navegador é o nome do link clicado. Por exemplo: eu clico em _www.meuservidor.com/gera_boleto.do_, peço para salvar o arquivo e o navegador propõe o nome _gera_boleto.do_. Isto pode ser indesejável caso o arquivo deva ter um nome específico.

Para resolver este problema, basta adicionar o header  **Content-Disposition** com valor

**"inline; filename=nomedomeuarquivo" **

no cabeçalho da resposta antes de enviar o arquivo propriamente dito. A forma de definir o **header** depende de cada linguagem. Em **Java**, desenvolvendo com **Servlets**, o comando seria

_response.setHeader("Content-Disposition", "inline; filename=teste.doc");_
