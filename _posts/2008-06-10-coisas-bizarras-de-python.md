---
title: Coisas bizarras de Python
author: Miguel Galves
layout: post
permalink: /2008/06/10/coisas-bizarras-de-python/
dsq_thread_id:
  - 64842144
categories:
  - Desenvolvimento
  - Opinião
tags:
  - Python
---
# 

Venho trabalhado nos meus projetos pessoais com Python há um certo tempo e estou bem satisfeito. Esta linguagem tem sido um fator importantíssimo na minha produtividade, e tem me permitido por minhas idéias no ar de forma estruturada e com qualidade em tempos recordes.

Mas acho importante identificar pontos falhos que possam ser melhorados. Ter uma visão crítica de uma linguagem não a desmerece e não me faz ser menos entusiasta. Foi assim com Java, é assim com Python.

Até agora, a única caracteristica de Python que realmente me incomodava era o fato de variáveis locais não terem escopo de bloco. Ou seja: uma variável criada dentro de um if existe após ele. Muitos consideram isso como um ponto que pode gerar vários erros bestas (e de fato pode), mas se bem utilizado, pode ser bem poderoso. Resumindo: requer cuidado, mas pode ser útil. Ninguém é perfeito…

Mas existem alguns limites…e hoje descobri uma característica que me incomoda. Não a ponto de eu deixar a linguagem, porque ainda acho que os benefícios dela são gigantescos. Mas incomoda. E fico feliz de ter descoberto isso antes de ter passado horas e horas quebrando a cabeça com comportamentos bizarros.

Chega de preâmbulos, vamos ao ponto: 
    def f(item, lista=[]):
    
         lista.append(item)
        
         print lista
        
    
    
    
    
    
    
    
    Se executarmos a a função uma primeira vez, passando apenas um argumento, o resultado é o esperado: *f(1) *imprime *[1] *na tela. Mas se executarmos uma segunda vez, em vez de imprimir *[2]*, a função f imprime *[1,2]*. Eu custei a acreditar nisso, e tive que confirmar pessoalmente.
    
    
    
    Fazendo uma busca no Google, descobri na documentação oficial () que isto realmente é uma **característica mapeada da linguagem**:
    
    
    
    > **Default parameter values are evaluated when the function definition is executed.**  This means that the expression is evaluated once, when the function is defined, and that that same &#8220;pre-computed&#8221; value is used for each call.  This is especially important to understand when a default parameter is a mutable object, such as a list or a dictionary: if the function modifies the object (e.g. by appending an item to a list), the default value is in effect modified.  This is generally not what was intended.  A way around this  is to use None as the default, and explicitly test for it in the body of the function [...]
    
    Ok, pelo menos está mapeado. Mas a frase texto acima merece *&#8220;This is generally not what was intended.  A way around this  is to use None as the default, and explicitly test for it in the body of the function*&#8221; merece destaque. Afinal, logo após a documentação descrever a funcionalidade, ela reconhece que o efeito é indesejado (afinal, parâmetro de função tem escopo local), e ainda por cima descreve a Solução Rápida de Eficiência Duvidosa, a famosa Gambiarra (ou workaround, no jargão técnico). Ou seja, o problema poderia ser resolvido na fonte e as funções de Python poderiam ter o mesmo comportamento das funções de outras linguagens.
    
    
    
    Infelizmente, acabei de dar uma olhada na doc do futuro Python 3.0, e a *feature *permanece&#8230;&#8230;