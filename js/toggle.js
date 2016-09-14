function addTogglingCtl ( dl, attr_name, c_less, c_more ) {
	var toggling_ctl = dl.getElementsByTagName( 'dd' )[0].firstChild;

	while (toggling_ctl.nodeType == 3 && toggling_ctl.nextSibling) { // skip TextNodes
		toggling_ctl = toggling_ctl.nextSibling;
	}

	var evt_handler = function () {
		toggleAttrVal ( dl, attr_name, c_less, c_more );
	}
	
	addListener( toggling_ctl, 'click', evt_handler );
}

function initToggleAbility ( o, attr_name, c_ctl, c_less, c_more ) {
	var toggling_elems = o.getElementsByTagName( 'dl' );
	var toggling_ctl;

	for ( var i = 0, i_ln = toggling_elems.length; i < i_ln; i++ ) {
		toggling_ctl = toggling_elems[i];

		if ( toggling_ctl.className.indexOf( c_ctl ) > -1 ) {
			addAttrVal( toggling_ctl, attr_name, c_less );
			addTogglingCtl( toggling_ctl, attr_name, c_less, c_more );
		}
	}
}