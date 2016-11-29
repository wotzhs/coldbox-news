component{
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};
	
	/**
	IMPLICIT FUNCTIONS: Uncomment to use
	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

	property name="newsService" inject="NewsService";
		
	function index( event, rc, prc ){
		prc.listing = newsService.list();
		event.setView( "news/index" );
	}

	function load( event, rc, prc ){
		prc.listing = newsService.list(false, rc.offset);
		event.setView( view = "news/newsTemplate", noLayout=true);
	}

	function new( event, rc, prc ){
		event.setView("news/new");
	}

	function add( event, rc, prc ){
		var add = newsService.addNews(session.user_id, rc.title, rc.body, rc.datePublished);
		if (add == 404){
			return prc.message = "Something is wrong, please try again";
		}
		prc.message = "News successfully added, please check the following link";
		prc.link = add;
	}

	function edit( event, rc, prc ){
		prc.newsDetails = newsService.edit(rc.id);
		event.setView( "news/edit" );
	}

	function show( event, rc, prc ){
		prc.newsDetails = newsService.show(rc.id);
		event.setView( "news/show");
	}

	function update( event, rc, prc ){
		prc.update = newsService.update(rc.id, rc.title, rc.body, rc.datePublished)
		if (prc.update == 0){
			prc.message = "Something went wrong, please try again";
			prc.link = "news/edit?id="&rc.id;
			event.setView( "news/update" );
			return
		}
		prc.message = "Update successful, please click the link below to see the updated post"
		prc.link = "news/show?id="&rc.id;
		event.setView( "news/update" );
	}

	function delete( event, rc, prc ){
		prc.delete = newsService.delete(rc.id)
		if (prc.delete == 0){
			prc.message = "Something went wrong, please try again";
			prc.link = "news/edit?id="&rc.id;
			event.setView( "news/delete" );
			return
		}
		prc.message = "Delete successful, please click the link below to go back to news listing"
		prc.link = "news/show?id="&rc.id;
		event.setView( "news/delete" );
	}
}
