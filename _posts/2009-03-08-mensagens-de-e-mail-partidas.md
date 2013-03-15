---
title: Mensagens de e-mail partidas
author: Leonardo Garcia
layout: post
permalink: /2009/03/08/mensagens-de-e-mail-partidas/
dsq_thread_id:
  - 64842317
categories:
  - Protocolo
tags:
  - anexo
  - e-mail
  - mensagem
  - partida
  - Protocolo
  - SMTP
---
# 

Há um tempo atrás me deparei com um problema muito interessante.

Uma pessoa que eu conheço estava em cima do prazo para mandar uma proposta de requisição de bolsa de pesquisa e tinha recebido a revisão da sua proposta de seu orientador. No entanto, por algum motivo que eu não consigo explicar decentemente até hoje, o e-mail com um anexo enviado pelo orientador chegava sempre quebrado em três e-mails na conta do Gmail que era usada como destino. Quando estes e-mails eram abertos no Gmail eles apareciam como grandes textos com uma sequência de caracteres “criptográficos”. E, no tópico dos e-mails aparecia a sinalização 1/3 para o primeiro, 2/3 para o segundo e 3/3 para o terceiro.

Alguém já vivenciou algo parecido? Confesso que não me lembro de nada parecido desde que comecei a usar e-mails há cerca de 15 anos atrás.

O orientador tentou enviar este e-mail diversas vezes e sempre acontecia o mesmo problema. Tentamos trocar de e-mail de destino e o mesmo problema aconteceu. Como os e-mails não chegavam corretamente e como, naquele momento, não era possível um encontro pessoalmente com o orientador para pegar o arquivo, quase demos a proposta como perdida.

Aí me lembrei de algumas coisas que aprendi na faculdade que, com um pouco mais de pesquisa, fizeram com que eu conseguísse remontar a mensagem original no meu computador.

Primeiramente, lembrei que mensagens de e-mail com arquivos anexados (e outros tipos de transmissões de dados binários em protocolos da Internet) não são transmitidos de forma binária, mas sim com um tipo de codificação chamado base-64. Basicamente este tipo de codificação pega os dados binários e os mapeiam em um sistema numérico de base 64 composto não só por números mas também por caracteres ASCII imprimíveis. Desta forma um arquivo binário vira, no final da transformação, um longo arquivo texto. Este arquivo texto é transmitido pela rede.

Minha disconfiança era que cada uma das três partes daquele e-mail nada mais era que um pedaço do arquivo anexado codificado em base-64. No entanto, porque a mensagem estava sendo dividida?

Uma outra coisa que me lembrei é que, em geral, mensagens transmitidas na Internet são quebradas em partes menores durante a transmissão. O protocolo de comunicação em geral especifica como estas mensagens devem ser quebradas. Como sabia que o protocolo de e-mail utilizado para o envio do e-mail era o [SMTP][1] fui atrás da especificação do protocolo no [IETF][2]. Lá eu vi que as mensagens SMTP eram quebradas em partes para transmissão, como eu suspeitava. Porém, o servidor que recebesse as mensagens deveria reconstruí-las. Porém no cabeçalho das mensagens estava faltando algumas informações necessárias para a reconstrução das mesmas, o que devia estar levando o Gmail a não fazer o seu trabalho corretamente.

 [1]: http://www.ietf.org/rfc/rfc2821.txt
 [2]: http://www.ietf.org/

O que eu fiz então? Peguei cada uma das três mensagens parciais e concatenei-as em um editor de texto comum, preservando o cabeçalho inicial e removendo os cabeçalhos intermediários. Além disso precisei corrigir alguns detalhes que especificavam o tipo do anexo (eu sabia que era um documento do Word). Depois destes passos, gravei tudo em um grande arquivo texto e coloquei nele a extensão eml, que em geral é utilizada por leitores de e-mail para gravar mensagens de e-mail em disco. Feito isso abri o Thunderbird e pedi para que ele abrisse o arquivo que eu tinha “gerado” na mão. Ele não só conseguiu abrir o arquivo como também conseguiu gravar o anexo sem nenhum erro! ![:)][3] 

 [3]: http://log4dev.com/wp-includes/images/smilies/icon_smile.gif