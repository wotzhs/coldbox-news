component accessors="true" singleton{
	function init(){
		return this;
	}

	query function getListing(offset){
		query = new Query(
			datasource = "db",
			sql = "SELECT id, user_id, title, datePublished, createdDateTime FROM news ORDER BY -createdDateTime LIMIT :offset, 5"
		);
		query.addParam(name:"offset", value: offset, cfsqltype="cf_sql_int");
		return query.execute().getResult();
	}

	query function getComments(Number news_id) {
		query = new Query(
			datasource = "db",
			sql = "SELECT comment FROM comments, WHERE id= :id"
		);
		query.addParam(name: "id", value: news_id, cfsqltype:"cf_sql_int");
		return query.execute().getResult();
	}

	string function addNews(Number user_id, String title, String body, Date datePublished) {
		try {
			query = new Query(
				datasource = "db",
				sql = "INSERT INTO news (user_id, title, body, datePublished) VALUES (:userid, :title, :body, :datePublished)"
			);
			query.addParam(name: "userid", value: user_id, cfsqltype: "cf_sql_int");
			query.addParam(name: "title", value: title, cfsqltype: "cf_sql_varchar");
			query.addParam(name: "body", value: body, cfsqltype: "cf_sql_varchar");
			query.addParam(name: "datePublished", value: datePublished, cfsqltype: "cf_sql_date");
			result = query.execute().getPrefix();
			return "news/show?id="&result.generatedkey;
		}
		catch (database exception) {
			return;
		}
	}

	function deleteNews(Number news_id) {
		try {
			query = new Query(
				datasource = "db",
				sql = "UPDATE news SET deleted = 1 WHERE id = :id"	
			);
			query.addParam(name: "id", value: news_id, cfsqltype: "cf_sql_int");
			return query.execute().getResult();	
		}
		catch (database exception){
			return;
		}
	}

	query function getNewsDetails(Number news_id) {
		try {
			query = new Query(
				datasource = "db",
				sql = "SELECT id, user_id, title, body, datePublished FROM news WHERE id = :id"
			);
			query.addParam(name: "id", value: news_id, cfsqltype: "cf_sql_int");
			return query.execute().getResult();
		}
		catch (database exception){
			return;
		}
	}

	function updateNews(Number news_id, String title, String body, Date datePublished) {
		try {	
			query = new Query(
				datasource = "db",
				sql = "UPDATE news SET title = :title, body = :body, datePublished = :datePublished  WHERE id = :id"
			);
			query.addParam(name: "title", value: title, cfsqltype: "cf_sql_varchar");
			query.addParam(name: "body", value: body, cfsqltype: "cf_sql_varchar");
			query.addParam(name: "datePublished", value: datePublished, cfsqltype: "cf_sql_date");
			query.addParam(name: "id", value: news_id, cfsqltype: "cf_sql_int");
			return query.execute().getPrefix();
			
		}
		catch (datebase exception) {
			return;
		}
	}
}