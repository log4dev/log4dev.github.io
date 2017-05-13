---
theme:
  name: twitter
author: mgalves
layout: post
title: "MySQL e os collations da vida"
slug: mysql-collations
comments: true
date: 2013-06-06
description: ""
category: 
tags: [Base de Dados, Desenvolvimento, Ferramentas, MySQL, AWS]
---
{% include JB/setup %}

AWS virou minha plataforma base para deploy de 100% dos meus projetos. E com ele, veio o MySQL, já que o RDS (serviço de base de dados do AWS) não oferece a opção de usar Postgres. O Raphael Lullis dirá para eu deixar de ser preguiçoso e fazer o meu próprio deploy...e meu próprio backup....e minha própria manutenção.....fiquemos com o MySQL.

<div style="text-align: center;" markdown="1">
![](http://www.tranchesdunet.com/wp-content/uploads/2012/05/dilbert-database.gif)
</div>

É fato que o ORM do Django simplifica bastante o trabalho de lidar com diferentes bases de dados. Mas nunca devemos nos esquecer do conceito das [Leaky Abstractions do Joel Spolsky](http://www.joelonsoftware.com/articles/LeakyAbstractions.html): desde que passei a usar o MySQL, esbarro constantesmente com a necessidade de ajustes de baixo nível.

No início da semana, resolvi migrar a base de dados do produto novo que estamos desenvolvendo de SQLite (ambiente de desenvolvimento) para MySQL (ambiente de produção). Rodei os scripts de migração / geração de tabelas e afins, e fui importar dados de uma tabela para outra. Entre estes dados, uma lista gigantesca de nomes de países e cidades em diversas línguas, construída para um serviço simples de detecção de localização em textos e perfis de Twitter (projeto este que provavelmente algum dia vira Open Source e vai para no GitHub).

Obviamente, falou em nome de países e cidades em diversas línguas (incluindo russo, coreano, japonês, chinês e árabe), falou UNICODE e UTF8. Falou UNICODE e UTF8, falou em dores de cabeça. Duro viver num mundo tecnológico criado por pessoas que falam uma língua ASCII.

Usei a ferramenta de dump / load de dados do próprio Django, que exporta os dados para um formato intermediário independente de base de dados (JSON ou XML), e que funciona muito bem. Mas na hora de gravar o nome Albânia na base nova, recebi uma mensagem de erro dizendo que estava violando uma regra de integridade porque já havia uma linha com este nome. Fucei um pouco e descobri que havia sim um Albania (note a falta do acento circunflexo). Ou seja, para o MySQL, Albania era igual a Albânia.

Inicialmente pensei que fosse um problema de codificação do arquivo de dump gerado. Pesquisei no Google, cacei fóruns obscuros e achei algumas pessoas dizendo que algumas vezes o JSON podia ser gerado errado, sugerindo o uso de XML. Gerei XML, mesmo erro.

Daí, tive um lampejo genial (só que não): o Django permite gerenciar múltiplas bases de dados, e permite selecionar em runtime quais bases serão usadas para leitura e para escrita. Bastava portanto escrever um script que lesse os dados do SQLite e gravasse no MySQL. No meio do caminho, o próprio Python se encarregaria de tratar de forma apropriada a codificação dos caracteres. Escrevi o script e .... PAU: Albania continuava sendo igual a Albânia. Aí, era inevitável: teria que passar por cima do ORM e enfiar a cabeça debaixo do capô do MySQL. 

As tabelas haviam sido criadas em UTF-8, portanto o problema era outro. Rodando o comando SHOW TABLE STATUS, que exibe informações uteis sobre as tabelas de sua base, descobri o tal do Collation, que nada mais é do que a regra usada pelo MySQL para fazer comparações entre campos de texto. No caso das minhas tabelas, todas estavam com collation `utf8_general_ci`; isso basicamente significava que as comparações eram CASE INSENSITIVE (ci), e que A era equivalente A, Ã, Â, etc... (a título de curiosidade, mudando ci por cs, a comparação vira CASE SENSITIVE). 

Encurtando a história: no meu caso a solução era usar utf8_bin, que faz a comparação de forma binária, sendo portanto mais precisa e mais lenta também. Uma lista bem completa dos tipos de collations pode ser encontrada [aqui](http://dev.mysql.com/doc/refman/5.5/en/charset-unicode-sets.html).

Minha opinião sobre o tema: faz todo o sentido poder definir a precisão da comparação de textos. Isso pode se tornar uma otimização muito útil, dependendo da classe de aplicações desejadas (eu diria que 99% dos sistemas podem se beneficiar disto).

Nada como conhecer minimamente a ferramenta que se está usando....
