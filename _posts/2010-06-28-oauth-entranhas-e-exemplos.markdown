---
author: mgalves
comments: true
date: 2010-06-28 04:00:05
layout: post
slug: oauth-entranhas-e-exemplos
title: OAuth na prática
wordpress_id: 770
---

O comentário geral em relação ao [meu post sobre OAuth](http://log4dev.com/2010/06/23/oauth/) foi: _"Legal, mas FALTAM EXEMPLOS!"_

Oks, oks, oks, ei-lo. Vou usar como caso de uso o envio de um status novo para o twitter (tweets para os íntimos) em **Python**. Para isso, vou usar a lib **oauth2**, disponível para download no [GitHub](http://github.com) em [http://github.com/simplegeo/python-oauth2](http://github.com/simplegeo/python-oauth2). Segundo o wiki do [OAuth](http://wiki.oauth.net/OAuth-2):


> "OAuth 2.0 is the next evolution of the OAuth protocol which was originally created in late 2006. OAuth 2.0 focuses on client developer simplicity while providing specific authorization flows for web applications, desktop applications, mobile phones, and living room devices."


Para começar, criamos uma instância de token e consumer, usados para autenticar as requisições. Neste exemplo, eu uso o algoritmo SHA1 para gerar a assinatura da requisição:

`import oauth2 as oauth
token = oauth2.Token(token, token_secret)
consumer = oauth2.Consumer(consumer_key, consumer_secret)
sign_method = oauth2.SignatureMethod_HMAC_SHA1()`

Feito isso, temos que criar a url de requisição. No caso de envio de um **tweet**,  a url é **http://api.twitter.com/1/statuses/update.json**, o método de envio é **POST**, com apenas um parâmetro, **status**, contendo o conteúdo da mensagem. O protocolo oauth requer alguns parâmetros extras, como mostrado abaixo:



`url = "http://api.twitter.com/1/statuses/update.json"
params = {
'oauth_version': "1.0",
'oauth_nonce': oauth2.generate_nonce(),
'oauth_timestamp': int(time.time()),
'status': 'Enviando uma mensagem para o Tweeter'
}
request = oauth2.Request(method="POST", url=url, parameters=params)
request.sign_request(self._signature_method, self._Consumer, token)
`

Com um objeto do tipo Request na mão, só me resta executar a **requisição HTTP** propriamente dita, usando a lib [**urllib2**](http://docs.python.org/library/urllib2.html), nativa do Python: 



`import urllib2
opener =  urllib2.build_opener()
encoded_post_data = request.to_postdata()
response = opener.open(url, encoded_post_data)
opener.close()`
