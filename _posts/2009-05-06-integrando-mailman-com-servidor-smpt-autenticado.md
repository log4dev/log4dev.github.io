---
title: Integrando MailMan com servidor SMTP autenticado
author: Miguel Galves
layout: post
permalink: /2009/05/06/integrando-mailman-com-servidor-smpt-autenticado/
dsq_thread_id:
  - 64846572
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
# 

Nota para referências futuras minhas e de quem se interessar pelo assunto.

A versão 2.1.12 (e provavelmente anteriores) do **Mailman** não prevê envio de email através de servidores **SMTP** que requerem **autenticação**. Para quem está tentando configurar um servidor de listas e precisa desta funcionalidade, pode ser problemático. Mas obviamente alguma boa alma no ciberespaço resolveu este problema, criando um PATCH. Como eu tive uma certa dificuldade de reencontrar o dito cujo, resolvi compartilhar a informação com vocês.

No diretório de instalação do mailman, abra o arquivo **Mailman/Handlers/SMTPDirect.py**. Salve uma cópia no mesmo diretório chamada **ASMTPDirect.py**. Adicione as seguintes linhas no método 
    &#95;&#95;connect(self) logo abaixo da linha 

    self.&#95;&#95;conn.connect(mm*cfg.SMTPHOST, mm*cfg.SMTPPORT)

    if mm_cfg.SMTP_AUTH:
         self.__conn.login(mm_cfg.SMTP_USERNAME, mm_cfg.SMTP_PASSWORD)
    
    

Pronto, já temos um handler de envio de mensagens via SMTP autenticado.

O próximo passo é configurar o sistema para usar este handler. Para isto, abra o arquivo mm_cfg.py, e adicione as seguintes linhas:

`SMTPPORT = 25
SMTPHOST = 'smtp.server.com'
SMTPUSERNAME = 'seuusuario'
SMTPPASSWORD = 'suasenha'
DELIVERYMODULE = 'ASMTPDirect'
SMTPAUTH = 1`

Resolvido!