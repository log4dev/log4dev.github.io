---
layout: page
title: 
tagline:  
---
{% include JB/setup %}


{% for post in site.posts limit:10 %}

## [{{ post.title }}]({{ BASE_PATH }}{{ post.url }})

{% assign author = site.authors[post["author"]]["name"] %}
<p><strong>Por {{author}} em {{ post.date | date: "%d/%m/%Y" }}</strong></p> 

<div class="content">
      {{ post.content }}
</div>

<br>

<div  style="display:inline-table; margin-top: 10px;">
    <div style="float:left; margin-right: 10px;"> <strong>Gostou do artigo? Compartilhe!</strong></div>

    <div id="tweet" style="float:left;">
        <a href="https://twitter.com/share" class="twitter-share-button" data-lang="pt" data-text="{{page_title}}" data-url="{{site.production_url}}{{page.url}}">Tweetar</a>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
        </script>
    </div>

    <div id="share" style="float:left; margin-right: 20px;">
        <div class="fb-like" data-href="{{site.production_url}}{{page.url}}" data-layout="button_count" data-width="450" data-show-faces="true">
        </div>            
    </div>

    <div style="float:left;">
        <bold><a href="{{BASE_PATH}}{{ post.url }}#disqus_thread" {% if post.wordpress_id %}data-disqus-identifier="{{post.wordpress_id}} {{site.production_url}}/?p={{post.wordpress_id}}"{% endif %}>Comentários</a></bold>
    </div>
</div>

<br>
<br>

--------
{% endfor %}

<center	>
<a href="/archive.html">Ver textos anteriores</a>
</center>

<script type="text/javascript">
/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
var disqus_shortname = 'log4dev'; // required: replace example with your forum shortname

/* * * DON'T EDIT BELOW THIS LINE * * */
(function () {
var s = document.createElement('script'); s.async = true;
s.type = 'text/javascript';
s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
(document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
}());
</script>
