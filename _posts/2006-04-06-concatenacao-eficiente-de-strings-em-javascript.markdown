---
theme:
  name: twitter
author: mgalves
comments: true
date: 2006-04-06 14:53:19
layout: post
slug: concatenacao-eficiente-de-strings-em-javascript
title: Concatenação eficiente de Strings em Javascript
wordpress_id: 58
categories:
- Desenvolvimento
tags:
- Javascript
- Linguagens de Programação
- Web
- IE
- Firefox
---

Quem programa em **Java** sabe que operações de **concatenações** de **String** são muito mais eficientes utilizando **StringBuffer** e função **append** do que usando o comando _**String A = String B + String C**_.

Isso porque a cada operação de soma dessas, uma nova String é alocada para que seja feita a cópia dos dados, e alocação de memória em Java é uma operação cara. Em **Javascript**, esse problema também ocorre. Pesquisando na Internet, descobri um código que simula o comportamento de um StringBuffer em nessa linguagem.

Fizemos alguns testes no IE e no firefox, com um loop que concatena Strings. No Firefox, a diferença entre usar o operador **+** e a função append é pequena. A grande vantagen é que a segunda é mais estável em termos de performance que a primeira.

Em compensação, no IE o uso de append é absurdamente mais eficiente do que no firefox. Testes mostram que para concatenar 1000 Strings de tamanho 100, o append era 60 vezes mais rápido. Portanto, seu uso é altamente recomendável em scripts que façam muitas concatenações e que precisam ser otimizados.

Segue o código:
`
function StringBuffer() {
this.buffer = [];
};
StringBuffer.prototype.append = function append(string) {
this.buffer.push(string);
return this;
};
StringBuffer.prototype.toString = function toString() {
return this.buffer.join("");
};`

Para usar, basta criar uma variável do tipo StringBuffer:
`
var buffer = new StringBuffer();buffer.append("Hello");
buffer.append(" ");
buffer.append("world"):
System.out.println(buffer.join()):`

Esta técnica é muito útil na hora de atualizar o **conteúdo **de uma **DIV **em uma página web usando o comando **innerHTML**.Via de regra, nunca use `document.getElementById("minhadiv").innerHTML += "nova string"` repetidamente. Sempre use um string buffer para armazenar a string intermediária, e modifique o innerHTML somente no final da operação.
