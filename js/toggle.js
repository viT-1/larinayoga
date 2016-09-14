function addTogglingCtl ( dl, attr_name, c_less, c_more ) {
	var toggling_ctl = dl.querySelector( 'dd > *:first-child' );

	while (toggling_ctl.nodeType == 3 && toggling_ctl.nextSibling) { // skip TextNodes
		toggling_ctl = toggling_ctl.nextSibling;
	}

	var evt_handler = function () {
		toggleAttrVal ( dl, attr_name, c_less, c_more );
	}
	
	addListener( toggling_ctl, 'click', evt_handler );
}

function initToggleAbility ( o, attr_name, c_ctl, c_less, c_more ) {
	var toggling_elems = document.querySelectorAll( 'dl.' + c_ctl );
	var toggling_ctl;
	var attr;
	
	for ( var i = 0, i_ln = toggling_elems.length; i < i_ln; i++ ) {
		toggling_ctl = toggling_elems[i];
		
		if ( !toggling_ctl.hasAttribute( attr_name ) ) {
			attr = document.createAttribute( attr_name );
			attr.value = ''
			toggling_ctl.setAttributeNode( attr );
		}
	
		addAttrVal( toggling_ctl, attr_name, c_less );
		addTogglingCtl( toggling_ctl, attr_name, c_less, c_more );
	}
}