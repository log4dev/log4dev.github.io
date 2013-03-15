---
title: 'Especial de Natal Log4Dev: construindo um site de notícias usando Python &#8211; Parte 2'
author: Raphael Lullis
layout: post
permalink: >
  /2007/12/23/especial-de-natal-log4dev-construindo-um-site-de-noticias-usando-python-parte-2/
dsq_thread_id:
  - 64842036
categories:
  - Desenvolvimento
  - Design
  - Teoria
tags:
  - Desenvolvimento
  - Python
  - Web
---
# 

Vamos dar uma olhada nos nossos requisitos, e apresentar algumas questões de tecnologia: 
*   O site tem que ser capaz de autenticar e identificar unicamente cada usuário que deseja cadastrar links.
*   Deve ser capaz de manter uma lista de quem foi o primeiro a enviar um link, além da data que o link foi enviado.
*   Deve ter um sistema que permita ao usuário indicar se gostou (aprovou) ou não gostou (rejeitou) um link enviado por qualquer pessoa que utilize o serviço.
*   Deve permitir que cada link enviado possua um fórum de discussão.
*   Deve permitir que uma pessoa possa iniciar um tópico de discussão, sem enviar um link. No caso, vamos fazer o seguinte: se o usuário preencher apenas os campos de título e comentário em um formulário de link, mas deixar o campo para a URL em branco, vamos criar um link para um item dentro do próprio site.
*   Deve permitir ao usuário enviar um lote de links a partir de uma fonte que ele já conheça. Isso vai servir para que o sistema, no futuro, tenha uma grande base de links prévios para aprender rapidamente.
*   Deve permitir que o usuário faça o seu voto (aprovado/rejeitado) sem sair da página que está. Para isso, vamos usar uma pitada de AJAX. Tendo os requisitos delineados, podemos ver que vamos precisar dos sistemas comumente usados em aplicativos web: um banco de dados, um servidor web, um sistema para geração de páginas dinamicamente. Além disso, teremos que usar alguma biblioteca para importar links e parsear RSS.

A parte de programação já foi definida no título: vamos usar Python. É o que estou usando ultimamente para meus outros projetos, é uma linguagem elegante, divertida (sim, diversão conta), dinâmica, com bibliotecas fartas e bem documentadas como parte da biblioteca-padrão. Se nada disso serviu como argumento, diga para o seu chefe que você vai aprender Python pois ficou sabendo que o pessoal do Google usa, e *tudo que eles usam tem que ser bom, não é mesmo*?

Para o servidor de banco de dados: PostgreSQL. Maduro, estável, bastante documentação. Outros bancos de dados serviriam, mas escolhi PostgreSQL por pura comodidade. Se você quiser portar os scripts SQL que eu colocar aqui para seu banco de preferência, creio que não terá dificuldades.

Para a parte de AJAX, vamos favorecer a prata da casa: [Juice Lib][1] é uma biblioteca pequena, mas com funcionalidades bem pensadas para a parte de comunicação assíncrona com o servidor. Eu tenho enchido um pouco o saco do Miguel na questão de manipulação de DOM (a juice faz isso através de extensão de métodos sobre string, o que pode vir a te causar dor de cabeça se o seu código Javascript começar a crescer muito), mas o resultado geral é poderoso o suficiente para que possamos ter o esquema de apresentação da votação em pouquíssimas linhas de Javascript.

 [1]: http://code.google.com/p/juicelib

Resta falar sobre qual sistema vamos usar para formarmos uma “Aplicação Web” propriamente dita. Controle de sessão, classes controllers, formas para acessar o banco de dados, apresentação de páginas construídas dinamicamente, etc, etc, etc.

Eu já disse que [odeio frameworks][2]. O que eu quero é algo que pudesse funcionar como um único módulo ou biblioteca, que pudesse ser importado a partir de um shell Python e me oferecer as funcionalidades necessárias para um webapp.

 [2]: http://log4dev.com/2007/12/21/sobre-frameworks

O que vamos usar, então, é um sistema que seja o anti-framework: esse sistema, para mim, é o [web.py][3]

 [3]: http://webpy.org

O que diferencia o web.py dos outros frameworks para aplicações web desenvolvidas em Python?

Simples: a filosofia.

Muita atividade ocorreu na comunidade de desenvolvedores Python, buscando uma resposta para o sucesso do Ruby On Rails. Começaram então a pensar em implementar um framework que pudesse ser tão “pragmático” e “rápido” quanto o Ruby On Rails.

E isso levou a uma febre de grupos desenvolvendo frameworks para Python. Sistemas que fazem mapeamento OR. Que abstraem sua camada de dados completamente. Que abstraem a camada de apresentação completamente. Que abstraem a camada de controle completamente. Que escrevem elogios na tela enquanto eles fazem tudo automaticamente para você.

O problema: [abstrações excessivas falham][4]. Cada um dos grupos dos grandes frameworks (Turbogears, Pylons, Django) tinha o seu próprio dialeto para o desenvolvimento de aplicações web, alguma coisa *parecida* com Python, mas não exatamente Python.

 [4]: http://www.joelonsoftware.com/articles/LeakyAbstractions.html

Faltava uma solução que se propusesse a alavancar os conhecimentos tradicionais que as pessoas acumulam ao trabalhar com sistemas web.

O web.py tem essa filosofia. Por exemplo: ao invés de se preocupar em implementar um módulo que faça mapeamento OR para você, o web.py te dá um módulo que serve para facilitar o acesso ao banco de dados, diretamente e de forma segura. Ao invés de expor objetos em Python para uma camada de apresentação, o web.py facilita o trabalho de construir uma resposta HTTP. Ao invés de impor uma disciplina de trabalho, ele oferece as funcionalidades básicas para que você use seu conhecimento acumulado com outros problemas que você teve que resolver.

(Justiça seja feita: o Django parece ter aprendido parte dessa lição. Muito dos esforços recentes do Django para que ele chegue na versão 1.0 está sendo feito no sentido de retirar o que é chamado de “código mágico”.)

Isso não quer dizer que o web.py é perfeito. Não é. A última versão lançada possui algumas coisas no design que você pode até estranhar, e vou falar deles. Espero para ver se a próxima versão irá corrigir mesmo esses problemas. De qualquer forma, por se tratar de uma biblioteca de recursos auxiliares – ao invés de um framework – a ginástica necessária para contornar esses problemas é muito menor.

Chega de escrivinhar. Amanhã, vamos ao código.