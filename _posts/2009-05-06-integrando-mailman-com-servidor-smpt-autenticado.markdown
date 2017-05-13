---
theme:
  name: twitter
author: mgalves
comments: true
date: 2009-05-06 10:13:21
layout: post
slug: integrando-mailman-com-servidor-smpt-autenticado
title: Integrando MailMan com servidor SMTP autenticado
wordpress_id: 545
categories:
- Ferramentas
- Produto
tags:
- Código Aberto
- Desenvolvimento
- Ferramentas
- Mailman
- Web
---

Nota para referências futuras minhas e de quem se interessar pelo assunto.

A versão 2.1.12 (e provavelmente anteriores) do **Mailman** não prevê envio de email através de servidores **SMTP** que requerem **autenticação**. Para quem está tentando configurar um servidor de listas e precisa desta funcionalidade, pode ser problemático. Mas obviamente alguma boa alma no ciberespaço resolveu este problema, criando um PATCH. Como eu tive uma certa dificuldade de reencontrar o dito cujo, resolvi compartilhar a informação com vocês.

No diretório de instalação do mailman, abra o arquivo **Mailman/Handlers/SMTPDirect.py**. Salve uma cópia no mesmo diretório chamada **ASMTPDirect.py**. Adicione as seguintes linhas no método 
    
    \_\_connect(self)

logo abaixo da linha 
    
    self.\_\_conn.connect(mm_cfg.SMTPHOST, mm_cfg.SMTPPORT)




    
    
    
    if mm_cfg.SMTP_AUTH:
         self.__conn.login(mm_cfg.SMTP_USERNAME, mm_cfg.SMTP_PASSWORD)
    
    


Pronto, já temos um handler de envio de mensagens via SMTP autenticado.

O próximo passo é configurar o sistema para usar este handler. Para isto, abra o arquivo mm_cfg.py, e adicione as seguintes linhas:

`SMTPPORT = 25
SMTPHOST = 'smtp.server.com'
SMTP_USERNAME = 'seuusuario'
SMTP_PASSWORD = 'suasenha'
DELIVERY_MODULE = 'ASMTPDirect'
SMTP_AUTH = 1`

Resolvido!
