---
title: Pérolas do mundo Java
author: Miguel Galves
layout: post
permalink: /2008/08/10/perolas-do-mundo-java/
dsq_thread_id:
  - 8926029
categories:
  - Desenvolvimento
tags:
  - Algoritmos
  - Humor
  - Programação
---
# 

## **Pérola 1**

Essa é na verdade um par de pérolas. 
    Boolean.FALSE.toString ().toUpperCase ().equals ( meuObjeto.isControlado() ) Quando vi o código acima, já achei ridículo o fato do programador usar a expressão Boolean.FALSE.toString().toUpperCase() apenas para gerar uma string “FALSE”. Poderia ter sido mais simples escrever 

    "FALSE".equals(meuObjeto.isControlado()) Provavelmente o desenvolvedor queria se prevenir. Vai que false resolve mudar de nome no meio do caminho! E daí eu me perguntei: porque ele está testando string? Daí encontrei a seguinte função: 

    public String isControlado () {
        if ( this.getElementos () != null ) {
            if ( this.getElementos ().size () > 0 ) {
                return "TRUE";
             }
            return "FALSE";
        }
        return "FALSE";
    } Perfeito. Porque usar lógica booleana? 

## Pérola 2

    public List procuraPorExemplo(int arg0, boolean arg1){

    return super.procuraPorExemplo(arg0, arg1);

    }

## Pérola 3: sem comentários

    public static boolean verificaAMaiorB(int a, int b) {

    boolean resultado = false;

    if (a > b) {

    resultado = true;

    }

    return resultado;

    }

## 

## Pérola 3

    if ( objeto != null ) {

    lista = procura( objeto );// XXX

    } else {

    lista = procura ( null );

    }

## 

## Pérola 4

    if ( comandoEscala.equals ( "alterar" ) == Boolean.FALSE ){

    ....

    }