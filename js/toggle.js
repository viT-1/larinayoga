function addTogglingCtl ( dl, c_less, c_more ) {
	var toggling_ctl = dl.getElementsByTagName( 'dd' )[0].firstChild;

	while (toggling_ctl.nodeType == 3 && toggling_ctl.nextSibling) { // skip TextNodes
		toggling_ctl = toggling_ctl.nextSibling;
	}

	toggling_ctl.onclick = function () {
		toggleAttrVal ( dl, 'class', c_less, c_more );
	}
}

function initToggleAbility ( o, c_ctl, c_less, c_more ) {
	var toggling_elems = o.getElementsByTagName( 'dl' );
	var elem;
	var toggling_ctl

	for ( var i = 0, i_ln = toggling_elems.length; i < i_ln; i++ ) {
		elem = toggling_elems[i];

		if ( elem.getAttribute( 'class' ).indexOf( c_ctl ) > -1 ) {
			addAttrVal( elem, 'class', c_less );
			addTogglingCtl( elem, c_less, c_more );
		}
	}
}