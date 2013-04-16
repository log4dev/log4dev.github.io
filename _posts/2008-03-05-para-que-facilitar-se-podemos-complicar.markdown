---
author: mgalves
comments: true
date: 2008-03-05 19:51:37
layout: post
slug: para-que-facilitar-se-podemos-complicar
title: Para que facilitar se podemos complicar
wordpress_id: 257
categories:
- Tutorial
tags:
- Linux
- Ferramentas
- Redes
- Software Livre
---

**Por Ricardo Capitanio**

Estava eu com o pequeno problema de montar a infraestrutura necessária para acessar um repositório **SVN  **por **HTTPS**. Traduzindo em miúdos: precisava configurar um "Virtual Host" com **SSL **no **Apache**. Não pretendo virar especialista em Linux, nem em Apache e muito menos em SSL. Apenas tentei fazer o óbvio em tempos de Internet: achar um tutorial para isso. E tutoriais não faltam.

Só que no meio do caminho tinha uma pedra: eu estava utilizando o Kubuntu 7. Nos n+1 tutoriais que encontrei falavam de um tal de script _apache2-ssl-certificate _ para a geração do certificado, inclusive os _Howtos_ do _"Ubuntu Forums".__ _Procurei como de costume no _/usr/sbin_, mas o dito cujo não estava lá. Instalei novamente o pacote _apache2.2-commons,  _mas ele  teimou em não aparecer.

Foi quando novamente recorri ao Google e encontrei a [seguinte thread](https://launchpad.net/ubuntu/+source/apache2/+bug/77675), que discute justamente o problema descrito:


> Bug #77675: apache2-ssl-certificate is nowhere to be found once apache2 is installed as of feisty.


Como em qualquer trhead relacionada à software livre, o leitor encontrará lá uma _emocionante_ discussão, em que várias _soluções_ paliativas são sugeridas. Lá pelas tantas, um post de um tal de [Soren Hansen](https://launchpad.net/%7Eshawarma) (um dos colaboradores do Ubuntu) termina com a discussão:


> I'm rejecting this bug, as the ssl-cert package provides make-ssl-cert and also usr/share/ssl-cert/ssleay.cnf.
If you feel that this is not sufficient, feel free to reopen this bug.


Muito bem! É um típico exemplo em que por algum motivo não se pensa no usuário.  A retirada do script deve ter algum motivo técnico, talvez economizar alguns KBytes. Mas isso me custou alguns minutos a mais somente para executar uma única ridícula linha do tutorial. Com certeza, a perda de tempo não só minha mas de outros vários usuários não foi levada em consideração.

Eu nunca terei uma distribuição Linux própria, mas se esse for o seu caso, pense bem antes de remover alguns KBytes da sua. Ah... a solução que adotei? Estava naquela thread, bem [aqui.](https://launchpad.net/ubuntu/+source/apache2/+bug/77675/comments/15)

**[Ricardo Capitanio é Engenheiro de Computação formado pela UNICAMP, e tem um longo registro de terrorismo contra call centers, Telefônica, Claro, e agora Ubuntu]**
