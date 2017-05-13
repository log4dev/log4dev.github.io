---
theme:
  name: twitter
author: mgalves
comments: true
date: 2009-04-02 23:29:02
layout: post
slug: doc-job4dev-integracao-com-twitter
title: 'Doc. Job4Dev: Integração com Twitter'
wordpress_id: 507
categories:
- Desenvolvimento
- Design
tags:
- Design
- Engenharia de Software
- Ferramentas
- job4dev
- Python
- Twitter
- Web
---

[Job4Dev](http://job4dev.com.br) deu nascimento ao projeto [Open Source Jobboard](https://github.com/lullis/jobboard), hospedado no [GitHub](http://www.github.com/) e que está sendo levado adiante pelo Raphael. É um ótimo momento portanto para destrinchar e documentar alguns aspectos da arquitetura do sistema. Vou começar pela integração com o [Twitter](http://twitter.com/job4dev).

**Por que integrar com o Twitter?**

Sendo rápido e objetivo, decidi usar o Twitter por achar que seu design e seu modo de funcionamento se adequavam perfeitamente àquilo que eu estava buscando: a diversificação dos canais de divulgação das vagas. Esta integração foi possível graças ao fato do microblog oferecer uma API bastante bem feita e bem documentada. Junte a isso a minha vontade de brincar com a plataforma, e temos um cenário perfeito!

**E a API do Twitter, como funciona?**

Ela é baseada em REST, e permite fazer boa parte (se não tudo) do que um usuário humano poderia fazer. Eu explico sucintamente o seu funcionamento no artigo [Conversando com o Twitter](http://log4dev.com/2008/05/15/conversando-com-o-twitter/). A documentação da API pode ser encontrada em [http://apiwiki.twitter.com/](http://apiwiki.twitter.com/).

**Mas chega de papo, vamos ao design da coisa...**

A integração do Job4Dev com o Twitter começou com as seguintes premissas



	
  * Baixo impacto sobre o tempo de resposta do site no momento do cadastro de uma nova vaga

	
  * Garantia de que TODAS as vagas seriam publicadas no Twitter

	
  * Simplicidade da arquitetura


Resumindo, e usando as palavras da moda, a nova funcionalidade deveria ser ROBUSTA, ESCALÁVEL e CONFIÁVEL.

A chave para se conseguir os dois primeiros ítens é o uso de um sistema assíncrono. Ou seja: a ação de gravação de uma nova vaga na base de dados deve notificar o sistema de que uma nova mensagem deve ser enviada ao Twitter, e o envio deve ser executado em background. Isso evita que problemas na rede ou no próprio microblog (bastante comuns na época do desenvolvimento da funcionalidade) afetem o tempo de resposta.

Para garantir que todas os anúncios fossem enviados, deveria existir um mecanismo que persistisse os tweets em caso de problemas de rede, permitindo envio posterior. Finalmente, para garantir a confiabilidade e a simplicidade, decidi usar o máximo de recursos do sistema operacional. Afinal o Linux para mim é o melhor servidor de aplicações que existe!

**E como tudo isso foi implementado?**

Eu cogitei gerar a mensagem diretamente a partir da base de dados, uma vez que as informações são gravadas em uma tabela. Mas para garantir que uma vaga fosse enviada apenas uma vez, e permitir que uma mensagem fosse reenviada em caso de problemas de comunição, o esquema das tabelas teria que ser modificado para guardar o estado de processamento do canal Twitter.

Para evitar esta modificação, ao meu ver intrusiva, e aplicando a fundo o [conceito K.I.S.S](http://en.wikipedia.org/wiki/KISS_principle), resolvi utilizar o sistema de arquivos: ao submeter uma vaga, o sistema gera um arquivo texto em um diretório específico, contendo a mensagem a ser enviada. Para garantir que não haja conflito, o nome do arquivo é a URL da vaga.

O envio das mensagens é efetuado por uma tarefa em Python lançada pelo [CRON](http://en.wikipedia.org/wiki/Cron), de 15 em 15 minutos. O algoritmo é simples: verifica no diretório apropriado se existem arquivos de mensagens. Caso existam, abre cada um, lê o conteúdo, formata uma mensagem e efetua a requisição de envio para o Twitter. Caso a mensagem seja enviada com sucesso, remove o arquivo. Caso contrário, registra o erro em um arquivo de log e deixa o arquivo no diretório para uma execução futura.

Os mais curiosos poderão ver o código do módulo Twitter [aqui](http://github.com/lullis/jobboard/blob/master/jobs/twitter.py). Este módulo pode ser livremente utilizado para implementação de uma funcionalidade semelhante. Basta passar por parâmetro o nome do diretório, o nome de usuário no microblog e a senha.
