<?php
class SlideAction extends AdminAction{
	function _initialize(){
		parent::_initialize();	
	}
	
	public function index(){
		$map=array();
		//$map["lang"]=$this->lang;
		$list=M("Slide")->where($map)->order("id desc")->select();
		$this->assign("list",$list);
		$this->display("Slide:index");
	}
	
	function _before_add(){ 
		$Tpl = template_file('Slide',$this->hometemplate,"tpl");
		$this->assign ( 'Tpl', $Tpl ); 

	 
	}
	
	
	public function add(){
		$this->dao=D("Slide");
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
		$this->display("Slide:edit");
	}
	
	public function listpic(){
		$cmd=I("cmd");
		if($cmd=="del"){
			$id=I("id");
			M("slide_data")->where("id=$id")->delete();
			$data["sql"]="id=$id";
			$this->ajaxReturn($data,"JSON");
			die();
		}
		$fid=I("fid");
		if(empty($fid)){
			$this->error("请先选择幻灯片",U("index"));
		}
		
		$this->assign("list",M("slide_data")->where("lang=".$this->lang." and fid=".$fid)->order("listorder desc,id desc")->select());
		$this->assign("fid",$fid);
		$this->display("Slide:listpic");
	}
	
	public function picadd(){
		$id=I("id");
		$this->dao=D("slide_data");
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
				
				$count=$this->dao->where("fid=".$data["fid"])->count();
				M("slide")->where("id=".$data["fid"])->setField("num",$count);
				$this->success("保存完毕！",U("listpic",'fid='.$data["fid"]));
				die();
				break;
		}
		
		if(!empty($id)){
			$data=$this->dao->where("id=$id")->find();
			$actions="编辑";
		}else{
			$actions="新增";
			$fid=I("fid");
			if(empty($fid)){
				$this->error("请先选择幻灯片",U("index"));
			}
			$data["status"]=1;
			$this->assign("fid",$fid);
		}
		$this->assign($data);
		$this->assign("actions",$actions);
		$this->display("Slide:picadd");
	}
	
	public function sort(){
		
		$this->dao=M("slide_data");
				$id=I("post.id");
				$listorder=I("post.listorder");
				for($i=0;$i<count($id);$i++){
					$data["listorder"]=$listorder[$i];
					$data["id"]=$id[$i];
					$this->dao->save($data);
				}
		$this->success("排序完成");
	}
	
}
?>