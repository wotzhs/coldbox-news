<cfparam name="form.submitted" default="0" />
<cfparam name="form.name" default="" />
<cfparam name="form.email" default="" />
<cfparam name="form.password" default="" />
<cfparam name="form.confirmPassword" default="" />

<cfif form.submitted>
</cfif>

<cfoutput>
<h1>Account Registration</h1>

<br>

<form action="users/signup" method="post">
	<div>
		<label>Name</label>
		<input type="text" name="name">
	</div>
	<div>
		<label>Email</label>
		<input type="text" name="email">
	</div>
	<div>
		<label>Password</label>
		<input type="text" name="password">
	</div>
	<div>
		<label>Confirm Password</label>
		<input type="text" name="confirmPassword">
	</div>
	<input type="submit" value="Register!">
	<input type="hidden" name="submitted" value="1">
</form>
</cfoutput>