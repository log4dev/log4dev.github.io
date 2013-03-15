---
title: Para que facilitar se podemos complicar
author: Miguel Galves
layout: post
permalink: /2008/03/05/para-que-facilitar-se-podemos-complicar/
dsq_thread_id:
  - 64842072
categories:
  - Tutorial
tags:
  - Linux Ferramentas Redes
---
# 

**Por Ricardo Capitanio**

Estava eu com o pequeno problema de montar a infraestrutura necessária para acessar um repositório **SVN **por **HTTPS**. Traduzindo em miúdos: precisava configurar um “Virtual Host” com **SSL **no **Apache**. Não pretendo virar especialista em Linux, nem em Apache e muito menos em SSL. Apenas tentei fazer o óbvio em tempos de Internet: achar um tutorial para isso. E tutoriais não faltam.

Só que no meio do caminho tinha uma pedra: eu estava utilizando o Kubuntu 7. Nos n 1 tutoriais que encontrei falavam de um tal de script *apache2-ssl-certificate * para a geração do certificado, inclusive os *Howtos* do *“Ubuntu Forums”.** *Procurei como de costume no */usr/sbin*, mas o dito cujo não estava lá. Instalei novamente o pacote *apache2.2-commons, *mas ele teimou em não aparecer.

Foi quando novamente recorri ao Google e encontrei a [seguinte thread][1], que discute justamente o problema descrito: 
> Bug #77675: apache2-ssl-certificate is nowhere to be found once apache2 is installed as of feisty. Como em qualquer trhead relacionada à software livre, o leitor encontrará lá uma *emocionante* discussão, em que várias *soluções* paliativas são sugeridas. Lá pelas tantas, um post de um tal de [Soren Hansen][2] (um dos colaboradores do Ubuntu) termina com a discussão: 
> I’m rejecting this bug, as the ssl-cert package provides make-ssl-cert and also usr/share/ssl-cert/ssleay.cnf. If you feel that this is not sufficient, feel free to reopen this bug. Muito bem! É um típico exemplo em que por algum motivo não se pensa no usuário. A retirada do script deve ter algum motivo técnico, talvez economizar alguns KBytes. Mas isso me custou alguns minutos a mais somente para executar uma única ridícula linha do tutorial. Com certeza, a perda de tempo não só minha mas de outros vários usuários não foi levada em consideração.

 [1]: https://launchpad.net/ubuntu/ source/apache2/ bug/77675
 [2]: https://launchpad.net/~shawarma

Eu nunca terei uma distribuição Linux própria, mas se esse for o seu caso, pense bem antes de remover alguns KBytes da sua. Ah… a solução que adotei? Estava naquela thread, bem [aqui.][3]

 [3]: https://launchpad.net/ubuntu/ source/apache2/ bug/77675/comments/15

**[Ricardo Capitanio é Engenheiro de Computação formado pela UNICAMP, e tem um longo registro de terrorismo contra call centers, Telefônica, Claro, e agora Ubuntu]**