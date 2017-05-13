---
theme:
  name: twitter
author: lullis
comments: true
date: 2007-12-26 02:58:06
layout: post
slug: especial-de-natal-log4dev-construindo-um-site-de-noticias-usando-python-parte-3
title: 'Especial de Natal Log4Dev: construindo um site de notícias usando Python -
  Parte 3'
wordpress_id: 232
categories:
- Desenvolvimento
- Tutorial
- Python
- Web
---

Já falei muito. Vamos começar?


### Instalação


O web.py é um módulo escrito em Python. Você pode instalá-lo junto com os outros pacotes de sua instalação em Python, ou pode simplesmente copiar a pasta com o código para algum local que esteja dentro do seu Python Path.

A instalação direta pode ser feita pelos métodos já tradicionais. Usando easy_install, por exemplo. Há pacotes fornecidos pela Debian, também.

Se você quiser, você pode baixar no site o código da [última versão liberada](http://webpy.org/static/web.py-0.22.tar.gz). Se fizer isso, você vai pegar a pasta "web" e colocar no na sua pasta de código, da mesma forma que você faria com um outro módulo desenvolvido por terceiros.


### Aplicativo Mínimo


O que nós sabemos sobre HTTP?



	
  * Que é um protocolo de aplicação, ou seja, é um protocolo para a transmissão de dados pertencentes a uma aplicação que se utiliza de arquitetura cliente/servidor.

	
  * Que o servidor HTTP recebe requisições e deve fornecer respostas .

	
  * Que cada requisição indica um método (uma ação) que deve ser tomado sobre um recurso disponível no servidor. Em outras palavras, se um cliente envia uma requisição **GET /images/company_logo.gif**, podemos entender que o cliente deseja obter (**GET**) o recurso **/images/company_logo.gif.**

	
  * Que existem vários métodos: GET, HEAD, POST, PUT, DELETE... cada um sendo usado para indicar uma intenção diferente do cliente em relação ao recurso.


O web.py fornece um servidor web básico, indicado para a fase de desenvolvimento/debug/testes. Vamos colocar esse servidor pra funcionar. Vamos ver como fica um  aplicativo mínimo, onde o servidor responde com um "Hello" para cada requisição GET que for feita, independente do recurso solicitado. Como fazer isso?

Para isso, o servidor do web.py precisa:

	
  * De uma indicação de quais recursos ele deve prover uma resposta.

	
  * Como responder, para cada método.


As 8 linhas abaixo fazem isso.

    
    import web



    
    urls = (



    
        '/(.*)', 'index'
    
    )



    
    class index:



    
        def GET(self, resource):
    
            print "Hello, dude. Are you really trying to GET /%s?" % resource



    
    if __name__ == '__main__': web.run(urls, globals())


Praticamente auto-explicativo, não é mesmo? Define-se uma variável que contém uma lista, tomada aos pares. O primeiro elemento desse par é uma expressão regular e o segundo é o nome de uma classe. Essa lista é passada como parâmetro para o servidor web, que passa a usar a classe definida para atender as requisições que dão match entre a URL requisitada e a expressão regular declarada por você.

A nossa classe "index" possui um método GET, que vai responder com o "Hello, dude. E mostrar qual foi o recurso solicitado pelo cliente". Salvando esse arquivo (chamado "code.py", por exemplo), basta invocar o interpretador Python

    
    
    $python code.py


e teremos um servidor rodando na porta 8080. Se quiser mudar a porta-padrão, é só passar como parâmetro na hora de iniciar o script.

Você vai ver que usamos o velho _print _para a parte de resposta. O web.py (na versão 0.22) altera o descritor de arquivo stdout, e faz com que qualquer coisa que seria normalmente enviada para o console seja enviada para o socket que foi aberto para o cliente. Se você desejar monitorar alguma coisa no console, a função a ser usada é web.debug().

Bem, se você conseguiu colocar o servidor para rodar e seu browser recebe a resposta, creio que está tudo bem com o seu setup do web.py. Podemos partir para o próximo passo e adicionar algumas funcionalidades para o nosso serviço.

**_Observação importante:_** Essa série não é um texto para aprendermos técnicas de análise ou de projeto de software. Portanto, não estranhe a forma que vamos montar o webapp, ou até mesmo a falta de "best practices" no desenvolvimento. Por exemplo, usaremos um único arquivo para todo o sistema, sem separar por classes ou funcionalidades. Vamos trabalhar de forma bastante iterativa e , para cada funcionalidade proposta que exercite algum novo conceito, vamos verificar quais são as mudanças necessárias no nosso código e adaptar o código para isso.


### 




### 1) Criando a página para enviar links.


Poderíamos começar o nosso site criando a página principal, onde todos os links são listados. Mas precisamos ter um sistema inicial que permita que os links sejam incluídos, não é mesmo?

Vamos começar por aí, então. Vamos criar uma página onde o usuário preenche um formulário com um único campo de texto, representando um link. Esse link precisará ser salvo. Para tanto, vamos utilizar um servidor de banco de dados e criar uma tabela "Link", na qual cada link possui um número de identificação, uma url e uma data de publicação.

    
    CREATE TABLE Link (



    
    	id serial PRIMARY KEY,
    
    	url varchar(512) NOT NULL,
    
    	date_published timestamp NOT NULL DEFAULT NOW()



    
    );


Para a funcionalidade desejada, necessitamos:



	
  * uma forma de apresentar um formulário com o campo de texto para o usuário.

	
  * uma forma de processar o formulário.

	
  * uma forma de fazer "sanitização de dados". Qualquer dado que é enviado pelo usuário é potencialmente perigoso, ainda mais se for um dado que será usado para construir consultas SQL.

	
  * ser capazes de inserirmos os dados no banco de dados.


Mais uma vez, o web.py pode nos ajudar com essa tarefa. O web.py contém um módulo para a manipulação de formulários. Nele, define-se uma lista de input fields (nos moldes do HTML: text, dropdown, radio, checkbox, etc) e uma série de atributos desses inputs (nome, tamanho, valores default), além de uma série de **funções de validação **desses campos de entrada.

Para ilustrar, vejamos o formulário definido abaixo:

    
    SubmitForm = form.Form(
            form.Textbox('url',
                         form.Validator('Deve começar com "http://"', lambda x: x.startswith('http://')),
                         description='Link'),
            form.Button('Enviar!', type="submit")
            )





Temos um objeto Form, com um campo de texto e um botão. O campo de texto será obrigatoriamente uma string que começa com a substring "http://".

Dois métodos importantes: **Form.render() **e **Form.validates()** . O primeiro retorna uma string que é a representação HTML de cada um dos inputs que ele contém, o segundo verifica se os valores contidos em um formulário satisfazem todos as funções de validação. Muito mais pode ser feito com isso, e você pode verificar isso na [documentação de form em web.py](http://webpy.org/form).

Para a parte de banco de dados, precisamos apenas definir quais os parâmetros de configuração para a conexão com o banco de dados. Depois que a conexão estiver estabelecida, usaremos os métodos adequados para a construção de queries SQL: **web.insert()**, **web.select()**, **web.update()** e **web.delete()**. Esses métodos todos precisam apenas do nome da tabela e de eventuais parâmetros opcionais (colocar um "limit" no tamanho da lista de resultados de um select, por exemplo) .

Colocando tudo junto:

    
    # -*- coding: utf-8 -*-
    
    import web
    from web import db, form
    
    urls = (
         '/submit', 'submit',
     )
    
    class submit:
        SubmitForm = form.Form(
            form.Textbox('url',
                         form.Validator('Deve começar com "http://"', lambda x: x.startswith('http://')),
                         description='Link'),
            form.Button('Enviar!', type="submit")
            )
    
        page_content = '<html><body><form id="new_link" action="/submit" method="post">%s</form></body></html>'
        def GET(self):
            frm = submit.SubmitForm()
            print submit.page_content % frm.render()
        def POST(self):
            frm = submit.SubmitForm()
            if frm.validates():
                i = web.input()
                web.insert('Link', url=i.url)
                print "Link enviado com sucesso."
            else:
                print submit.page_content % ("<p>Houve algo errado com o preenchimento</p>" + frm.render())
    
    if __name__ == "__main__":
        web.config.db_parameters = dict(dbn  = 'postgres', # servidores aceitos 'postgres', 'mysql' ou 'firebird'
                                        db   = 'nome_do_servidor',
                                        user = 'usuario_do_servidor',
                                        pw   = 'senha')
        web.run(urls, globals(), web.reloader)


Preste atenção aos seguintes detalhes:



	
  * Cria-se uma instância do formulário SubmitForm a cada requisição, seja para GET ou para POST. Se não fizermos isso, o formulário pode conter os valores de uma outra requisição feita por um outro usuário.

	
  * validates() tem como parâmetro default o valor de _web.input()_. _web.input()_ é um método que retorna um objeto do tipo Storage contendo os pares chaves/valores enviados na querystring. Um objeto Storage funciona como um dictionary, com a diferença que seus elementos podem ser acessados por d.foo ao invés de d['foo'].

	
  * Definimos o dict que contém os parâmetros necessários para o banco de dados, e colocamos logo antes da linha com web.run(). Parte do trabalho do web.run() é carregar o contexto do ambiente e inicializar a conexão com o banco de dados.

	
  * Só pode ser feita conexão com um banco de dados. Essa é uma limitação grave da versão atual do web.py, que será corrigida na próxima versão.

	
  * Adicionamos um parâmetro opcional ao web.run, chamado web.reloader. Essa diretiva permite que o servidor recarregue o código a cada requisição. Isso permite que você faça alterações no código e veja imediatamente o resultado, sem necessitar parar/reiniciar o servidor.


O app já é capaz de cadastrar os links. Amanhã (_update: vai ficar pro ano que vem, pessoal. Mas prometo que isso essa série chega ao seu fim antes da sua decoração de natal, ok?_) vamos ver como utilizar o esquema de templates do web.py para apresentar os links, além do sistema de autenticação de usuários.
