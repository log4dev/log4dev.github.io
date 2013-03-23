---
author: lullis
comments: true
date: 2008-04-24 18:15:11
layout: post
slug: poor-mans-profiler-decorators-em-python
title: Poor man’s profiler - decorators em Python.
wordpress_id: 280
categories:
- Desenvolvimento
---

Dizem que o código do editor-chefe é tão rápido e eficiente que ele executa loop infinito em dois segundos. Talvez seja verdade, talvez seja uma lenda. Mas o que importa é que nós, pobres mortais que não alcançamos o nível Jedi dele, precisamos muitas vezes ter um mecanismo que nos permita verificar quanto tempo uma função está gastando para ser executada.

A maneira óbvia de se fazer isso é adicionando timestamps antes e depois de cada ponto do caminho crítico da sua aplicação. Como você não quer ser visto como um mero Padwan pelo nosso editor-chefe, você vai arrumar outra forma de fazer isso. Como?

Uma sugestão: fazer uma função "cronômetro" que aceitasse uma função como parâmetro. Essa função cronômetro pegaria timestamps antes e depois de executar a função que foi passada como argumento, e retornaria a diferença dos tempos. Isso ainda ficaria feio. Você teria que mexer no código do mesmo jeito em todos os pontos que precisa verificar a sua função, sem contar que você está deixando o fluxo do seu código confuso, substituindo a função que realmente faz o que você quer que faça por uma outra, que faz o que você deseja indiretamente. O seu código deixaria de expressar qual é a sua verdadeira intenção de execução.

Se você fizer isso, você dá espaço para "The-one-who-can't-be-named" entrar com uma homérica defesa de sua linguagem/plataforma, enviando 32 links de sistemas enterprise que fazem profiling direto na VM, com um singelo acréscimo de 98MB de RAM na execução do processo. Nada demais para alguém que precisa ter um computador com 2GB de RAM apenas para rodar a IDE de forma satisfatória, não é mesmo?

Mas não é o caso. Podemos fazer um profiler de forma rápida e digna, e ainda aproveitar para fazer piadinha dos programadores que usam linguagens de programação que não possuem funções como first-class citizens. Elegante que é, Python tem uma solução para isso: **decorators**.

Pense em decorators quando você quiser que alterar uma função sem que você deixe de expressar o real objetivo da função ou método.  A nossa função cronômetro é um exemplo óbvio. Nós não queremos interferir na funcionalidade da função que vai entrar como parâmetro, mas precisamos alterar o seu comportamento de alguma forma. Assim, definimos uma função cronomêtro:

    
    def timeit():
        '''Poor man's profiler'''
        def decorator(func):
            def proxyfunc(self, *args, **kw):
                import datetime
                before = datetime.datetime.now()
                res = func(self, *args, **kw)
                print('%s took %s' % (func.__name__, (datetime.datetime.now() - before)))
                return res
            return proxyfunc
        return decorator





Agora, temos uma função que executa uma outra função e imprimindo o seu nome e tempo que levou para a execução.

E, caso você esteja desconfiado que a função "foo" esteja levando tempo demais na execução, você não precisa mais alterar todos os pontos de código. Basta adicionar o decorator na declaração:

    
    @timeit()
    def foo(a, b, c):
        '''Função Demoraaaaaada'''
        # código





Claro que esse é um exemplo simples. Mas já pode ser usado para resolver muitos problemas. Enfim, o recurso é poderoso, mas não abuse. Há quem aprenda decorators e queira transformar todas as suas funções em decorators, o que acaba prejudicando mais do que ajudando. E procure explicações melhores do que a minha, como [essa aqui](http://avinashv.net/2008/04/python-decorators-syntactic-sugar/). Eu só escrevi esse post para o editor-chefe ver que eu falo de programação de vez em quando...
