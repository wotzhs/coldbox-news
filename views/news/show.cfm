<cfoutput>
<h1>news.show</h1>
<h2><a href="news/edit?id=#prc.newsDetails.getid()#">Edit this post</a></h2>
<h1>#prc.newsDetails.gettitle()#</h1>
<p>#prc.newsDetails.getbody()#</p>

<p>Published on: <span>#dateFormat(prc.newsDetails.getdatePublished(), 'dd/mm/yyyy')#</span></p>
<p>By #prc.newsDetails.getUsername()#</p>
</cfoutput>