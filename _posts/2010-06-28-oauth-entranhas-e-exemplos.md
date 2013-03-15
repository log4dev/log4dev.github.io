---
title: OAuth na prática
author: Miguel Galves
layout: post
permalink: /2010/06/28/oauth-entranhas-e-exemplos/
dsq_thread_id:
  - 
categories:
  - Uncategorized
---
# 

O comentário geral em relação ao [meu post sobre OAuth][1] foi: *“Legal, mas FALTAM EXEMPLOS!”*

 [1]: http://log4dev.com/2010/06/23/oauth/

Oks, oks, oks, ei-lo. Vou usar como caso de uso o envio de um status novo para o twitter (tweets para os íntimos) em **Python**. Para isso, vou usar a lib **oauth2**, disponível para download no [GitHub][2] em . Segundo o wiki do [OAuth][3]: 
> “OAuth 2.0 is the next evolution of the OAuth protocol which was originally created in late 2006. OAuth 2.0 focuses on client developer simplicity while providing specific authorization flows for web applications, desktop applications, mobile phones, and living room devices.” Para começar, criamos uma instância de token e consumer, usados para autenticar as requisições. Neste exemplo, eu uso o algoritmo SHA1 para gerar a assinatura da requisição:

 [2]: http://github.com
 [3]: http://wiki.oauth.net/OAuth-2

`import oauth2 as oauth
token = oauth2.Token(token, tokensecret)
consumer = oauth2.Consumer(consumerkey, consumersecret)
signmethod = oauth2.SignatureMethodHMACSHA1()`

Feito isso, temos que criar a url de requisição. No caso de envio de um **tweet**,  a url é **http://api.twitter.com/1/statuses/update.json**, o método de envio é **POST**, com apenas um parâmetro, **status**, contendo o conteúdo da mensagem. O protocolo oauth requer alguns parâmetros extras, como mostrado abaixo:

  `url = "http://api.twitter.com/1/statuses/update.json"
params = {
'oauthversion': "1.0",
'oauthnonce': oauth2.generatenonce(),
'oauthtimestamp': int(time.time()),
'status': 'Enviando uma mensagem para o Tweeter'
}
request = oauth2.Request(method="POST", url=url, parameters=params)
request.signrequest(self.signaturemethod, self.Consumer, token)
`

Com um objeto do tipo Request na mão, só me resta executar a **requisição HTTP** propriamente dita, usando a lib [**urllib2**][4], nativa do Python: 

 [4]: http://docs.python.org/library/urllib2.html

  `import urllib2
opener =  urllib2.buildopener()
encodedpostdata = request.topostdata()
response = opener.open(url, encodedpostdata)
opener.close()`