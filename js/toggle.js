function addTogglingCtl ( state_elem, onclick_elem_query, attr_name, c_less, c_more ) {
	var toggling_toggler = state_elem.querySelector( onclick_elem_query );
	
	addAttrVal( toggling_toggler, 'ly-more_less__toggler', '' );
	
	addListener(
		toggling_toggler
		, 'click'
		, function () {
			toggleAttrVal ( state_elem, attr_name, c_less, c_more );
		} );
}

function initToggleAbility ( state_elem_query, onclick_elem_query, attr_name, c_less, c_more ) {
	var toggling_elems = document.querySelectorAll( state_elem_query );
	var toggling_ctl;
	var attr;
	
	for ( var i = 0, i_ln = toggling_elems.length; i < i_ln; i++ ) {
		toggling_ctl = toggling_elems[i];
		addAttrVal( toggling_ctl, attr_name, c_less );
		addTogglingCtl( toggling_ctl, onclick_elem_query, attr_name, c_less, c_more );
	}
}