<cfparam name="form.submitted" default="0" />
<cfparam name="form.title" default="" />
<cfparam name="form.body" default="" />
<cfparam name="form.date" default="" />

<cfoutput>
<h1>Edit this news!</h1>
<form action="news/update?id=#prc.newsDetails.getid()#" method="post">
	<div>
		<label>Title</label>
		<input type="text" name="title" value="#prc.newsDetails.gettitle()#">
	</div>
	<div>
		<label>Content</label>
		<textarea name="body">#prc.newsDetails.getbody()#</textarea>
	</div>
	<div>
		<label>Date</label>
		<input type="date" name="datePublished" value="#dateFormat(prc.newsDetails.getdatePublished(), 'yyyy-mm-dd')#">
	</div>
	<input type="submit" value="Save!">
	<input type="hidden" name="submitted" value="1">
</form>
</cfoutput>