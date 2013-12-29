<?php
class ModuleAction extends AdminAction{
	
	function _initialize(){
		
	}
	
	function index(){
		$this->dao=M("Module");
		$cmd=I("cmd");
		
		switch($cmd){
			case "order":
				$id=I("post.ids");
				$listorder=I("post.listorder");
				for($i=0;$i<count($id);$i++){
					$data["listorder"]=$listorder[$i];
					$data["id"]=$id[$i];
					$this->dao->save($data);
				}
							
				break;
				
			case "status":
				$id=I("id");
				$status=I("status");
				$mtstatus=empty($status)?1:0;
				$this->dao->where("id=$id")->setfield("status","$mtstatus");
				
				break;
		}
		
		$map=array();
	    import('@.ORG.Page');// 导入分页类
	    $count      = $this->dao->where($map)->count();// 查询满足要求的总记录数 $map表示查询条件
		$Page       = new Page($count,15);// 实例化分页类 传入总记录数
		$show       = $Page->show();// 分页显示输出
		// 进行分页数据查询
		$list = $this->dao->where($map)->order('listorder asc,id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('list',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		$this->display();
	}
	
	function add(){
			$id=I("id");
			$cmd=I("cmd");
			$this->dao=D("Module");
			if(strcmp("save",$cmd)==0){
				//保存数据
				$validate = array(
    				array('name','require','模型名称必填！',0,1),
    				array('title','require','模型标题必填！','',3),
    				);
    				
    				$this->dao->setProperty("_validate",$validate);
					$data=$this->dao->create();
					if(!$data){
						$this->error($this->dao->getError());
					}
				
				if(empty($id)){
					$modulename=strtolower($data["name"]);
					$lgtypes=$data["lgtypes"];
					ini_table($modulename);
					
					switch($lgtypes){
						case "guestbook":
							$menuparent=C("menu_guestbook");
							break;
						case "content":
							$menuparent=C("menu_content");
							break;
					}
					
					
					
					$id=$this->dao->add();
					
					//新增一个链接按钮
					$menudata["parent"]=$menuparent;
					$menudata["title"]=$data["title"];
					$menudata["module"]=strtolower($data["name"]);					
					$menudata["url"]="moduleid=".$id;					
					
					$pid=M("Menu")->add($menudata);
					
					//新增新增按钮
					$menudata["parent"]=$pid;
					$menudata["title"]='添加信息';
					$menudata["module"]=strtolower($data["name"]);
					$menudata["action"]="add";					
					$menudata["url"]="moduleid=".$id;					
					
					M("Menu")->add($menudata);
					
					
				}else{
					$this->dao->where("id=".$id)->save($data);
				}
				save_cache("menu");
				save_cache("module");
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
				$this->assign("status",1);
			}
			$this->assign("actions",$actions);
			$this->display("edit");
		}
}
?>