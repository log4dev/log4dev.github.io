---
author: mgalves
comments: true
date: 2006-04-19 11:21:04
layout: post
slug: captura-de-teclas-em-javascript-parte-1
title: Captura de teclas em Javascript - Parte 1
wordpress_id: 62
categories:
- Desenvolvimento
tags:
- Interfaces
- Javascript
- Web
- Ajax
---

A sigla Web 2.0 tem sido muito utilizada recentemente. Talvez seja o nome mais marketeiro depois de AJAX. Aliás  Web 2.0 depende muito de AJAX. O fato é que softwares Web-based com comportamentos muito semelhantes à aplicações desktop tem pipocado pela internet, e com certeza os exemplos mais impressionantes e eficientes são os produtos lançados pela Google, como o Google Maps, Google Calendar, Google Reader, entre outros.  E de fato, o grande barato da Web  2.0 é tentar mudar o paradigma de uso da internet, tornando a experiência do usuário mais rica e interativa (detesto essa expressão "experiência rica", mas no momento não me veio nada mais apropriado), fazendo com que a web deixe de ser um conjunto de hipertextos, e passe a ser um conjunto de serviços.

Neste esforço de deixar as interfaces web mais interativas, dinâmicas e eficientes, a captura e tratamento de eventos de teclado pode ser uma característica desejável e desejada. A boa notícia é que fazer isso é relativamente simples, usando  Javascript. Existem basicamente 3 tipos de eventos de tecla que se pode capturar: keyDown, keyPress e  keyUp. Os eventos keyDown e keyUp são disparados respectivamente no momento de descida e subida da tecla, e o evento keyPress é disparado quando a tecla está pressionada. Portanto quando uma tecla é pressionada, os eventos são disparados na ordem  keyDown, keyPress e keyUp. 

É interessante notar que a forma como os eventos é disparada varia ligeiramente dependendo do  S.O: no Linux, os eventos keyDown e keyUp são disparados apenas uma vez por evento de tecla, e keyPress é disparado várias vezes, enquanto a tecla estiver pressionada (não sei bem qual a taxa de disparo, mas é bastante rápida). Já no  Windows  (tanto no IE quanto no Firefox), apenas o evento onKeyUp é disparado apenas uma vez por evento. Os eventos keyDown e keyPress são disparados sequencialmente enquanto a tecla estiver pressionada (ou seja, caso você mantenha a tecla apertada, o sistema irá lançar a seqüência keyDown-keyPress-keyDown-keyPress....). Não tive a oportunidade de testar no  Mac OS, o que é uma folha imperdoável já que eu só uso Mac em casa, mas testarei assim que possível. Esta pequena diferença faz com que a estratégia de captura seja diferente  dependo do evento desejado. As seguinte situações me vêem à cabeça:



	
  1. O sistema deseja capturar apenas um evento por tecla pressionada. No Linux pode se usar onKeyDown ou onKeyUp. No Windows, apenas onKeyUp. Portanto, para que o script seja funcional em todos os sistemas, a melhor escolha é onKeyUp.

	
  2. O sistema deseja capturar repetidamente uma tecla pressionada, para simular por exemplo o funcionamento de uma tecla pressionada numa caixa de texto (imprime várias vezes o caractere pressionado). Neste caso, a melhor escolha é onKeyPress, que funciona nos dois SOs. Mas é preciso tomar cuidado no caso do Windows:  caso o handler de onKeyDown estiver habilitado também, o sistema irá capturar duas vezes o evento, o que pode ser problemático.

	
  3. O sistema deseja capturar uma vez a descida da tecla, e uma vez a subida. Isso pode ser útil para medir o tempo de pressão da tecla. No caso  do Linux, é muito simples: um handler para keyDown e um  handler para keyUp, e ambos eventos serão disparados apenas uma vez. No caso do Windows, a estratégia é mais complicada, uma vez que onKeyDown será lançado repetidas vezes. Eu não tenho uma solução em mãos, mas deve ser necessário fazer um controle de qual tecla foi apertada, e não executar caso o evento ja tenha sido processado.

	
  4. O sistema deseja capturar a descida da tecla uma vez, processar a tecla pressionada várias vezes, e capturar a subida da tecla uma vez.  Tanto no caso do Windows quanto do Linux, me parece que a melhor solução é criar um handler para cada evento, mesclando as situações 2 e 3. Em ambos os casos, a ordem de execução será keyDown, keyPress e keyUp. No caso do windows, será necessário utilizar a mesma solução da situação 3 para evitar que keyDown seja processado várias vezes.


Como eu não sei qual o tamanho máximo de um artigo neste blog, vou deixar para o próximo post a descrição de como escrever o código para capturar estes eventos.
