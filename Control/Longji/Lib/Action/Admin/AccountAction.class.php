<?php
class AccountAction extends AdminAction{
	function _initialize(){
		parent::_initialize();	
	}
	
	public function index(){
		$map["lang"]=$this->lang;
		$list=M("Account")->where($map)->order("id desc")->select();
		$this->assign("list",$list);
		$this->display("Account:index");
	}
	
	
	public function add(){
		$this->dao=D("Account");
		$id=I("id");
		$userpass=I("post.userpass");
		$cmd=I("post.cmd");
		switch($cmd){
			case "save":
				$validate=array(
					array('username','','帐号名称已经存在！',0,'unique',1), // 在新增的时候验证name字段是否唯一
					
				);
				$auto=array(
					array('userpass','md5',3,'function'),
				);
				$this->dao->setProperty("_validate",$validate);
				if($userpass){
					$this->dao->setProperty("_auto",$auto);
				}
				$data=$this->dao->create();
				
				if(!$userpass){
					unset($data["userpass"]);
				}
				
				if(empty($data)){$this->error("创建数据失败！".$this->dao->getError());};
				if(empty($id)){
					$this->dao->add($data);
				}else{
					$this->dao->save($data);
				}
				$this->success("保存完毕！",U("index"));
				die();
				break;
		}
		
		if(!empty($id)){
			$data=$this->dao->where("id=$id")->find();
			$this->assign($data);
			$actions="编辑";
		}else{
			$actions="新增";
		}
		$this->assign("actions",$actions);
		$this->display("Account:edit");
	}
	
	
	
}
?>