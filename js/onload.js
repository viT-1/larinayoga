function initBodySettings(){
	var o_html = document.documentElement;
	
	removeAttrVal( o_html, 'class', 'no-js' );
	
	if (( 'ontouchstart' in window) || (navigator.msMaxTouchPoints > 0) || (window.DocumentTouch && document instanceof DocumentTouch)){
		addAttrVal( o_html, 'ly-touch', 'true' );
	}
	else {
		addAttrVal( o_html, 'ly-touch', 'false' );
	}
}