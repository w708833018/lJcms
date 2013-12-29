<?php
class EmptyAction extends AdminAction{
	
	function _initialize(){
		parent::_initialize();
	}
	public function _empty(){
		R("Admin/Content/".ACTION_NAME);
	}
}
?>