---
author: mgalves
comments: true
date: 2009-12-14 05:00:28
layout: post
slug: historico-no-admin-do-django
title: Histórico no Admin do Django
wordpress_id: 696
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

A funcionalidade de geração automática (de qualidade) de uma **área de administração** em projetos [Django](http://www.djangoproject.com) foi talvez a grande responsável por eu preferir esse framework ao Turbogears (junto com o fato do [Turbogears](http://turbogears.org/) ser na verdade uma federação de pequenos projetos). Pode parecer bobo, mas desenvolver uma área de admin bem feita é custoso, e ter uma versão básica bem feita de graça pode ser um grande diferencial na hora de construir algo novo.

Dentre as várias funções interessantes oferecidas por este admin, o **histórico de operações sobre os objetos** merece destaque:  cada ação efetuada sobre todo e qualquer objeto através do admin é gravada em uma tabela de histórico gerada automaticamente (data, usuário, objeto modificado, natureza da modificação), que pode ser visualizada em uma tabela web.

Infelizmente, este histórico é gerado automaticamente apenas para ações efetuadas através do admin. Recentemente, tive a necessidade de gravar o histórico de operações efetuadas por tarefas em background no [SigaSeuTime](http://www.sigaseutime.com.br) (envio de anúncios comerciais para o Twitter), que me permitissem controlar de forma unificada e centralizada o bom funcionamento do sistema.

Pesquisando um pouco, descobri como fazer isso de forma simples com um código pequeno, que vou reproduzir abaixo:

    
    from django.contrib.admin.models import LogEntry
    from django.contrib.contenttypes.models import ContentType
    
    def grava_historico(objeto, mensagem, usuario):
             LogEntry.objects.log_action(
                        user_id         = usuario.id,
                        content_type_id = ContentType.objects.get_for_model(objeto).pk,
                       object_id       = objeto.pk,
                       object_repr     = mensagem, # Message you want to show in admin action list
                       change_message  = mensagem, # I used same
                       action_flag     = 4
              )


Chamando este código, ações sobre um objeto serão gravadas na tabela de histórico, e poderão ser vista na área de administração do Django. Simples e extremamente útil.
