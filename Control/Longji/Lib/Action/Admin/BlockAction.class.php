<?php
class BlockAction extends AdminAction{
	function _initialize(){
		parent::_initialize();	
	}
	
	public function index(){
		$map["lang"]=$this->lang;
		$list=M("Block")->where($map)->order("id desc")->select();
		$this->assign("list",$list);
		$this->display("Block:index");
	}
	
	
	public function add(){
		$this->dao=D("Block");
		$id=I("id");
		$cmd=I("post.cmd");
		switch($cmd){
			case "save":
				$data=$this->dao->create();
				
				if(empty($data)){$this->error("创建数据失败！");};
				if(empty($id)){
					$data["lang"]=$this->lang;
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
		$this->display("Block:edit");
	}
	
	
	
}
?>