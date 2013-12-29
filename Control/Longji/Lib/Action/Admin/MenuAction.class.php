<?php
class MenuAction extends AdminAction{
	
	function _initialize(){
		
	}
	
	function index(){
		$cmd=I("cmd");
		
		switch($cmd){
			case "order":
				$M=M("Menu");
				$id=I("post.id");
				$listorder=I("post.listorder");
				for($i=0;$i<count($id);$i++){
					$data["listorder"]=$listorder[$i];
					$data["id"]=$id[$i];
					$M->save($data);
				}
				save_cache("menu");
				break;
				
			case "status":
				$id=I("id");
				$status=I("status");
				$mtstatus=empty($status)?1:0;
				M("Menu")->where("id=$id")->setfield("status","$mtstatus");
				save_cache("menu");
				break;
		}
		$list=F("Menu");
		$this->assign("list",$list);
		$this->display();
	}
	
	function add(){
			$id=I("id");
			$cmd=I("cmd");
			$parent=I("pid");
			$this->dao=D("Menu");
			if(strcmp("save",$cmd)==0){
				//保存数据
				$data=$this->dao->create();
				
				if(empty($id)){
					$this->dao->add();
				}else{
					$this->dao->where("id=".$id)->save($data);
				}
				save_cache("menu");
				$this->success("数据保存完毕！",U("index"));
				die();			
			}
			if($id){
				$actions="编辑";
				$this->dao=M(MODULE_NAME);
				$data=$this->dao->where("id=$id")->find();
				$this->assign($data);
			}else{
				$actions="新增";
				$action="index";
				$this->assign("action",$action);
				$this->assign("parent",$parent);
				$this->assign("status",1);
			}
			$this->assign("list",F("Menu"));
			$this->assign("actions",$actions);
			$this->display("edit");
		}
}
?>