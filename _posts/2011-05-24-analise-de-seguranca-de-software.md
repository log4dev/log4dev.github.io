---
title: Análise de Segurança de Software
author: Alexandre Barbosa
layout: post
permalink: /2011/05/24/analise-de-seguranca-de-software/
dsq_thread_id:
  - 312458637
categories:
  - Linux
  - Segurança
---
# 

Há cerca de um mês recebi a tarefa de descobrir vulnerabilidades em um software desenvolvido por uma equipe diferente da minha, onde estou atualmente trabalhando. O trabalho parecia muito interessante (e tem se mostrado desta forma). O único problema é que ainda não tinha tido experiência nesta área, o que tornou a tarefa ainda interessante.

Logo de início, o problema inicial foi o de obter informações sobre a área, para saber como realizar este trabalho. Neste ponto, minha preocupação era muito mais o de assimilar um conjunto mínimo de conhecimento teórico sobre o tema, do que o de juntar ferramentas. No entanto, o prazo era curto, e não poderia dispender muito tempo realizando pesquisas. Neste momento, lembrei-me de ter visto em algum lugar, ao pesquisar sobre distribuições linux, que existiam distribuições criadas especificamente para este fim. Foi quando o google me levou ao [BackTrack][1], uma distribuição linux customizada para a realização de testes de intrusão, incluindo uma série de ferramentas com foco nos mais diferentes tipos de testes de segurança.

 [1]: http://www.backtrack-linux.org/ "BackTrack"

Baixei a distribuição, instalei numa VM e pude ver uma infinidade de aplicações, com diferentes propósitos – Mapeamento de redes, identificação de vulnerabilidades, intrusão, escalada de privilégios, engenharia reversa, etc. Vários termos totalmente desconhecidos para mim. Com isto, resolvi mapear cada uma das ferramentas disponíveis, e pesquisar para que serviam, que tipo de ataques avaliavam, que técnicas utilizavam – claro que uma pesquisa bastante superficial, mas suficiente para me iniciar neste mundo.

Com isto fui apresentado a *sniffers*, *spoofers*, *fingerprinters*, *fuzzers*, e uma série de protocolos que me trouxeram vagas lembranças de minhas aulas de redes de computadores. Com isto, pude formar uma visão (ainda que bastante míope) do que poderia começar a avaliar em termos de segurança, e começar a botar a mão na massa.

Infelizmente (para mim, que queria achar um monte de falhas e me sentir um mega *hacker*), a aplicação que estou avaliando, e a infra-estrutura sobre o qual está sendo executada, foi bastante bem feita. Mas mesmo assim, fomos capazes de detectar algumas vulnerabilidades, que foram reportadas à equipe de desenvolvimento, e já corrigidas ou mitigadas.

Este processo tem sido muito interessante, e trouxe uma nova visão à minha mente de desenvolvedor. Uma preocupação com segurança que antes eu não possuía, aguçada por agora conhecer diferentes formas que pode-se comprometer um sistema, que antes desconhecia. Recomendo que aqueles que puderem, procurem conhecer um pouco sobre esta área, seja estudando esta distribuição, como fiz, ou consultando as diversas fontes de informação disponíveis. Uma que recomendo, especialmente para quem trabalha com desenvolvimento web é o [OWASP – The Open Web Application Security Project][2].

 [2]: https://www.owasp.org/ "OWASP"

E se você que está lendo, possui alguma recomendação de material sobre segurança, por favor poste nos comentários.