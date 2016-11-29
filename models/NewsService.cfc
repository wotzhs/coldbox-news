component accessors="true"{
	
	property name = "dao"       inject = "NewsDAO";
	property name = "populator" inject = "wirebox:populator";
	property name = "wirebox"   inject = "wirebox";

	function init(){
		return this;
	}

	function list(boolean asQuery=false, offset=0){
		var query = dao.getListing(offset);
		if (asQuery) { return query; }
		var result = []
		for(var i = 1; i <= query.recordCount; i++){
			arrayAppend(result, populator.populateFromQuery( wirebox.getInstance("News"), query, i));
		}		
		return result;
	}

	function show(news_id = 0){
		var query = dao.getNewsDetails(news_id);
		if (news_id == 0 || query.recordCount == 0){
			return wirebox.getInstance("News");
		}
		return populator.populateFromQuery( wirebox.getInstance("News"), query, 1);
	}

	function edit(news_id = 0){
		var query = dao.getNewsDetails(news_id);
		if (news_id == 0 || query.recordCount == 0){
			return wirebox.getInstance("News");
		}
		return populator.populateFromQuery( wirebox.getInstance("News"), query, 1);
	}

	function update(news_id = 0, title, body, datePublished){
		var query = dao.updateNews(news_id, title, body, datePublished);
		if (news_id == 0 || query.recordCount == 0){
			return 0;
		}
		return 1;
	}

	function delete(news_id = 0){
		var query = dato.deleteNews(news_id);
		if (news_id == 0 || query.recordCount == 0){
			return 0;
		}
		return 1;
	} 
}