<?php
/**
 * 
 * IndexAction.class.php (前台首页)
 *

 */

class IndexAction extends HomeAction
{
	function _initialize(){
		parent::_initialize();
	}
    public function index()
    {
		$this->assign('bcid',0);//顶级栏目 
		$this->assign('ishome','home');
		$content=M("page")->where("id=9")->field("content")->find();

		$this->assign("content",$content['content']);
		$template=$this->hometemplate."Index_index".C('TMPL_TEMPLATE_SUFFIX');
        $this->display($template);
    }
 
}
?>