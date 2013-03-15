---
title: Histórico no Admin do Django
author: Miguel Galves
excerpt: ' '
layout: post
permalink: /2009/12/14/historico-no-admin-do-django/
dsq_thread_id:
  - 64846614
categories:
  - Desenvolvimento
  - Ferramentas
tags:
  - Desenvolvimento
  - Django
  - Ferramentas
  - Python
  - Web
---
# 

A funcionalidade de geração automática (de qualidade) de uma **área de administração** em projetos [Django][1] foi talvez a grande responsável por eu preferir esse framework ao Turbogears (junto com o fato do [Turbogears][2] ser na verdade uma federação de pequenos projetos). Pode parecer bobo, mas desenvolver uma área de admin bem feita é custoso, e ter uma versão básica bem feita de graça pode ser um grande diferencial na hora de construir algo novo.

 [1]: http://www.djangoproject.com
 [2]: http://turbogears.org/

Dentre as várias funções interessantes oferecidas por este admin, o **histórico de operações sobre os objetos** merece destaque:  cada ação efetuada sobre todo e qualquer objeto através do admin é gravada em uma tabela de histórico gerada automaticamente (data, usuário, objeto modificado, natureza da modificação), que pode ser visualizada em uma tabela web.

Infelizmente, este histórico é gerado automaticamente apenas para ações efetuadas através do admin. Recentemente, tive a necessidade de gravar o histórico de operações efetuadas por tarefas em background no [SigaSeuTime][3] (envio de anúncios comerciais para o Twitter), que me permitissem controlar de forma unificada e centralizada o bom funcionamento do sistema.

 [3]: http://www.sigaseutime.com.br

Pesquisando um pouco, descobri como fazer isso de forma simples com um código pequeno, que vou reproduzir abaixo: 
    from django.contrib.admin.models import LogEntry
    from django.contrib.contenttypes.models import ContentType
    
    def grava*historico(objeto, mensagem, usuario):
             LogEntry.objects.log*action(
                        user*id         = usuario.id,
                        content*type*id = ContentType.objects.get*for*model(objeto).pk,
                       object*id       = objeto.pk,
                       object*repr     = mensagem, # Message you want to show in admin action list
                       change*message  = mensagem, # I used same
                       action_flag     = 4
              )
    Chamando este código, ações sobre um objeto serão gravadas na tabela de histórico, e poderão ser vista na área de administração do Django. Simples e extremamente útil.