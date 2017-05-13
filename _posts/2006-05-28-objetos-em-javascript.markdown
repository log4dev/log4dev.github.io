---
theme:
  name: twitter
author: mgalves
comments: true
date: 2006-05-28 19:00:00
layout: post
slug: objetos-em-javascript
title: Objetos em Javascript
wordpress_id: 66
categories:
- Desenvolvimento
tags:
- Javascript
- Linguagens de Programação
- Web
---

Javascript fornece mecanismos básicos para criação de objetos.

Segue abaixo um código simples, de um objeto que simula o comportamento de um StringBuffer em Javascript (cujas vantagens foram discutidas[ neste post](http://log4dev.blogspot.com/2006/04/stringbuffer-em-javascript.html)):

    
    function StringBuffer() {
        this.buffer = [];
    };
    
    StringBuffer.prototype.append = function append(string) {
       this.buffer.push(string);
       return this;
    };
    
    StringBuffer.prototype.toString =function toString() {
       return this.buffer.join("");
    };


O código acima cria um objeto do tipo StringBuffer, com um construtor vazio e com um atributo buffer. Depois cria 2 métodos: append e toString. Dois pontos são interessantes no código acima:



	
  1. Um objeto em Javascript é no fundo uma função, e o construtor é a lista de parâmetros desta função.

	
  2. O objeto prototype, interno a qualquer objeto Javascript, permite que se adicione métodos e atributos em runtime em qualquer objeto Javascript, incluindo objetos da biblioteca padão.


Uma outra forma de escrever o objeto acima seria com a seguinte sintaxe:

    
    function StringBuffer() {



    
    
       this.buffer = [];
    
       append = function append(string) {
          this.buffer.push(string);
          return this;
       };
    
       toString = function toString() {
        return this.buffer.join("");
       };
    }


Qualquer instrução que estiver fora de alguma função interna será executada automaticamente quando se criar um novo objeto do tipo StringBuffer, sendo portanto o equivalente à um construtor.

Minha opinião: o uso de objetos em JS é altamente recomendado para suprir a falta de estruturas de dados mais sofisticadas e para organizar certas partes do código
