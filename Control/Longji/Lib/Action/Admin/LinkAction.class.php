<?php
class ContentAction extends AdminAction{
	function _initialize(){
		parent::_initialize();	
	}
	
	public function index(){
		$map["lang"]=array("EQ",$this->lang);
		$list=M("Link")->where($map)->order("id desc")->select();
		$this->assign("list",$list);
		$this->display("Link:index");
	}
	
	public function add(){
		$this->dao=D("Link");
		$id=I("id");
		$cmd=I("post.cmd");
		switch($cmd){
			case "save":
				$validate=array(
					array("name","require","链接标题必须填写！"),
					array("siteurl","require","链接地址必须填写！"),
				);
						
				
				$data=$this->dao->validate($validate)->create();
				if(empty($data)){$this->error("创建数据失败！");};
				
				$data["lang"]=$this->lang;
				
				if(empty($id)){
					$data["createtime"]=time();
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
		}else{
			$data["status"]=1;
			$data["listorder"]=0;
			$data["linktype"]=0;
			$data["logo"]="";
		}
		$this->assign($data);
		$this->display("Link:edit");
	}
	
}
?>