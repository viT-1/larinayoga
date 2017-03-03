function initTogglingCtl ( toggling_ctl, toggler_attr_name, hider_attr_name, c_less, c_more ) {
	//'class' is backward compatibility for IE8
	var attr_name_t = document.addEventListener ? toggler_attr_name : 'class';
	var attr_name_h = document.addEventListener ? hider_attr_name : 'class';
	var hider_ctl = toggling_ctl.parentNode.querySelectorAll( '[' + hider_attr_name + ']' )[0];
	
	addAttrVal( toggling_ctl, attr_name_t, c_less );
	addAttrVal( hider_ctl, attr_name_h, c_less );
	
	addListener(
		toggling_ctl
		, 'click'
		, function () {
			toggleAttrVal( toggling_ctl, attr_name_t, c_less, c_more );
			toggleAttrVal( hider_ctl, attr_name_h, c_less, c_more );
		} );
}

function initToggleAbility ( toggler_attr_name, hider_attr_name, c_less, c_more ) {
	var togglers = document.querySelectorAll( '[' + toggler_attr_name + ']' );
	
	for ( var i = 0, i_ln = togglers.length; i < i_ln; i++ ) {
		initTogglingCtl( togglers[i], toggler_attr_name, hider_attr_name, c_less, c_more );
	}
}