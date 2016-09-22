var strIsSupportedPostfix = 'on',
strDoesntSupportedPostfix = 'off';

function initBodySettings(){
	var o_html = document.documentElement;
	
	toggleAttrVal( o_html, 'class', 'js-off', 'js-on' );
	addAttrVal( o_html, 'class', 'touch-' + isTouchSupported() );
	addAttrVal( o_html, 'class', 'animations-' + isAnimationsSupported() );
}

function isTouchSupported() {
	var supports = Boolean(
		( 'ontouchstart' in window)
		|| (navigator.msMaxTouchPoints > 0)
		|| (window.DocumentTouch && document instanceof DocumentTouch)
	);
	
	return supports ? strIsSupportedPostfix : strDoesntSupportedPostfix;
}

function isAnimationsSupported() {
	var domPrefixes = 'Webkit Moz O ms Khtml'.split(' '),
    elm = document.documentElement,
	supports = false;

	if( elm.style.animationName ) { supports = true; }    
	if( supports === false ) {
		for( var i = 0; i < domPrefixes.length; i++ ) {
			if( elm.style[ domPrefixes[i] + 'AnimationName' ] !== undefined ) {
				supports = true;
				break;
			}
		}
	}
	
	return supports ? strIsSupportedPostfix : strDoesntSupportedPostfix;
}