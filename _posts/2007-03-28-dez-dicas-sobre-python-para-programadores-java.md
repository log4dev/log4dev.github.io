---
title: Dez dicas sobre Python para programadores Java
author: Miguel Galves
layout: post
permalink: /2007/03/28/dez-dicas-sobre-python-para-programadores-java/
dsq_thread_id:
  - 64842239
categories:
  - Desenvolvimento
tags:
  - Desenvolvimento
  - Java
  - Linguagens de Programação
  - Python
---
# 

1.  Python não suporta a instrução **switch**. A solução mais trivial para obter o mesmo comportamento seria usar if else encadeado. Mas a solução mais pythonica (se é que o termo existe) é usar **dicionários** para isso, aproveitando o fato que a implementação desta estrutura de dados é extremamente eficiente e que funções são **first-class objects**.

Exemplo:

`
def funcA()
def funcB():
switch = {1: funcA, 2:funcB}
switchvalor
`

1.  Em Python, tudo é objeto, desde os tipos primitivos int, boolean até o arquivo onde o código é gravado (chamado de módulo), passando por funções.

2.  A **cultura Java** diz que o **acesso a atributos de um objeto** deve ser feito por meio de métodos getters e setters. Portanto, quando um programador Java escreve em Python, a tendência é criar estes métodos. A **cultura Python** define que o acesso aos atributos se faz através da chamada direta ao atributo. Por exemplo, se tenho o objeto *meuObjeto*, que possui o atributo *meuAtributo*, então o acesso se faz via *meuObjeto.meuAtributo*. Este padrão pode parecer estranho à primeira vista, pois estaria quebrando alguns paradigmas de programação orientada a objeto permitindo acesso direto à variável. E se eu quiser fazer validações antes de definir o valor do atributo? Está tudo previsto! Python por trás dos panos chama os métodos ***get*** e ***set***. O comportamento padrão é simplesmente obter ou gravar o valor do atributo. Mas caso o desenvolvedor deseje determinar um comportamento específico, basta sobreescrever o método.

3.  **Variáveis e métodos privados em Python** são definidos com dois _ antes do nome. Porém, eles não estarão completamente inacessíveis de fora. Simplesmente, o nome dele será concatenado com o nome da classe (**name mangling**) para dificultar o acesso. A idéia geral por trás disso é que ao definir um método ou atributo como privado, o desenvolvedor sinaliza que o uso da variável diretamente pode causar efeitos indesejáveis. Aquele que o fizer estará fazendo por sua conta e risco!

4.  **Métodos estáticos em Java** são no fundo uma forma de contornar o fato que a linguagem exige que todos os métodos tem que estar em uma classe. É um recurso muito utilizado para se criar coleções de funções utilitárias genéricas (como a classe Collections). Em Python, o equivalente pode ser feito por meio de funções definidas no módulo, fora de um objeto.

5.  Python suporta programação **orientada a objetos**, **procedimental** e **funcional**! Use e abuse desta liberdade.

6.  **Dicionários** são extremamente eficientes e muito simples se operar em Python. Se estiver pensando em criar uma classe apenas para transportar dados, pense duas vezes se usar um dicionário não é a melhor solução.

7.  Existem duas formas de se criar **atributos de uma instância de um objeto** em Python: ou dentro do método **init**, utilizando *self.minhavariável*, ou em qualquer ponto do código após a criação. Em Python, os atributos e variáveis são criados no momento do primeiro uso. Por exemplo: * class MinhaClass: pass*

*instancia = MinhaClass() instancia.variavel=1*

O código acima cria uma classe MinhaClasse, uma instância desta classe e adiciona um atributo variável. Atributos criados dentro do código da classe e fora do método ****init**** são equivalentes a variáveis estáticas em Java.

1.  **Variáveis e atributos** tem **escopo** de módulo, classe, método ou função, mas não tem escopo de bloco. Isso significa que uma variável criada dentro de um if continuará viva fora dele. Cuidado!

2.  A questão de uso de **indentação** para **delimitação de blocos** pode parecer estranho à primeira vista. Mas não é. Basta usar um editor decente, como [PyDev][1] para Eclipse ou [python-mode][2] para Emacs. O efeito colateral é que o código fica naturalmente organizado e fácil de ler.

 [1]: http://pydev.sourceforge.net/
 [2]: http://python-mode.sourceforge.net/