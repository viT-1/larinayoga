function addAttrVal( o, attr_name,  val ) {
	if ( !o.hasAttribute( attr_name ) ) return;
	
	var re = new RegExp( "(^|\\s)" + val + "(\\s|$)", "g" );
	var attr_val = o.getAttribute( attr_name );
	if ( re.test( attr_val ) ) return;
	
	attr_val = ( attr_val + " " + val ).replace( /\s+/g, " " ).replace( /(^ | $)/g, "" );
	o.setAttribute( attr_name, attr_val );
}

function removeAttrVal( o, attr_name, val ) {
	if ( !o.hasAttribute( attr_name ) ) return;

	var re = new RegExp( "(^|\\s)" + val + "(\\s|$)", "g" );
	var attr_val = o.getAttribute( attr_name );
	attr_val = attr_val.replace( re, "$1" ).replace( /\s+/g, " " ).replace( /(^ | $)/g, "" );
	o.setAttribute( attr_name, attr_val );
}

function toggleAttrVal( o, attr_name, val_a, val_b ) {
	if ( !o.hasAttribute( attr_name ) ) return;
	
	var attrVal = o.getAttribute( attr_name );
	var re_a = new RegExp( "(^|\\s)" + val_a + "(\\s|$)", "g" );
	var is_a = re_a.test( attrVal );
	var re_b = new RegExp( "(^|\\s)" + val_b + "(\\s|$)", "g" );
	var is_b = re_b.test( attrVal );

	if ( is_a ) {
		removeAttrVal( o, attr_name, val_a );
		addAttrVal( o, attr_name, val_b );
	}
	else {
		if ( is_b ) {
			removeAttrVal( o, attr_name, val_b );
			addAttrVal( o, attr_name, val_a );
		}
	}

	if ( !is_a && !is_b ) {
		addAttrVal( o, attr_name, val_b );
	}
}

function addListener(element, eventName, handler) {
	if (element.addEventListener) {
		element.addEventListener(eventName, handler, false);
	}
	else if (element.attachEvent) {
		element.attachEvent('on' + eventName, handler);
	}
	else {
		element['on' + eventName] = handler;
	}
}

function removeListener(element, eventName, handler) {
	if (element.addEventListener) {
		element.removeEventListener(eventName, handler, false);
	}
	else if (element.detachEvent) {
		element.detachEvent('on' + eventName, handler);
	}
	else {
		element['on' + eventName] = null;
	}
}