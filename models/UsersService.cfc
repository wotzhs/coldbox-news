component singleton accessors="true"{
	
	property name="Bcrypt" inject="BCrypt@BCrypt";
	
	UsersService function init(){
		
		return this;
	}
	
	function add(String name, String email, String password){
		var hashedPassword = Bcrypt.hashPassword(password);
		try{
			query = new Query();
			query.setDatasource("db");
			query.setSQL("INSERT INTO users (name, email, password, createdDateTime, updatedDateTime) VALUES (:name, :email, :password, now(), now())");
			query.addParam(name: "name", value: name, cfsqltype: "cf_sql_varchar" );
			query.addParam(name: "email", value: email, cfsqltype: "cf_sql_varchar" );
			query.addParam(name: "password", value: hashedPassword, cfsqltype: "cf_sql_varchar" );
			query.execute();
			return "Account Signup successful, you can now click the link below to sign in!"
		}
		catch(database exception){
			return "You have previously registered with us, please click the link below to sign in!"
		}		
	}

	function validatePassword(String email, String password){
		query = new Query();
		query.setDatasource("db");
		query.setSQL("SELECT id, name, email, password FROM users WHERE email= :email");
		query.addParam(name: "email", value: email, cfsqltype="cf_sql_varchar");
		execute = query.execute();
		result = execute.getResult();

		if (Bcrypt.checkPassword(password, result.password)){
			session.email = result.email;
			session.name = result.name;
			session.user_id = result.id;
			return "news.index";
		}
		return event.setView( "users/signin")
	}

}