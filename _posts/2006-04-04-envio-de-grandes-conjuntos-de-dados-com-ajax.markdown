---
author: mgalves
comments: true
date: 2006-04-04 14:39:00
layout: post
slug: envio-de-grandes-conjuntos-de-dados-com-ajax
title: Envio de grandes conjuntos de dados com AJAX
wordpress_id: 56
categories:
- Desenvolvimento
tags:
- Interfaces
- Javascript
- Web
---

Hoje, totalmente por acaso, descobri alguns macetes para **envio e recepção de grandes quantidades de dados** usando **requisições HTTP** assíncronas, como por exemplo textos. Estou trabalhando em um sistema que permite que o usuário cadastre pareceres sobre informações do sistema, e estes pareceres não tem limitação de tamanho.O sistema foi implementado com **AJAX**, para permitir que os pareceres sejam carregados dinâmicamente, e gravados assincronamente.

O primeiro problema que tive foi que os textos enviados eram sempre truncados em 4096 bytes. A primeira reação foi verificar se estava enviando os dados via **POST** ou **GET**: o correto é enviar por POST, uma vez que GET tem tamanho limitado. Os dados realmente estavam sendo enviados por POST, que a priori não tem limitação alguma. Pesquisando um pouco, descobri que precisava definir um **header** **Content-length** com o tamanho do conteúdo do texto, antes de enviar a requisição. O comando correto é

    
    requestObject.open('POST', url, true);
    requestObject.setRequestHeader('Content-Type',
                                 'application/x-www-form-urlencoded');
    if (parameters != null)
        requestObject.setRequestHeader("Content-length",
                                       parameters.length);
    requestObject.send(parameters);


Bom, eu não sou um expert do protocolo **HTTP**, mas a minha explicação seria que de fato o método **POST** aceita uma quantidade ilimitada de dados, mas por default ele define o tamanho máximo como **4096**, para evitar erros. Caso o usuário deseje enviar mais, deve informar o tamanho total.

Resolvido este problema, tive um problema semelhante ao ler os dados para exibir na tela. Meu sistema abre uma requisição **AJAX**, que envia um **XML** contendo o texto do parecer inserido pelo usuário. Para recuperar o texto, executava o seguinte comando:

    
    
    var value = decodeURIComponent(
                     root.getElementsByTagName('value')[0].
                                           firstChild.data);


Este código retornava o texto corretamente no IE, mas cortava em 4096 bytes (novamente !) no **Firefox**. O mais estranho é que tanto no envio quanto na recepção, o **XML** gerado estava correto. Portanto o problema estava na leitura do** CDATA** do **XML**. Fuçando um pouco (desta vez não encontrei nada na internet), descobri que em caso de **CDATA** com mais de **4096 bytes**, o **DOM** do Firefox considera que a tag **value **possui mais de um nó filho, cada um com no máximo 4K. Assim, o código correto para obter o texto em ambos os navegadores é

    
    for(var i=0; i i++)
         value += decodeURIComponent(
                         root.getElementsByTagName('value')[0]
                               .childNodes[i].data);
