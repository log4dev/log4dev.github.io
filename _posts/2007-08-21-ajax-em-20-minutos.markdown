---
theme:
  name: twitter
author: mgalves
comments: true
date: 2007-08-21 22:33:02
layout: post
slug: ajax-em-20-minutos
title: AJAX em 20 minutos
wordpress_id: 173
categories:
- Desenvolvimento
tags:
- Javascript
- Linguagens de Programação
- Web
- Ajax
---

Antes de mais nada, vamos ajustar certos conceitos.

AJAX = Asynchronous Javascript XML.  Portanto, AJAX é basicamente uma técnica que consiste em fazer requisições HTTP de forma assíncrona para o servidor **(Nota: AJAX não é uma tecnologia. É uma técnica. Quem disser que é uma tecnologia merece arder no fogo do inferno pela eternidade)**. Se você não sabe o que é uma requisição HTTP, sugiro dar uma olhada [aqui](http://pt.wikipedia.org/wiki/HTTP). Não tem como escapar, é a base de tudo.

Fazer uma requisição  assíncrona significa que o processo irá rodar por trás das cortinas, não interferindo no funcionamento da tela no navegador, ao contrário do que acontece em uma requisição normal. Quando executamos uma requisição síncrona no navegador (através de um link ou submetendo os dados de um formulário), toda a interface para de responder a eventos. Isto fica particularmente claro (e chato) quando a página é pesada e/ou a rede esta lenta.


As vantagens da técnica são óbvias: interfaces mais leves, suaves, muito próximas daquelas de aplicativos desktop.


Pré requisitos para conseguir mexer com AJAX? conhecer um pouco de Javascript, DOM HTML e conhecer pelo menos uma linguagem de programação server side.

**Passo 1: Preparando o terreno**

Para começar, uma má notícia: muito do trabalho normalmente feito pelo navegador quando submetemos um formulário com dados tem que ser feito pelo script javascript. Ou seja, tem que ser feito pelo desenvolvedor. Um deles é construir a string de requição. O formato da string é algo do tipo


_chave1=valor1&chave2=valor2&..._




Não existe muito segredo. O único cuidado a ser tomado é em relação aos caracteres especiais. Espaços, símbolos como &, =,  caracteres acentuados e caracteres não [ASCII](http://pt.wikipedia.org/wiki/ASCII) devem ser convertidos para o formato [Unicode](http://pt.wikipedia.org/wiki/UNICODE).  Em Javascript [existem várias funções](http://xkr.us/articles/javascript/encode-compare/) que fazem este tipo de conversão, mas o mais adequado é o par encodeURIComponent/decodeURIComponent.




O seu uso é muito simples: _var string_codificada = encodeURIComponent(string_original)_.




Em caso de requisições muito longas, aconselho o uso de um StringBuffer, que torna o processo de contatenação de strings muito mais eficiente. [Veja aqui como fazer isso](http://log4dev.com/2006/04/06/stringbuffer-em-javascript/).




**Passo 2: enviando os dados para o servidor**


Muito bem. Já temos uma string de requisição, agora precisamos enviar isto para o servidor. Para isso, existem 2 métodos: GET e POST .



	
  * O método GET envia os parâmetros na requisição  (_www.meusite.com?chave1=valor1&chave2&valor2..._) e tem uma limitação de tamanho de 1024 bytes. É mais indicado para enviar parâmetros relacionados á busca de informações no servidor.

	
  * O método POST envia os parâmetros de forma separada, e não tem limitação de tamanho. É mais indicado para envio de dados de formulários, textos longos e dados que serão armazenados no servidor. Se os dados forem maiores que 4KB, alguns cuidados especiais devem ser tomados, como mostrado [aqui](http://log4dev.com/2006/04/04/envio-de-grandes-conjuntos-de-dados-com-ajax/).


Para executar a requisição, o primeiro passo é criar o objeto HTTPRequest:

    
    
    var req;
    
    if (window.XMLHttpRequest)
    
        req =  new XMLHttpRequest();
    
    else if (window.ActiveXObject)
    
        req = new ActiveXObject('Microsoft.XMLHTTP');
    
    else
    
        req =  new ActiveXObject('Microsoft.XMLHTTP2');


O código acima cria um objeto de requisição para Windows ou Firefox (eles são ligeiramente diferentes, apesar de terem interfaces de uso iguais). Com o objeto de requisição na mão, o próximo passo é definir a função que será chamada quando o resultado da requisição enviado pelo servidor estiver disponível:
`
req.onreadystatechange = minhafunc;`

O uso desta função será explicado no próximo passo. Finalmente, o envio dos dados. Se o método usado for GET, a receita de bolo é
`
requestObject.open('GET', url, true);
requestObject.send(null);
`

Onde _url = endereçodapagina?stringderequisicao_. Se o método for POST, a receita de bolo é

    
    
    requestObject.open('POST', url, true);
    
    requestObject.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    
    requestObject.setRequestHeader("Connection", "close");
    
    if (parameters != null)
    
        requestObject.setRequestHeader("Content-length", parameters.length);
    
    requestObject.send(parameters);


onde URL é apenas o endereço do servidor, e parameters contém a string de requisição. Muito bem, os dados foram enviados. Agora é esperar os dados voltarem, e irmos para o próximo passo.

**Passo 3: obtendo a resposta**

No passo 2, definimos o valor do atributo ` req.onreadystatechange`. Esse atributo é uma função que será chamada pelo navegador para tratar a resposta. Uma forma de definir a função é

    
    req.onreadystatechange= function(){
    
        //corpo da função vai aqui
    
    }


Um ponto a ser ressaltado é que esta função pode ser chamada várias vezes, sem a resposta estar disponível ainda: a o processo passa por vários estados antes de estar pronto para processamento. Portanto é necessário testar o status do processamento. Isto pode ser feito com o seguinte código

`req.onreadystatechange= function(){
if (req.readyState == 4){
if (req.status == 200){
//Resposta disponivel
}
}
}
`

O atributo readyState pode assumir 4 valores:



	
  * 0: requisição não inicializada

	
  * 1: conexão estabelecida

	
  * 2: requisição recebida

	
  * 3: processando

	
  * 4: requisição terminad, resposta pronta.


Já o atributo status fornece o status do protocolo HTTP. 200 significa OK.

Muito bem, temos a resposta. O último passo é processar o resultado. Para obter o DOM XML,  basta executar _req.responseXML_. Para trabalhar com o conteúdo como se fosse uma sequência de texto, basta executar _req.responseText_. E para processar o resultado como JSON, basta executar  _eval("("+req+")")_.

Segue um exemplo completo de código que recebe um snippet HTML (um trecho de código em HTML) e atualiza o conteúdo de uma DIV com este código:

    
    function atualizaDiv(){
    
        var req;
    
        if (window.XMLHttpRequest){
    
            req = new XMLHttpRequest();
    
        } else if (window.ActiveXObject){
    
           req =  new ActiveXObject('Microsoft.XMLHTTP');
    
        }else{
    
           req =  new ActiveXObject('Microsoft.XMLHTTP2');
    
        }    req.open('POST', url, true);
    
        req.setRequestHeader('Content-Type','application/x-www-form-urlencoded');    req.onreadystatechange = function(){
    
            if (req.readyState == 4){
    
               if (req.status == 200){
    
                   document.getElementById("minhaDiv").innerHTML=req.responseText;
    
                   document.body.style.cursor = "default";
    
               }
    
            }
    
        }
    
    req.send(params);
    
    }


Em breve escreverei um post comentando sobre vantagens e desvantagens de se usar texto, XML ou JSON como resposta de uma requisição.

Caso esteja interessado em usar uma **biblioteca simples** para **desenvolver sites com Ajax**, ou queria ver exemplos de **código escrito em Javascript**, dê uma olhada na [Juice Lib](http://code.google.com/p/juicelib), uma **biblioteca em Javascript** que estou desenvolvendo. O código está em [http://code.google.com/p/juicelib](http://code.google.com/p/juicelib).

Quer aprender mais dicas avançadas de Javascript?[ Funções com argumentos variáveis em Javascript](http://log4dev.com/2007/10/13/funcoes-com-argumentos-variaveis-em-javascript/),[ Captura de teclas em Javascript - Parte 1](http://log4dev.com/2006/04/19/captura-de-teclas-em-javascript-parte-1/),[ Captura de teclas em Javascript - Parte 2](http://log4dev.com/2006/05/15/captura-de-teclas-em-javascript-parte-2-2/) e [Concatenação eficiente de Strings em Javascript](http://log4dev.com/2006/04/06/stringbuffer-em-javascript/)
