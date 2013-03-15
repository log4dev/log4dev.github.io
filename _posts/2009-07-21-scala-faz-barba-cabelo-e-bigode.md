---
title: 'Scala: faz barba, cabelo e bigode'
author: Thiago Bartolomei
layout: post
permalink: /2009/07/21/scala-faz-barba-cabelo-e-bigode/
dsq_thread_id:
  - 64842344
categories:
  - Desenvolvimento
  - Ferramentas
  - Formação
---
# 

Aprender Scala está na minha TODO list faz um bom tempo. Finalmente tive algum tempo umas semanas atrás pra dar uma olhada na linguagem. A motivação veio de diversas fontes. No laboratório onde trabalho nós estamos tendendo à usar Scala nos nossos desenvolvimentos futuros, devido a integração de elementos funcionais que facilitam a implementação de algumas partes do código; a minha pesquisa usa uma boa pitada de linguagens específicas de domínio (domain specific languages, DSLs) e Scala parece adequada para o desenvolvimento de embedded DSLs (por exemplo, veja essa DSL para [SWT em Scala][1]); e finalmente, tivemos uma palestra sobre [tagless interpreters][2], que haviam sido implementados em Haskell e OCaml, e eu queria ver como implementar um interpretador de cálculo lambda em Scala.

 [1]: http://johlrogge.wordpress.com/2009/01/06/making-swt-shine-with-scala/
 [2]: http://lambda-the-ultimate.org/node/2438

Bem, não importa se você não sabe o que são tagless interpreters ou se não se importa com lambda calculus, o foco desse post é outro. Quando comecei a aprender Scala, eu vi que a linguagem realmente faz jus ao nome (Scala vem de SCAlable LAnguage, e o objetivo era ter uma linguagem que serve pra fazer desde pequenos scripts até grandes aplicações enterprise). Basta olhar a [lista de features da linguagem][3] que você percebe que Scala faz barba, cabelo e bigode!

 [3]: http://www.scala-lang.org/node/104

Como não faz sentido discorrer sobre todas as features de Scala (isso merece um livro), eu vou me concentrar em duas pequenas coisas que deixam qualquer programador Java com inveja: Local Type Inference e Traits.

**Local Type Inference (Inferência Local de Tipos)**

Quantas vezes eu odiei ter que escrever tipos redundantes em Java (que já expliquei em alguns comentários anteriores). Imagine um método que devolve uma lista inicializada com um inteiro (é um exemplo estúpido, mas é só pra mostrar type inference in action). `
public List&#60;Integer&#62; getList() {
   List&#60;Integer&#62; list = new ArrayList&#60;Integer&#62;();
   list.add(0);
   return list;
}
`

Scala é staticamente tipada, o que significa que todos os tipos tem que ser verificados pelo compilador. Mas o compilador de Scala tenta ao máximo inferir o tipo que você está indicando. Você só precisa escrever o tipo se o compilador não conseguir determinar qual é o tipo correto. O mesmo código em Scala ficaria mais ou menos assim (Note que sou bem novato em Scala, então me perdoe se existem soluções mais elegantes): `
   def getList() = 0 :: Nil
`

O código ficou pequeno não somente por inferência de tipos, mas vamos ver como que inferência ajudou (o que segue é como eu imagino o compilador pensando). Primeiro o compilador infere que *Nil* é uma lista vazia, então pode ter qualquer tipo. O “::” é na verdade uma chamada de método (o *add*) na lista *Nil*, passando zero (0) como parâmetro (em Scala, métodos que iniciam com “:” fazem bind à direita, então *Nil* – que é uma [case class][4] de *List* – é quem recebe o método). O compilador vê que 0 é um *Int* (o equivalente de *Integer* e *int* em Scala), então o resultado de chamar *add* em *Nil* é uma lista de inteiros (ou *List[Int]*). Finalmente, o compilador vê que essa lista é retornada pelo método, então o tipo do método é *List[Int]*.

 [4]: http://www.scala-lang.org/node/107

Com isso, ao invés de escrever o tipo de lista em 3 lugares diferentes, você não precisou escrever em lugar algum, pois o tipo foi inferido do conteúdo e essa informação foi propagada. Note que se a lista estivesse vazia, você teria que escrever pelo menos 1 vez qual é o tipo (pois não tem como inferir do conteúdo), mas é melhor que 3 vezes!

**Traits**

Traits são basicamente interfaces com implementação. Já é sabido faz um bom tempo que herança múltipla (multiple inheritance, MI) causa dores de cabeça enormes (o Google, por exemplo, proíbe uso de MI no desenvolvimento interno de aplicações C ). A resposta de Java foi o conceito de interfaces, que te dão um poder parecido com MI (porque uma classe pode estender diversas interfaces, então pode ser usada polimorficamente no lugar de qualquer uma delas), mas muito mais restrito (porque a classe tem que implementar os métodos de todas as interfaces).

Em Scala, as Traits são como interfaces, mas elas podem ser parcialmente implementadas, normalmente com código default. Isso resolve alguns problemas de interfaces. Em Java existem várias interfaces pra receber eventos de GUIs que contém diversos métodos (um pra cada tipo de evento, veja MouseListener por exemplo). Quando você só tá interessado em um tipo de evento (por exemplo, Mouse Pressed), você tem que implementar todos os métodos (normalmente deixando em branco). Se você tiver sorte e sua classe não estende nenhuma outra, você pode usar um dos adapters com implementações em branco (como MouseAdapter), mas não é sempre o caso. Outro caso típico é quando um dos métodos pode ser derivado dos outros, como no exemplo direto do [tour de Scala][5]: `
trait Similarity {
  def isSimilar(x: Any): Boolean
  def isNotSimilar(x: Any): Boolean = !isSimilar(x)
}
`

 [5]: http://www.scala-lang.org/node/126

Nesse caso, classes precisam somente implementar *isSimilar* pois elas já ganham de graça o *isNotSimilar*. Note que traits, como interfaces, não podem ser instanciadas, e têm que ser adicionadas a classes ou objetos.

**E agora?**

Eu dei aqui só uma mostra do que Scala tem, e na verdade não cheguei nem perto da parte que eu considero mais importante, que é a junção (bem elegante por sinal) dos paradigmas funcional e orientado a objetos. Inclusive, umas semanas atrás eu fui à uma palestra do [Simon Peyton-Jones][6], que é um dos caras por trás de Haskell. Depois da apresentação eu conversei (por ótimos 2 minutos) com ele sobre Scala e ele se disse feliz que Scala está trazendo linguagens funcionais pra desenvolvedores que estariam presos em OO (tanto por instrução – o que se aprende nas universidades em geral – quanto pelo mercado de trabalho). Eu acho que ele ainda prefere Haskell, mas Scala introduz “desenvolvedores comuns” ao paradigma funcional, sem abdicar de ser prática (não que Haskell não seja, mas o fato de se poder chamar código Java de Scala faz com que a adoção seja bem mais fácil).

 [6]: http://research.microsoft.com/en-us/people/simonpj/

O que me pergunto é se “desenvolvedores comuns” vão conseguir entender o que Scala oferece e usar de forma eficiente (isso depois que surgirem “Scala Design Patterns”). Sempre ouço que na indústria o average Joe mal entende Java direito, imagina então Scala. Estaríamos chegando em uma era em que uns poucos desenvolvedores excepcionais, usando linguagens e ferramentas ultra eficientes, seriam capazes de desenvolver “qualquer” sistema e suprir a demanda do mercado? Ou seja, o mercado encolheria em termos de número de programadores, mas os que restarem teriam uma produtividade muito superior?

Não sei. Mas sei que Scala faz barba, cabelo e bigode. E se bobear, tem algum jeito daquele pelinho no fundo da orelha ir junto!