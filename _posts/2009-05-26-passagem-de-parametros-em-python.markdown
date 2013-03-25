---
author: mgalves
comments: true
date: 2009-05-26 09:00:54
layout: post
slug: passagem-de-parametros-em-python
title: Passagem de Parâmetros em Python
wordpress_id: 570
categories:
- Desenvolvimento
- Design
tags:
- Desenvolvimento
- Design
- Linguagens de Programação
- Python
---

Dentre os temas que geram discussões intermináveis, apaixonadas, e na maioria das vezes, completamente inúteis, a questão de **tipagem de dados em linguagens de programação** ocupa um espaço não desprezível.

Tipagem forte, tipagem fraca, tipagem estática, tipagem dinâmica. Existem prós e contras para cada lado, e os defensores de cada campo passam horas e horas tentando provar que o esquema alheio é péssimo. Tendo trabalhado com todos, programando em Java, Python, Javascript e C, chego à conclusão de que é possível ser feliz e produtivo com qualquer uma delas.

Mas nem tudo é perfeito, e em algumas situações, o jardim do vizinho é mais verde...

Sinto falta em alguns momentos de poder tipificar parâmetros de funções em **Python**, por dois motivos. O primeiro é para evitar que parâmetros de tipos errados sejam passados inadvertidamente: fazer verificação de tipo no início de um método ou função é simples, mas as vezes consome tempo de programação inútil.

O outro que mais me incomoda é que a falta desta tipagem impede que se utilize um recurso muito útil e elegante que é a **sobrecarga de método**. Basicamente, em Python não é possível criar vários métodos com o mesmo nome e com assinaturas diferentes. O jeito Python de resolver isso é verificando o tipo dentro do método, ou então criando um mecanismo de dispatch, usando os famosos dicionários (que são extremamente eficientes. Ousam dizer por aí que é a implementação mais eficiente que existe....).

Ambas funcionam, mas não são tão elegantes como a solução oferecida pela sobrecarga. Aproveito, pergunto: existe alguma forma mais elegante de se fazer isso em Python?

Fica aqui a minha sugestão. HEY, GUIDO, TIPIFICA OPCIONALMENTE PARÂMETRO DE MÉTODO AÍ!
