---
author: mgalves
comments: true
date: 2010-02-24 11:04:08
layout: post
slug: langs-bashes-e-encodings-da-vida
title: langs, bashes e encodings da vida
wordpress_id: 732
categories:
- Desenvolvimento
- Linux
tags:
- Desenvolvimento
- Java
- Linux
- Python
- Shell
---

Acho que posso dizer sem medo de errar que na lista de dores de cabeças que meus projetos pessoais e startups me trouxeram, a questão da **codificação de strings** está tranquilamente entre os TOP 3. E quando eu achei que tudo nesta área estava resolvido, eis que me apareceu um novo bug do nada que me fez perder algumas horas de mal humor. Porque coisas que funcionam por meses e de repente param de funcionar sem motivo aparente em geral me tiram do sério.

O [SigaSeuTime](http://www.sigaseutime.com.br) (cujo novo site acaba de estrear, se me permitem o autojabá) possui dois bots IM, **GTalk** e **MSN**, que fazem parte do conjunto de plataformas para distribuição de contéudo. Ambos os bots são escritos em **Java**, e a plataforma é escrita em Python. Para fazer a comunicação entre os subsistemas eu uso ou **REST** ou comunicação via **UDP**. No caso das notícias em tempo real, acabei optando por UDP para evitar pooling desnecessário. E isso funcionou perfeitamente nos últimos 6 meses: um agente se encarrega de puxar as notícias, processar, filtrar e gravar na base de dados. Outro agente lê as notícias novas e manda pros bots via UDP, para envio aos usuários online. .

Até que de repente, as mensagens começaram a aparecer tanto no MSN quanto no GTalk  com a **acentuação** totalmente errada. Típico resultado de strings codificadas de um jeito e interpretadas de outro ([tinha que existir um jeito fácil e direto de se descobrir a codificação de uma string sem a necessidade de metadados](http://log4dev.com/2009/05/18/identificacao-de-charsets/))! Olhando para o histórico do meu SVN vi que as últimas modificações em códigos relativos aos componentes envolvidos neste processo datavam de no mínimo 3 meses.

Ou seja, só podia ser culpa do meu servidor, ou do alinhamento planetário, ou então do Bush! Não não...a culpa, obviamente era minha. Sempre é, por mais que a gente lute contra isso.

A causa do problema estava em um script **SHELL** que eu criei recentemente cujo objetivo é de reiniciar os bots em caso de falha de comunicação com os servidores. Até então, o processo de reboot era manual, feito por mim mesmo via shell SSH, e a função deste script é de automatizar o processo, matando e executando novamente o bot.

Inofensivo certo? Nem tanto. O script é executado periódicamente pelo crontab do sistema operacional, e foi aí que o problema nasceu: as variáveis de ambiente do cronjob são diferentes das variáveis de ambiente do SHELL SSH, e em particular o segundo possui a variável **LANG=en_us.UTF-8**, que é justamente a codificação usada internamente pelo sistema. Vivendo e aprendendo: isto influi diretamente na JRE, e a falta da variável fez com que o sistema assumisse outra codificação (provavelmente **ISO Latin 1**). A solução foi exportar a variável no meu script.
