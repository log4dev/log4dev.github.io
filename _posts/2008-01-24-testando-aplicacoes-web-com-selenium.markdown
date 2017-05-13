---
theme:
  name: twitter
author: mgalves
comments: true
date: 2008-01-24 16:45:58
layout: post
slug: testando-aplicacoes-web-com-selenium
title: Testando aplicações web com Selenium
wordpress_id: 237
categories:
- Desenvolvimento
tags:
- Desenvolvimento
- Ferramentas
- Interfaces
- Testes
- Web
---

**Por Odracir Antunes Júnior**


Creio que boa parte dos desenvolvedores sabe da importância dos testes automatizados como ferramenta indispensável no desenvolvimento de software. Mesmo assim, para deixar as coisas ainda mais claras, gostaria de compartilhar uma experiência que tive com meus amigos em um projeto recente.

Estavamos trabalhando em um projeto de produto genérico, que serviria para várias empresas. Conseguimos um primeiro cliente que, obviamente, solicitou várias adequações para que o produto pudesse se utilizado por ele. Algum tempo depois tínhamos mais dois clientes além daquele inicial. Um deles pretendia utilizar apenas um sub-conjunto do produto original, e outro precisava de mudanças que eram incompatíveis com os outros dois.

A gestão da configuração do projeto se tornava cada vez mais complexa. Precisávamos atuar em frentes diferentes, para atender às necessidades dos clientes. Tínhamos que implementar as novas funcionalidades, porém sem quebrar o que já existia. Pra variar, acabamos atrasando. E os novos prazos estavam ficando cada vez mais apertados. Algumas vezes nós chegamos à entregar versões preliminares para homologação, com bugs em funcionalidades que já tinham sido testadas e aprovadas em versões anteriores. Isto nos causava um grande desgaste perante o cliente, e era preciso garantir a qualidade do que estava sendo entregue.

Tínhamos uma equipe de testes que também estava sobrecarregada, pois quanto mais complexos se tornavam os produtos, maiores eram as dificuldades na simulação dos cenários diferentes para os testes. Foi definido um "[Smoke Test](http://en.wikipedia.org/wiki/Smoke_testing)", com as funcionalidades essenciais do produto que eram comuns entre os clientes. No meio da correria, depois de um refactoring crítico na infraestrutura do projeto, eu tive que testar  manualmente a aplicação. Fiquei 4 dias testando e mal passei de 40% da cobertura básica!

Passada aquela correria, começamos a automatizar o processo de "Smoke Test" tanto quanto possível. Já sabíamos que muitas outras correria ainda nos esperavem num futuro não muito distante!

Boa parte das aplicações desenvolvidas últimamente são aplicações WEB, e portanto também é fundamental poder fazer testes através do browser, como se fosse um usuário comum operando o sistema. Obviamente isto não exime o desenvolvedor de implementar os testes unitários. Os testes através da camada web devem ser um complemento aos testes mais básicos.

O [**Selenium**](http://www.openqa.org/selenium/) é uma ferramenta de para testes de aplicações WEB, distribuído sob a "[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)". Temos os seguintes produtos, e modos de uso do Selenium.


### **[Selenium Core - (Modo direto)](http://www.openqa.org/selenium-core/) **

Os testes são efetuados diretamente através do browser. As páginas de teste devem estar hospedadas no mesmo servidor que o programa/site a ser testado.  Esta restrição/característica é [função da segurança relativa à mesma origem requerida pelo javascript](http://www.mozilla.org/projects/security/components/same-origin.html).


Vantagens:
	
* Suporte para todos os browsers


Desvantagens:
	
* É necessário a instalação remota no servidor.	
* Possui algumas limitações para testes mais complexos.	
* Pode ter um comportamento irregular quando se testam páginas com ajax,  onde é necessário um controle maior do tempo, e/ou seqüencia de eventos. Este comportamento é altamente dependente do "engine" java script do browser. Dependendo do caso, às vezes pode apresentar falsos erros em função da priorização das atividades, já que tando "quem testa" quanto "quem é testado" estão sendo executados sob o mesmo "engine" java script, e comportamentos concorrentes podem não ser tão previsíveis assim ...




### **[Selenium IDE - (Modo indireto - Plugin no browser)](http://www.openqa.org/selenium-ide/)**

Os testes são efetuados através de um plugin instalado no FireFox. Este plugin é um ambiente integrado de desenvolvimento. Permite gravar a navegação do usuário, e depois repeti-la à titulo de teste. Também permite exportar os testes gravados em outros formatos. (Maiores explicações adiante...)


Vantagens:
	
* A instalação é local e simples.	
* É muito fácil de usar.	
* Permite gravar sessões de teste para uso posterior.	
* Permite exportar as sessões de teste como arquivos fonte Java, C#, Perl, PHP, Python e Ruby, que podem ser usados pelo Selenium RC.
* Excelente para quem inicia o uso do Selenium.	
* Não é preciso saber programar.


Desvantagens:
	
* Funciona como plugin apenas no FireFox.	
* Possui algumas limitações para testes mais complexos.	
* Pode apresentar o mesmo comportamento irregular relatado no item Selenuim Core. (colocar link local para #L1)

### **[Selenium RC - (Modo indireto - Programa de teste + Proxy) ](http://www.openqa.org/selenium-rc/)**

Os testes são efetuados através de um programa, que comanda o browser através de um proxy. Este programa pode ser escrito em Java, C#, Perl, PHP, Python e Ruby.

Vantagens:
	
* Permite o uso de verdadeiras linguagens de programação.	
* Permite um controle muito mais apurado do tempo, seqüencia de eventos, etc. ...	
* É possível importar os testes gerados pelo Selenium IDE.	
* Muito mais flexível e poderoso. Pode evoluir até para grandes suítes de testes, integração contínua, geração de relatórios . Como o programa está nas suas mãos você pode fazer o que quiser!




Desvantagens:
	
* A instalação e configuração do ambiente é um pouco mais trabalhosa.	
* É necessário saber programar.
* Pode ser mais complicado escrever os testes à partir do "zero".

### Qual ferramenta/modo eu devo usar ?

Além das informações listadas [aqui](http://wiki.openqa.org/pages/viewpage.action?pageId=763), gostaríamos de sugerir a seguinte abordagem híbrida:
	
* Instale o Selenium IDE e crie os seus testes básicos.	
* Exporte esses testes como programas (java, por exemplo).
* Crie um projeto com as suítes de teste para uso com o [jUnit](http://www.junit.org/).
* Faça um refactoring nas classes geradas pelo Selenium IDE, pois o código gerado tem muita redundância.	
* Melhor ainda seria arrumar o código para ficar simples como uma mini "DSL" (Links #9 e #10), mais adequada para a sua aplicação, com chamadas de mais alto nível.

Depois de que automatizamos uma parte dos testes, aquilo que eu levei 4 dias era feito em apenas 20 minutos! Uma cobertura mais abrangente e confiável! A tranquilidade e a segurança que temos depois que os testes passam após um "refactoring", ou mesmo antes de uma entrega do sistema para o cliente, é algo que não tem preço!

**Moral da história**: O tempo utilizado na elaboração de testes automatizados não é um tempo "gasto". Na verdade é um tempo "investido"!


**Odracir Antunes Júnior é Analista de Sistemas com mais de 20 anos de experiência de desenvolvimento de sistemas em C, C++ e Java**
