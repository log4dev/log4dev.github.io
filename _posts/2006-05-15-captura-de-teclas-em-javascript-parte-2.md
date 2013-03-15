---
title: 'Captura de teclas em Javascript &#8211; Parte 2'
author: Miguel Galves
layout: post
permalink: /2006/05/15/captura-de-teclas-em-javascript-parte-2/
dsq_thread_id:
  - 
categories:
  - Desenvolvimento
tags:
  - Interfaces
  - Javascript
  - Web
---
# 

Demorei pra escrever a segunda parte desse pequeno tutorial, mas antes tarde do que nunca. No post anterior eu expliquei brevemente o funcionamento da captura de teclas em Javascript. Neste vou colocar uma receitinha de bolo.

Segue o código, compatível com IE e Firefox. Qualquer dúvida com os comentarios, entre em contato: 
    document.onkeyup=handleKeyboardAction;
    
    function handleKeyboardAction(e){
    
    
    
    var code;
    
    
    
    // Obtém o evento. No caso do Firefox, este
      // evento é passado como argumento, e no caso do IE,
      // deve ser obtido através do objeto window.
       if (!e) var e = window.event;
    
    
    
    // Detecta o target da tecla
       var targ;
       if (e.target) targ = e.target;
       else if (e.srcElement) targ = e.srcElement;
    
    
    
    // Este código previne um erro do navegador Safari:
      // Se o usuari clica num DIV com texto, os outros browsers
      // retornam o DIV como sendo o target. Safari retorna  o nó contendo
      // o texto (nodeType 3). Nesse caso, o target que nos interessa é o pai.
       if (targ.nodeType == 3) // defeat Safari bug
          targ = targ.parentNode;
    
    
    
    // Obtém o nome da TAG HTML do target do evento
       tag = targ.tagName.toUpperCase();
    
    
    
    // Verifica se o evento não esta sendo acionado em nenhum
      // campo como campo de texto e combobox.
      // Esta verificação é importante, pois o handler pode bloquear
      // o funcionamento adqueado desses campos (por exemplo, em vez de escrever
      // a letra no campo, executa uma função).
       if (tag == "INPUT")
          return;
    
    
    
    if (tag == "SELECT")
            return;
    
    
    
    // Detecta o codigo da tecla
       if (e.keyCode) code = e.keyCode;
       else if (e.which) code = e.which;
    
    
    
    var character = String.fromCharCode(code);
    
    
    
    // Executa o procedimento associado à uma letra.
       if(character == "R"){
       }
    
    
    
           //Seta para cima
        if(code == 38) {
               ...
              return;
        }
        
        //Seta para direita
        if(code == 39) {
                ...
                return;
        }
        
        //Seta para esquerda
        if(code == 37) {
            return;
        }
        
    
    
    
    }