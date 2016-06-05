function initBodySettings(){
	var o_body = document.body || document.getElementById( 'top' )[ 0 ];
	addClass( o_body, 'js-enabled' );
	
	if (( 'ontouchstart' in window) || (navigator.msMaxTouchPoints > 0) || (window.DocumentTouch && document instanceof DocumentTouch)){
		addClass( o_body, 'js-touch_enabled' );
	}
	else {
		addClass( o_body, 'js-touch_disabled' );
	}
}