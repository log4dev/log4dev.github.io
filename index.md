---
layout: page
title: 
tagline:  
---
{% include JB/setup %}

{% for post in site.posts limit:10 %}
## [{{ post.title }}]({{ BASE_PATH }}{{ post.url }})

{% assign author = site.authors[post.author].name %}
<p><strong>{{ post.date | date_to_string }}</strong></p> 

--------
{% endfor %}

<center	>
<a href="/archive.html">Ver textos anteriores</a>
</center>

