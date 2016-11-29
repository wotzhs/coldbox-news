<cfparam name="form.submitted" default="0" />
<cfparam name="form.title" default="" />
<cfparam name="form.body" default="" />
<cfparam name="form.date" default="" />


<cfoutput>
<h1>Add a news!</h1>
<form action="news/add" method="post">
	<div>
		<label>Title</label>
		<input type="text" name="title">
	</div>
	<div>
		<label>Content</label>
		<textarea name="body"></textarea>
	</div>
	<div>
		<label>Date</label>
		<input type="date" name="datePublished">
	</div>
	<input type="submit" value="Add!">
	<input type="hidden" name="submitted" value="1">
</form>
</cfoutput>