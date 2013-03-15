---
title: Rapidinha sobre SQLite
author: Miguel Galves
layout: post
permalink: /2009/03/27/rapidinha-sobre-sqlite/
dsq_thread_id:
  - 64846554
categories:
  - Ferramentas
  - Opinião
  - Produto
tags:
  - Desenvolvimento
  - Design
  - Ferramentas
  - SQLite
---
# 

SQLite é uma mão na roda para desenvolver pequenos aplicativos que precisem de uma base de dados, mas sem a necessidade de se ter um SGBD parrudo. Roda como biblioteca de um programa, é rápido nas buscas, faz grande parte das operações úteis sobre tabelas.

Ótimo para se trabalhar com Python, e bem útil no desenvolvimento de aplicações web com Django.

Mas em épocas de desenvolvimento, com uma parte do sistema em produção, o fato do SQLite não permitir alterar ou remover colunas de uma tabela é um fator bem limitante. Espero que eles adicionem estas funcionalidades em breve.