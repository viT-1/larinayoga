function addClass( o, c ) {
	var re = new RegExp("(^|\\s)" + c + "(\\s|$)", "g")
	if (re.test(o.className)) return
	o.className = (o.className + " " + c).replace(/\s+/g, " ").replace(/(^ | $)/g, "")
}

function removeClass( o, c ) {
	var re = new RegExp("(^|\\s)" + c + "(\\s|$)", "g")
	o.className = o.className.replace(re, "$1").replace(/\s+/g, " ").replace(/(^ | $)/g, "")
}

function toggleClass( o, c_toggle_a, c_toggle_b ) {
	var re_a = new RegExp("(^|\\s)" + c_toggle_a + "(\\s|$)", "g");
	var is_a = re_a.test(o.className);
	var re_b = new RegExp("(^|\\s)" + c_toggle_b + "(\\s|$)", "g");
	var is_b = re_b.test(o.className);

	if ( is_a ) {
		removeClass( o, c_toggle_a );
		addClass( o, c_toggle_b );
	}
	else {
		if ( is_b ) {
			removeClass( o, c_toggle_b );
			addClass( o, c_toggle_a );
		}
	}

	if ( !is_a && !is_b ) {
		addClass( o, c_toggle_a );
	}
}