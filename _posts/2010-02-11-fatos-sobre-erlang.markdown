---
author: mgalves
comments: true
date: 2010-02-11 18:39:17
layout: post
slug: fatos-sobre-erlang
title: Fatos sobre Erlang
wordpress_id: 724
categories:
- Desenvolvimento
- Ferramentas
tags:
- C
- Erlang
- Java
---

Compilação de alguns pontos relevantes sobre Erlang, feita por Odracir:



	
  * Linguagem de programação de propósito geral, com ambiente de execução (runtime environment) implementado numa máquina virtual;

	
  * Possui suporte "embutido" para concorrência, distribuição, e tolerência à falhas.

	
  * É "Open-Source", distribuído através da licença "[ERLANG PUBLIC LICENSE](http://www.erlang.org/EPLICENSE)", que é essencialmente a Mozilla (Netscape) Public Licence, porém com algumas poucas modificações para torna-la compatível com a legislação Sueca.

	
  * É escrito em C, e é  portável para diversas plataformas.

	
  * Muito escalável!  Sua máquina virtual é responsável pela criação de "processos leves" de forma  rápida e barata, tanto em termos de utilização de recursos de CPU como de memória. Em outras linguagens de programação, normalmente estes serviços são delegados para o sistema operacional, o que limita  o número máximo de processos simultâneos permitidos.

	
  * Para modelar um sistema um Erlang nós usamos: "COP - Concurrency Oriented Programming".

	
  * Não existe estado compartilhado...

	
  * Variáveis podem ser atribuídas apenas uma única vez. (Single assignment variables)

	
  * Os processos se comunicam entre si através do envio de mensagens (cópias imutáveis) assíncronas.

	
  * Tipicamente um código escrito em Erlang faz uso dos diversos núcleos disponíveis nas CPUs modernas, praticamente sem codificação adicional. Testes mostram que clusters com 16 máquinas executam um programa 14,55 vezes mais rápido do que o mesmo programa sendo executado numa única máquina, sem codificação adicional ou específica para isto!

	
  * Permite a interoperabilidade com C,C++, Java, Ruby, Python, Perl, etc ...

	
  * Estudos mostram que para um mesmo projeto, o código Erlang é de 4 à 10 vezes menor que seu equivalente escrito em C++.

	
  * Possui a biblioteca  OTP (Open Telecom Platform).

	
  * Em situações extremas de "carga", um sistema Erlang tende a degradar seu desempenho, mas não para de funcionar.


