component accessors="true" {
	
	property name = "id";
	property name = "user_id";
	property name = "title";
	property name = "body";
	property name = "datePublished";

	this.constraints = {
		title = { required = true },
		body = { required = true },
		datePublished = { required = true, type = "date" }
	}

	function init(){
		return this;
	}

	function getUsername(){
		var query = new Query(
			datasource = "db",
			sql = "SELECT name FROM users WHERE id = #this.getuser_id()#"
		);
		return query.execute().getResult().name;
	}
}