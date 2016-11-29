<cfoutput>
<h1>Sign in to news.com</h1>

<br>

<form action="users/validate" method="post">
	<div>
		<label>Email</label>
		<input type="text" name="email">
	</div>
	<div>
		<label>Password</label>
		<input type="password" name="password">
	</div>
	<input type="submit" value="Sign in!">
	<input type="hidden" name="submitted" value="1">
</form>
</cfoutput>