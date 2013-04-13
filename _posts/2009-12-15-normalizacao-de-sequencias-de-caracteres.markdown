---
author: mgalves
comments: true
date: 2009-12-15 05:00:18
layout: post
slug: normalizacao-de-sequencias-de-caracteres
title: Normalização de sequências de caracteres
wordpress_id: 702
categories:
- Desenvolvimento
tags:
- Desenvolvimento
- Java
- Linguagens de Programação
- Python
- Unicode
---

Um dos motivos que diminuiram minha participação neste blog nos últimos meses foi o meu trabalho intenso no [SigaSeuTime](http://www.sigaseutime.com.br). Entre os sócios no projeto, sou o único desenvolvedor, e a lista de tarefas não para de crescer. Gostaria de contar aqui um problema simples que tive que resolver, e que pode interessar outros desenvolvedores.

No mês passado, colocamos no ar dois bots, um para o **MSN** e outro para o **GTalk/Orkut**, que podem ser utilizados como alternativa para o **Twitter** para receber notícias e jogos ao vivo. Os bots funcionam como usuários normais: você adiciona o dito cujo na sua lista de amigos (usando o email sigaseutime@siga.st) e passa a receber mensagens. Ao contrário do Twitter, onde cada canal representa um time ([@sigaFlamengo](http://twitter.com/sigaflamengo), [@sigaVasco](http://twitter.com/sigavasco), [@sigaCorinthians](http://twitter.com/sigacorinthians), etc...), nos bots um usuário pode selecionar um ou mais times, enviando a mensagem **siga &lt;nomedotime&gt;**.

Internamente, eu mantenho duas versões de nomes para cada canal do sistema: o nome completo (Corinthians, São Paulo, Palmeiras, Santo André, Seleção Brasileira, etc..) e um slug (corinthians, saopaulo, palmeiras, santoandre, selecaobr). Pra quem não sabe, um slug pode ser definido como uma versão URL Friendly do nome: sem acentos, espaços em branco e caracteres não ASCII. Originalmente, os bots aceitavam o uso de um dos dois nomes no comando. Por exemplo, **siga Santo André** ou **siga santoandre**.

Obviamente, fomos recebendo feedbacks de usuários que não conseguiam cadastrar um time. Em geral, isto acontecia com times com nomes compostos e/ou acentos. Analisei o log e percebi que era muito comum alguém digitar **siga sao paulo** por exemplo. Como o cliente tem sempre razão, decidi que um algoritmo mais espertinho de leitura do nome se fazia necessário: criei então uma funcionalidade de conversão de nomes para slugs. A primeira parte foi fácil: colocar tudo em letras minúsculas, remover espaços e outros simbolos não conformes.

Faltava a parte mais importantes: converter caracteres acentuados em caracteres não acentuados. afinal, para efeito de comparação, são e sao deveriam ser equivalentes. Inicialmente pensei em criar uma tabelinha de conversão simples, mas desisti porque a chance de alguém digitar um caso não contemplado era muito grande. Fui então pesquisar na Internet, e descobri que o **UNICODE** já prevê esta funcionalidade, e já tem tudo mapeado. Ainda bem que existem cientistas da computação prevenidos no mundo!

Este recurso se chama **Normalização** (como não pensei nisso antes....), e oferece 4 formas distintas: **NFD**, **NDC**, **NFKC**, e **NFKD**. Cada uma tem suas particularidades, e aconselho a quem se interessar pelo assunto pesquisar no site do UNICODE: [http://www.unicode.org/faq/normalization.html](http://www.unicode.org/faq/normalization.html).

O essencial é entender que existe um mapeamento de caracteres compostos (por exemplo ç = c + cedilha, ou ã = a + ˜), e que existem bibliotecas em algumas linguagens que implementam este mapeamento e que podem ser utilizadas para fazer a conversão. Vou dar um exemplo em Java e em Python:

**Java**:

    
    import java.text.Normalizer;
    import java.text.Normalizer.Form;
    Normalizer.normalize(string, Form.NFD);



**Python:**

    
    from unicodedata import normalize
    unicodedata.normalize(forma, string)#forma pode ser 'NFC', 'NFD', 'NFKC' ou 'NFKD'



Utilizando este recurso, eu consigo facilmente converter SANto André, Santo Andre, SANTOandre ou qualquer outra combinação para o formato que eu espero: santoandre. 
