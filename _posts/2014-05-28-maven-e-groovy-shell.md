---
theme:
  name: twitter
author: alexandre
layout: post
title: "REPL para Java com Groovy Shell em projetos Maven"
slug: 
comments: true
date: 2014-05-28
description: "Este artigo mostra como criar um REPL para seu projeto Java configurado com Maven"
category: 
tags: [Java, Maven, Groovy]
---
{% include JB/setup %}

Uma das coisas que sinto falta ao desenvolver em _Java_ é a falta de um modo interativo (ou _REPL_), como os disponíveis em _Python_ e _Ruby_. Um _REPL_ é de grande ajuda quando queremos rapidamente testar a sintaxe de um método/função, ou executar uma tarefa simples. No projeto que estou trabalhando atualmente, que está sendo desenvolvido em _Java_ me deparei com uma destas tarefas.

Uma das funcionalidades do sistema resulta na geração de um arquivo _PDF_ a partir de algumas entidades do sistema. Isto foi implementado utilizando [Jasper Reports](http://community.jaspersoft.com/project/jasperreports-library). Basicamente, ela permite que se modele um relatório através de um arquivo _XML_, que é então compilado. O arquivo compilado pode então ser utilizado para gerar os arquivos _PDF_ de forma dinâmica.

Ao entrar no projeto, a equipe utilizava a ferramenta [iReport](http://community.jaspersoft.com/project/ireport-designer) para modelar e compilar os relatórios. Como eu estava com preguiça de instalar esta aplicação, e precisava realizar mudanças pontuais, resolvi editar o _XML_ e compilá-lo manualmente. Para isto, um _REPL_ seria perfeito. Mas _Java_ não possui um, então como fazer?

A resposta no meu caso foi utilizar [Groovy](http://groovy.codehaus.org/), uma linguagem dinâmica para a _JVM_, que possui uma sintaxe própria, mas que permite fazer uso das classes e bibliotecas _Java_ existentes. E, como era de se esperar, possui um _REPL_ - [Groovy Shell](http://groovy.codehaus.org/Groovy+Shell).

A única dificuldade seria configurar o _classpath_ do _Groovy Shell_, para carregar as bibliotecas do _Jasper Reports_. Mas como o projeto utiliza [Maven](http://maven.apache.org/) para gerenciar suas dependências, procurei uma forma de integrar os dois. E para nossa alegria, há um _plugin_ para o Maven que viabiliza esta integração: [Groovy-maven-plugin](http://groovy.github.io/gmaven/groovy-maven-plugin/). Uma vez configurado, basta executar

    mvn groovy:shell

e pronto, você poderá importar qualquer classe do seu projeto, ou de suas dependências, e brincar à vontade. Eis como ao final compilei meu relatório:

    groovy:000> import net.sf.jasperreports.engine.JasperCompileManager 
    ===> [import net.sf.jasperreports.engine.JasperCompileManager]
    groovy:000> JasperCompileManager.compileReportToFile("src/main/resources/jrxml/relatorio.jrxml", "relatorio.jasper")

