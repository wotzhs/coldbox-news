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
	property name="UsersService" inject="UsersService";


	function signup( event, rc, prc ){
		prc.message = UsersService.add(rc.name, rc.email, rc.password);
		event.setView( "users/signup" );
	}

	function new(event, rc, rpc){
		event.setView( "users/new" );
	}

	function validate(event, rc, prc){
		nextEvent = UsersService.validatePassword(rc.email, rc.password);
		setNextEvent(nextEvent);
		
	}

	function signin( event, rc, prc ){
		event.setView( "users/signin" );
	}


	
}
