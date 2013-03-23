---
author: laggarcia
comments: true
date: 2008-08-27 23:01:14
layout: post
slug: bizarro-mas-muito-util
title: Bizarro… mas muito útil!
wordpress_id: 349
categories:
- Desenvolvimento
tags:
- bizarro
- C
- macros
---

O artigo do Miguel sobre [perólas do mundo Java](http://log4dev.com/2008/08/10/perolas-do-mundo-java/) me fez lembrar de um trecho de código com o qual me deparei há um tempo atrás que me parecia também muito bizarro... até eu sacar um pouco depois a imensa utilidade dele!

O código, em linguagem C, era algo como o seguinte:

    
    do {
      __alguma_coisa;
    } while (false);


Em princípio fazer uma construção de laço para executar algo apenas uma vez parece algo bem bizarro, não?! Diria que é quase um primo-irmão do `if (liberado==true)`. Foi exatamente o que eu achei. Mas colocando esta construção dentro do contexto em que eu a achei eu consegui ver (depois de alguma pesquisa, é claro) que ela é extremamente útil em alguns casos.

A primeira vez que eu me deparei com esta construção eu estava analisando o código-fonte do [GNUChess](http://www.gnu.org/software/chess/), um jogo de xadrez de código livre. Como eu sei que o pessoal que escreve código livre algumas vezes utiliza umas construções bem diferentes do que normalmente estamos acostumados, resolvi investigar o porquê deles estarem utilizando esta construção. Afinal de contas, se este código é livre e várias pessoas já devem tê-lo revisado, não havia motivo para um laço aparentemente tão inútil estar lá sem alguma utilidade verdadeira, não é mesmo?!

E foi só pesquisar um pouco sobre o assunto para enteder melhor o que estava acontecendo. As construções como a acima só apareciam em definições de macros. Nunca em código "normal". Para quem talvez não tenha muita familiaridade com [macros em C](http://en.wikipedia.org/wiki/Macro_(computer_science)#Text_substitution_macros), elas são basicamente códigos que você define e que serão literalmente expandidos pelo compilador onde seu identificador aparecer no código. Ou seja, um código assim:

    
    #define macro_exemplo printf("Macro de exemplo!\n");
    int main(void) {
      macro_exemplo
      return 0;
    }


seria entendido pelo compilador, após o processamento das macros, da seguinte forma:

    
    int main(void) {
      printf("Macro de exemplo!\n");
      return 0;
    }


Ou seja, o preprocessador de código do compilador substitui a referência à `macro_exemplo` pela sua definição literal. No caso do nosso código bizarro, teríamos que definir a macro da seguinte forma:

    
    #define macro_exemplo2 do { __alguma_coisa; } while (false);


ou ainda:

    
    #define macro_exemplo3 do { \
                             __alguma_coisa; \
                           } while (false);


Note que uma macro deve ser definida sem quebras de linhas ou com quebras de linhas sinalizadas pelo caracter de escape barra invertida ('\').

Mas, ainda assim, não haveria motivo para o laço na minha macro, certo? Bom, se você pensar na macro como um código por si só, talvez isto esteja certo, mas não podemos esquecer que este código será copiado literalmente para algum outro lugar sempre que o identificador da macro for referenciado pelo programa. E muitas vezes não queremos fazer macros simples como as que eu mostrei no meu exemplo. Por exemplo, podemos querer fazer algo mais complexo como o seguinte:

    
    #define IMPRIME_ESPACOS(n) for (int j = 0; j < n; j++) printf(" ");
    #define ROTULO(rot) printf("L%d:", rot); do { \
              int n = numeroDigitos(rot); \
              IMPRIME_ESPACOS(6 - (n + 2))\
    } while (false);


A macro `IMPRIME_ESPACOS(n)` imprime uma quantidade de espaços em branco representadas pelo "argumento" n. Estou usando argumento entre aspas porque o argumento de uma macro em C se comporta de maneira diferente de um argumento de função, já que não há checagem de tipo e sim uma simples substituição do valor passado como argumento da macro nas suas referências dentro da própria macro. Já a macro `ROTULO(rot)` recebe como "argumento" um rótulo e imprime `Lrot` seguido de um numero de espaços de tal forma que todas as linhas que chamarem a macro `ROTULO(rot)` estarão identadas na mesma posição (desde que o rótulo tenha menos de 6 caracteres, que era o limite utilizado no programa a partir do qual tirei o código de exemplo).

Alguém certamente já bateu o olho no código acima e deve ter dito: poxa, eu poderia chamar a função
`numeroDigitos(rot)` dentro de `IMPRIME_ESPACOS` na definição da macro `ROTULO`. Não podemos nos esquecer no entanto que macros não são chamadas de função e que onde se lê `IMPRIME_ESPACOS` em `ROTULO` dever-se-ia ler na verdade a definição de `IMPRIME_ESPACOS`. Neste caso, se passássemos uma chamada de `numeroDigitos` como "argumento" de `IMPRIME_ESPACOS`, a função `numeroDigitos` seria chamada dentro do loop definido em `IMPRIME_ESPACOS` sempre que a condição de parada do loop fosse ser calculada. Ou seja, teríamos um número excessivo e desnecessário de chamadas a `numeroDigitos`. Para solucionar este eventual problema, decidi criar uma variavel para armazenar o valor da chamada de `numeroDigitos` e passar esta variavel como argumento para `IMPRIME_ESPACOS`. O problema é que dependendo de onde este código for ser substituído pode não ser permitido ter declarações de variáveis.

Neste último caso (e em muitos outros), o código mostrado no início deste post, por mais bizarro que possa parecer a primeira vista, pode ser a solução, pois o uso do ` do { ... } while (false);` torna possível a criação de um contexto local dentro das chaves do falso loop na macro. Dentro deste contexto é possível criar-se quantas variáveis se queira ou, por exemplo, encadear comandos dentro de uma macro que não ficarão perdidos se esta macro for utilizada dentro de um if-else.

Ah, e se alguém ficou curioso, procure na Internet: vocês verão muitos outros usos do do-while (false). Sinceramente, muitos deles, na minha opinião são dispensáveis e só servem para complicar código que poderia ser escrito de outra forma. E, pra falar a verdade, a única construção que eu já achei em códigos livres foi esta que eu cito aqui, dentro de macros. É preciso ter dicernimento na hora de usar este tipo de construção. Aliás, para falar a verdade, mesmo este caso que eu descrevi aqui, que eu acho interessante e útil eu só usária em últimos casos em códigos profissionais.
