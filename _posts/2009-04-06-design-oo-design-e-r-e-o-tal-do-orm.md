---
title: Design OO, Design E-R, e o tal do ORM.
author: Raphael Lullis
layout: post
permalink: /2009/04/06/design-oo-design-e-r-e-o-tal-do-orm/
dsq_thread_id:
  - 64842333
categories:
  - Design
  - Teoria
tags:
  - Análise OO
  - Django
  - ER
  - ORM
---
# 

Vira e mexe aparece algum problema que pode ser um exercício interessante, um [Kata para programador][1] que eu gostaria de colocar aqui para ser analisado, discutido e implementado pelo pessoal que visita o blog. Além disso, tem algum tempo também que eu quero escrever sobre os conflitos entre o design Orientado a Objeto e o desenvolvimento de aplicações usando banco de dados relacionais, e sobre como as ferramentas que fazem ORM tentam, mas não conseguem resolver esse conflito de uma forma definitiva.

 [1]: http://log4dev.com/2007/09/04/kata-para-programadores/

Como não estou com tempo para fazer tudo isso, vou fazer um mix e ver o que acontece. Resumidamente, vou explicar um pequeno problema que eu tenho envolvendo a implementação de um sistema usando o ORM do Django, e gostaria de saber se alguém vê uma solução correta e elegante. 

Usando exemplos reais: estou trabalhando em um projeto que visa analisar registros médicos eletrônicos e identificar se certos casos registrados devem ser notificados ao CDC. Mais especificamente, o que eu quero é analisar o registro de vacinas que a pessoa recebeu e verificar se houve alguma reação adversa. Uma reação adversa pode ser identificada por algo comum como febre, ou algo mais complexo como uma hemorragia ou por um exame de laboratório mostrando uma variação em valores de seus componentes (Hemoglobina, Creatina, Sódio, Potássio, etc). 

“Falando” OO, o que eu tenho é a classe AdverseEvent, da qual derivam FeverEvent, DiagnosticsEvent e LabResultEvent. Na hora de construir os relatórios, é necessário obter a lista dos eventos e obter também os atributos específicos de cada subclasse. Até aí OO funciona. E antes que the-one-who-can’t-be-named grite “Design Patterns”, eu vou falar que estamos lidando com a implementação de uma Factory: dada uma lista de chaves que identifique uma lista de AdverseEvents, a Factory instancia o objeto adequado a partir da id fornecida.

O “problema”: esses objetos ficam em um banco de dados, e como mapear isso para um banco de dados relacional e fazer uma factory que construa o objeto adequado com uma única consulta?

Vamos ao código. A primeira solução seria uma implementação que tenta ser puramente OO. O código abaixo é parte de um típico módulo de definição dos seus modelos quando usando Django.

 

    class AdverseEventManager(models.Manager):
    
        def by_id(self, key):
            for klass in [FeverEvent, DiagnosticsEvent, LabResultEvent]
                try:
                    obj = klass.objects.get(id=key)
                    return obj
                except: pass
            return None
    
    class AdverseEvent(models.Model):
        # Managers
        objects = models.ModelManager()
        manager = AdverseEventManager()
    
        # Atributos que realmente são de interesse e vão para o BD.
        patient = models.ForeignKey(Demog)
        immunization = models.ForeignKey(Immunization)
        matching_rule_explain = models.CharField(max_length=200)
        category = models.CharField(max_length=20, choices=ADVERSE_EVENT_CATEGORIES)
        created_on = models.DateTimeField(auto_now_add=True)
        last_updated = models.DateTimeField(auto_now=True)
    
    
    
    # Classes filhas. NO BD, são mapeadas para tabelas que contém os campos 
    # específicos da classe, e referencia a tabela da classe-pai
    class FeverEvent(AdverseEvent):
        temperature = models.FloatField('Temperature')
        encounter = models.ForeignKey(Enc)
    
    class DiagnosticsEvent(AdverseEvent):
        encounter = models.ForeignKey(Enc)
        icd9 = models.ForeignKey(Icd9)
    
    
    class LabResultEvent(AdverseEvent):
        lab_result = models.ForeignKey(Lx)
    

 

 

O Factory method é by_id. Para os que não conhecem Django, ModelManager.get() faz a consulta no banco de dados e retorna um único objeto da classe que o contém, ou a exceção DoesNotExist se não existir objetos com os parâmetros indicados. Como a chave pertence a classe-pai, podemos ter certeza que não há haverá objetos das classes filhos com o mesmo id. Isso permite que encontremos o objeto desejado. O problema com essa solução é que o número de consultas é proporcional ao número de sub-classes

O segundo esquema é “menos OO”. Para desespero de alguns puristas, nós podemos criar um dicionário no módulo que mapeia as sub classes possíveis e a factory faz sempre duas consultas para obter o objeto apropriado. 
 

    ADVERSE_EVENT_CLASSES = {'fever':FeverEvent,
                             'diagnostics':DiagnosticsEvent,
                             'lab_result': LabResultEvent
                             }
    
    class AdverseEventManager(models.Manager):  
        def by_id(self, key):
            try:
               ev = AdverseEvent.objects.get(id=key)
               return ADVERSE_EVENT_CLASSES[ev.event_type].objects.get(id=key)
            except:
                return None
    
    class AdverseEvent(models.Model):
        # Managers
        objects = models.ModelManager()
        manager = AdverseEventManager()
    
        # Atributos que realmente são de interesse e vão para o BD.
        patient = models.ForeignKey(Demog)
        immunization = models.ForeignKey(Immunization)
        matching_rule_explain = models.CharField(max_length=200)
        category = models.CharField(max_length=20, choices=ADVERSE_EVENT_CATEGORIES)
        created_on = models.DateTimeField(auto_now_add=True)
        last_updated = models.DateTimeField(auto_now=True)
    
        # Adicionamos esse campo para identificar para saber qual é a subclasse 
        event_type = models.CharField(max_length=20, choices=tuple(ADVERSE_EVENT_CLASSES.items()))
    

 

 

Enfim, só estou expondo as duas soluções que eu conheço para lidar com algo trivial. Se alguém tiver alguma idéia diferente, por favor deixe registrado nos comentários.

Com relação a crítica ao ORM: parte da minha bronca são essas incongruências que existem, o ORM não conseguindo fazer uma boa ponte entre o modelo OO e o modelo E-R. É por detalhes assim que estamos começando a ver uma série de projetos de banco de dados não-relacionais, do qual espero falar mais adiante.

Outra coisa interessante: se você perceber, um banco de dados XML não teria esse problema, entretanto parece que ninguém nunca pensou em implementar o [BDB-XML][2] como backend para uma datastore.

 [2]: http://www.oracle.com/database/berkeley-db/xml/index.html