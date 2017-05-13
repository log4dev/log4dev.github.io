---
theme:
  name: twitter
author: lullis
comments: true
date: 2007-10-29 07:35:10
layout: post
slug: xml-para-que-conheca-yaml-o-primo-esperto-das-linguagens-de-markup
title: XML para quê? Conheça YAML, o primo esperto das linguagens de markup.
wordpress_id: 202
tags:
- Ferramentas
- Javascript
---

Conhece a anedota? Conta que um programador estava tentando resolver um problema: ele tinha um sistema que precisava manipular e enviar informação estruturada para outros clientes. Num instante de pura sagacidade, ele pensou "Já sei. Vou usar XML!". No instante seguinte, de pura decepção, ele constatou: "Agora eu tenho dois problemas. Não bastasse meu problema original, eu vou usar XML."

De todos os alfabetos gastos em tecnologias que construiam "em cima" do XML (XQuery, XPath, XSL, XML-RPC, X-Men, Xuxa, sei lá) não consigo lembrar de nenhum que traga algo novo. Parece que é o tipo de coisa que cai na categoria "problemas inventados pelos vendors de software para que eu possa continuar justificando[ lucros trimestrais de US$4 bilhões](http://www.msnbc.msn.com/id/21477273/)."

Tudo que eu e o programador da anedota precisamos é de um sistema que possa passar informação de um jeito estruturado. Se puder ser facilmente lido como texto, tanto melhor. Ninguém merece ter que ficar editando arquivo CSV, não é mesmo?

Que tal  a possibilidade de ver um registro de uma fatura num formato assim?

    
    invoice: 34843
    
    date   : 2001-01-23
    
    bill-to: &id001
    
        given  : Chris
    
        family : Dumars
    
        address:
    
            lines: |
    
                458 Walkman Dr.
    
                Suite #292
    
            city    : Royal Oak
    
            state   : MI
    
            postal  : 48046
    
    ship-to: *id001
    
    product:
    
        - sku         : BL394D
    
          quantity    : 4
    
          description : Basketball
    
          price       : 450.00
    
        - sku         : BL4438H
    
          quantity    : 1
    
          description : Super Hoop
    
          price       : 2392.00
    
    tax  : 251.42
    
    total: 4443.52


Esse é um documento [YAML](http://yaml.org), válido. Bonitinho, né? Pena que ninguém mais usa isso por aí... e de que adianta ser capaz de emitir algo assim, se ninguém é capaz de receber? Vou ter que continuar usando XML?
Não necessariamente. Especialmente se está mexendo com web e já ouviu falar de uma outra _darling_ das notações de marcação, JSON.

JSON, essa você já deve ter ouvido falar. Seu browser mastiga isso com uma facilidade tremenda:

    
    {"student": {
    
      "first name": "John",
    
      "last name": "Smith",
    
      "course": {
    
        "report": [
    
          {"Subject": "Math", "grade": "A"},
    
          {"Subject": "English", "grade": "C"},
    
          {"Subject": "Arts", "grade": "F"}]}}}
    
     }


É só pedir para o seu interpretador Javascript avaliar essa string, e você tem um objeto que pode processar, e apresentar um relatório lindo para os pais do John, que vão dar uma bronca  nele por ele não largar do computador e não ter aprendido a desenhar flores em aquarela.

Deixa eu contar  o pulo do gato: **todo JSON válido também é YAML**. A notação usada em JSON é usada para descrever [_inline collections_](http://yaml4r.sourceforge.net/cookbook/#multi-line_inline_collections) em YAML. Se você tiver uma string que seja a representação de um objeto em JSON, ele será visto como um objeto pelo seu parser de YAML (escolha [aqui](http://yaml.org/download.html) seu parser, na sua linguagem/plataforma favorita).

O que se ganha com isso? Um exemplo: validação e manipulação de formulários. Que tal a possibilidade de não só validar os dados no cliente, mas também pegar os campos de um formulário, verificar se o objeto está consistente, transformar em uma string [JSON](http://www.json.org/js.html) (usando um [emitter](http://www.json.org/json.js) apropriado) e enviar para o servidor essa string? Depois, o seu parser de YAML vai te montar um objeto, o qual pode ser muito mais facilmente validado e verificado.

Para quem quiser fazer formulários onde campos podem ser livremente adicionados ou removidos, ou usar toneladas de AJAX em seu aplicativo web, a combinação JSON + YAML funciona e é uma mão na roda.
