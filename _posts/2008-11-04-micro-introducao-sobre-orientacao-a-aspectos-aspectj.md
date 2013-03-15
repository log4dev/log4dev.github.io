---
title: Micro introdução sobre orientação a aspectos (AspectJ)
author: Thiago Bartolomei
layout: post
permalink: /2008/11/04/micro-introducao-sobre-orientacao-a-aspectos-aspectj/
dsq_thread_id:
  - 
categories:
  - Desenvolvimento
  - Design
  - Ferramentas
  - Pesquisa
---
# 

Eu estava pensando em escrever sobre algumas coisas que têm me interessado ultimamente e que têm alguma relação com o [post sobre vazamento de memoria em Java][1], mas eu percebi que não teria como, sem fazer uma pequena introdução sobre programação orientada a aspectos (aspect oriented programming, AOP). A gente já discutiu um pouco sobre isso no post sobre [decorators em python][2], mas não fizemos nada mais introdutório (se você já tem uma noção do assunto, provavelmente não vai achar esse artigo muito útil). Então nesse post eu vou falar sobre alguns conceitos de [desenvolvimento orientado a aspectos][3](AOSD), mas com ênfase descarada em AOP na forma como implementada em [AspectJ][4]. Eu não pretendo cobrir em profundidade o assunto, pretendo somente dar uma idéia da motivação e discutir alguns pontos sobre o paradigma. Além disso, eu vou usar na maioria a terminologia em inglês, pois eu acho estranho traduzir termos tecnológicos. Se alguem tiver interessado em termos em português, o pessoal do workshop em AOP (WASP’04) fez um [catálogo de termos][5].

 [1]: http://log4dev.com/2008/10/25/vazamento-de-memoria-em-java/
 [2]: http://log4dev.com/2008/04/24/poor-mans-profiler-decorators-em-python/
 [3]: http://aosd.net
 [4]: http://www.eclipse.org/aspectj/
 [5]: http://twiki.dcc.ufba.br/bin/view/WASP04/Termos

**Motivação e Exemplo**

No meu ponto de vista, AOSD não é algo que veio revolucionar o desenvolvimento de software, mas sim um avanço incremental do paradigma de orientação a objetos (OO). Todo bom programador sabe que se deve tentar distribuir as responsabilidades (*concerns*) do programa em módulos, de forma que cada módulo seja fácil de implementar, entender e reusar. Em C, por exemplo, funções podem ser consideradas módulos. Pra qualquer programa não trivial, você não vai criar somente uma função `main()`, vai separar a funcionalidade em muitas funções que se chamam pra realizar o objetivo do software. Já OO prega a modularização do software em uma hierarquia de classes e conta com polimorfismo, herança, etc. A motivação de AOSD é que existem algum concerns que entrecortam a hierarquia, ou seja, que mesmo criando essa hierarquia de classes, você não tem como separar dois concerns que deveriam ser separados (para serem melhor implementados, entendidos e reusados).

Pra não ficar somente no abstrato, vamos à um exemplo bem simples, que é utilizado constantemente pra apresentar AOP. Imagine que você tem uma classe que faz o controle do acesso ao banco de dados. O código abaixo é um esboço de como uma classe dessas seria implementada em Java. Você tem um gerente de transações e, em todos os métodos de acesso ao banco de dados, você chama o gerente pra iniciar uma transação e fazer commit se tudo deu certo, ou rollback se deu algum problema. Note que hoje em dia ninguém faria um código assim, já que existem soluções melhores do que ficar escrevendo SQL no seu código (como [Hibernate][6]), mas é bem ilustrativo do problema. 
    
    
    public class DB {
        TransactionManager manager = ...;
    
    
    
        public void storeUser(User u) {
            manager.start();
            try {
                // write some sql code storing u into the DB
                manager.commit();
            } catch (DBException e) {
                manager.rollback();
            }
        }
        public void storeAccount(Account a) {
            manager.start();
            try {
                // write some sql code storing a into the DB
                manager.commit();
            } catch (DBException e) {
                manager.rollback();
            }
        }
        ...
        
    
    
    
    }
    Claramente dá pra perceber que eu tô misturando dois concerns na mesma classe. Um é persistência (salvar o User e a Account no banco de dados) e outro é controle de transações. Em OO, não tem um jeito elegante de separar esses concerns. Você pode até tentar fazer uma interface com uma callback pra tentar minimizar a repetição de código, como no código abaixo, mas não fica ideal.
        
        
        public interface TransactionalTask {
            public void execute();
        }
        public class TransactionManager {
            TransactionManager manager = ...;
        
        
        
            public void executeInTransaction(TransactionalTask task) {
                manager.start();
                try {
                    task.execute();
                    manager.commit();
                } catch (DBException e) {
                    manager.rollback();
                }
            }
            ...
            
        
        
        
        }
        public class DB {
            public void storeUser(User u) {
                manager.executeInTransaction(new TransactionalTask() {
                    public void execute() {
                        // write some sql code storing u into the DB
                    }
                });
            }
            ...
        }
        A idéia de AOSD é criar um novo módulo (chamado aspecto) em que você possa encapsular esses concerns que não tem como você modularizar com classes. AspectJ é a implementação mais conhecida de AOP, tanto por ser a primeira, quanto por ser bem robusta e contar com apoio de diversas empresas. Em AspectJ, que é uma extensão de Java (todo código Java é código AspectJ válido), nós criaríamos um aspecto pra encapsular controle de transações. O pseudo código abaixo mostra a idéia (eu não testei o código, então não garanto copy-and-paste funcionando).
            
            
            public aspect TransactionManagerAspect {
                TransactionManager manager = ...;
            
            
            
                around(Object o) : execution(public void DB.*(..)) &amp;&amp; args(o) {
                    manager.start();
                    try {
                        proceed(o);
                        manager.commit();
                    } catch (DBException e) {
                        manager.rollback();
                    }
                }
                
            
            
            
            }
            
            
            
            public class DB {
            
            
            
                public void storeUser(User u) {
                    // write some sql code storing u into the DB
                }
                public void storeAccount(Account a) {
                    // write some sql code storing a into the DB
                }
                ...
                
            
            
            
            }
            A classe DB agora contém somente código relativo à persistência e o aspecto é responsável pelo controle de transações. Em terminologia de AOSD, around é um tipo de *advice* e execution um tipo de *pointcut*. O que esse código tá dizendo é que sempre que a execução do programa for iniciar um método publico, que retorna void, na classe DB, o método deve ser substituído (por isso &#8220;around&#8221;) por esse advice aqui. O código do advice vai fazer o controle da transação e vai chamar proceed pra executar o código original. Note que o código do advice é muito parecido com a nossa solução usando callbacks. A grande novidade aqui é que usando pointcuts a gente consegue especificar quando que a &#8220;callback&#8221; deve ser usada, deixando o código da classe DB bem mais limpo.
            
            
            
            Esse exemplo mostra a parte dinâmica da história, isto é, como usar aspectos pra &#8220;interceptar&#8221; alguns pontos da execução de um programa e inserir (ou remover) funcionalidade (código) nesses pontos. Mas AOSD também trata da parte estática ou &#8220;estrutural&#8221; da coisa. Por exemplo, imagine que no nosso exemplo nós quiséssemos inserir um controle de concorrência bem primitivo, pra garantir que ninguém modificou o User no tempo entre eu buscar no banco e salvar. Pra isso, eu poderia adicionar um campo na classe User com um contador que é incrementado sempre que ele for salvo no banco. Desta forma, na hora de salvar, eu confiro se o valor do contador no objeto que recebi é o mesmo do banco de dados. Se não for, significa que alguém alterou o objeto e eu recebi um objeto inconsistente. Novamente, o problema é que esse campo não faz parte do concern persistência ou modelo de dados. Portanto, não faria sentido eu declarar o contador na classe User. Pra resolver esse problema, AspectJ usa *intertype declarations*, que permitem a declaracão de campos e métodos em outras classes. Por exemplo, o código abaixo declara e inicializa um campo counter na classe User, removendo dela o concern tratamento de concorrência.
                
                
                public aspect ConcurrencyManagerAspect {
                    long User.counter = 0;
                    ...
                }
                **Conceitos**
                
                
                
                Quando eu estava descrevendo o exemplo eu me referi à alguns conceitos de AOSD. Mas acho importante deixar um pouco mais explícito, então seguem algumas definições.
                
                
                
                Existem alguns eventos que acontecem durante a execução de um programa que são interessantes de serem interceptados. Esses pontos são chamados *join points*. Nós vimos que a execução de um método é um ponto interessante quando o objetivo é substituir o método ou introduzir funcionalidade antes ou depois do método. Outros join points, por exemplo, são a chamada de um método (não confundir com a execução), a leitura ou escrita de um campo, ou a inicialização estática de uma classe. Mas esses join points são eventos concretos que acontecem em tempo de execução. *Pointcuts* são um jeito de especificar de forma abstrata (por exemplo, com regular expressions) quais join points você quer interceptar. AspectJ oferece pointcuts primitivos pros join points mais importantes (como execution, call, get, etc) e outros pointcuts usados pra identificar os objetos envolvidos nos eventos e ligá-los a variáveis. No nosso exemplo, args foi usado pra pegar uma referência ao objeto passado como parâmetro ao método. Outros pointcuts importantes são target (e.g., o objeto que é o destino de uma chamada de método) e this (e.g., o objeto que faz a chamada).
                
                
                
                Quando um join point acontece em runtime e ele faz match com um pointcut, então se executa o *advice* relativo ao pointcut (se tiver algum). Nós vimos como um advice do tipo around funciona. AspectJ também tem advices before e after (que pode ser after throwing ou after returning), que servem pra introduzir código antes ou depois do join point. *Intertype declarations* também são disponibilizadas por AspectJ pra introduzir novos campos métodos em outras classes, como vimos no exemplo.
                
                
                
                Um aspecto é então um módulo usado pra encapsular todas essas construções, do mesmo jeito que uma classe encapsula métodos e campos. O objetivo principal de um aspecto é de modularizar um interesse (concern) que não faz parte da decomposição normal da hierarquia de classes. Esses concerns são chamados de *crosscutting concerns*, porque eles entrecortam a hierarquia. A implementação de um concern é dita espalhada (scattered) quando ela não está localizada, e entrelaçada (tangled) quando ela está misturada com outros concerns.
                
                
                
                Pra quem tiver interesse, o [AspectJ Programming Guide][7] é um excelente tutorial com bons exemplos e referências pros diversos tipos de pointcuts, além de explicar alguns problemas que você pode encontrar quando não tiver muita experiência com aspectos.
                
                
                
                **Discussão**
                
                
                
                No texto acima eu tratei AOSD e AOP quase como sinônimos, mas eu quero enfatizar que são distintos. Orientação a aspectos surgiu como AOP, pois trazia soluções pra problemas diretamente ligados ao código, como no exemplo sobre controle de transações. Contudo, percebeu-se que seria interessante elevar o nível de abstração e que crosscutting concerns podiam também ser encontrados em design, arquitetura, análise de requisitos, etc. Então AOSD trata não só da programação, mas também de todo o conjunto de metodologias, processos, etc, ligados ao desenvolvimento de software usando a idéia de que crosscutting concerns devem ser tratados como &#8220;first class citizens&#8221;.
                
                
                
                Na minha experiência, AOP como encontrada em AspectJ é utilizada quase que exclusivamente em círculos acadêmicos. Existem algumas empresas que adotam AspectJ para alguns projetos, mas a linguagem está longe de ser adotada em larga escala. Porém, alguns conceitos de AOP são muito usados em alguns frameworks e application servers como [Spring][8] e [JBoss][9]. Spring, por exemplo, tem o conceito de interceptors, que nada mais são do que pointcuts e advice, mas menos poderosos (não permitem interceptar join points de pouca granularidade, como getters, se não me engano).
                
                
                
                Eu acredito que existem atualmente dois grandes impedimentos pra se usar AOP em larga escala. Primeiro é a tecnologia do compilador. Hoje em dia ninguém aceita trabalhar com um compilador que não seja incremental. Quando você usa Eclipse e faz uma alteração no código, o JDT só compila o necessário. O similar para AspectJ, AJDT, tenta fazer o mesmo. Porém, a tarefa é muito mais difícil, pois uma pequena mudança tem que ser verificada perante todos os pointcuts do seu sistema, pois de repente o que você mudou pode agora ser interceptado pelo pointcut. Assim, apesar de ter uma performance relativamente boa, trabalhar com AspectJ usando AJDT não é tao agradável quanto trabalhar com Java usando JDT.
                
                
                
                Segundo, AOSD não vai acabar com todos os seus problemas. É difícil pros programadores entenderem os conceitos e leva tempo pra comunidade desenvolver design patterns e entender o que tirar de melhor do paradigma. Pointcuts são atualmente regular expressions, então eles são frágeis e qualquer mudança de nome de um método pode fazer um pointcut não mais interceptar aquele método, e você não tem como perceber que isso aconteceu. Suporte de boas ferramentas é então essencial. Além disso, eu tenho dúvidas de que aspectos sejam bons pra modularizar concerns heterogêneos como &#8220;logging&#8221;, que foi sempre um dos principais exemplos. O problema é que cada instância de logging é muito específica pro contexto, então não faz sentido você remover todas as chamadas de log e encapsular em um advice, pois o advice teria que ser diferente pra cada ponto que ele interceptasse. Controle de transações é homogêneo, pois o advice sempre faz a mesma coisa, então é um exemplo mais apropriado. Existem estudos que apontam que Mixin Layers são melhores pra concerns heterogêneos como logging, mas isso seria assunto para um outro post.
                
                
                
                ==========================
                Nota no dia 5/11
                
                
                
                Conversando com o Miguel eu acabei percebendo algo que talvez não tenha ficado muito claro. AspectJ é uma extensão de Java e precisa de um compilador especial que compila as classes como se fossem Java e depois analisa os aspectos do sistema e faz diretamente as modificações no código (ou introduz testes de tempo de execução quando não tem como verificar estaticamente o resultado). Esse último passo, &#8220;introduzir os aspectos&#8221;, é chamado *weaving*.
                
                
                
                Existem duas alternativas principais de compiladores pra AspectJ. O ajc é parte do [AJDT][10], que é uma extensão do JDT do Eclipse. Como o JDT, o AJDT contém editor, compilador, debugger, e tudo o mais, implementados em plugins pro Eclipse. O principal objetivo do projeto é que a compilação seja rápida pra que você tenha a mesma experiencia que programando em Java, ou seja, ele tenta ser incremental e o código do compilador em si é otimizado (leia-se, não-facilmente extensível).
                
                
                
                A outra alternativa é o abc ([Aspect Bench Compiler][11]), que é um compilador acadêmico cujo objetivo principal é ser extensível pra que se possa fazer pesquisa com linguagens de programação, otimização de código, análise estática, etc. Dessa forma, compilar um sistema grande com abc, principalmente usando as otimizações disponíveis, é bem demorado. O ideal é programar usando o AJDT e usar o abc pra gerar o bytecode de produção, já que ele é bem mais otimizado que o gerado pelo ajc.
                
                
                
                Além disso, AspectJ não é a única linguagem orientada à aspectos derivada de Java. No site da aosd.net, por exemplo, tem uma lista com alguns [sistemas][12] (derivados ou não de Java) e algumas [ferramentas][13] orientadas a aspectos.

 [6]: http://www.hibernate.org
 [7]: http://www.eclipse.org/aspectj/doc/released/progguide/index.html
 [8]: http://www.springframework.org
 [9]: http://jboss.org
 [10]: http://www.eclipse.org/ajdt/
 [11]: http://aspectbench.org
 [12]: http://aosd.net/wiki/index.php?title=Supported_Systems
 [13]: http://aosd.net/wiki/index.php?title=Tools_for_Developers