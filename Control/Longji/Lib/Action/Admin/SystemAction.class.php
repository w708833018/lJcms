<?php
class SystemAction extends AdminAction{
	protected $dao;
	public function _initialize(){
		parent::_initialize();
	}
	
	
	public function config(){
		
		$cmd=I("cmd");
		
		switch($cmd){
			case "save":
				$this->dao=M("Config");
				$data_i=I("post.");
				foreach($data_i as $key=>$value){
					$this->dao->where("lang=".$this->lang." and name='".$key."'")->setField("value",$value);
				}
				
				save_cache("config");
				$this->success("数据保存完毕！",U("config"));
				die();
				break;
		}
		
		import("@.ORG.Form");
		$form=new Form();
		
		$this->display("Config:index");
	}
	
	public function oconfig(){
		
		$cmd=I("cmd");
		
		switch($cmd){
			case "save":
				$this->dao=M("Config");
				$data_i=I("post.");
				foreach($data_i as $key=>$value){
					$this->dao->where("name='".$key."'")->setField("value",$value);
				}
				
				save_cache("sys.config");
				$this->success("数据保存完毕！",U("oconfig"));
				die();
				break;
		}
		
		import("@.ORG.Form");
		$form=new Form();
		
		$this->display("Config:other");
	}
	
	function configadd(){
		$id=I("id");
		$cmd=I("cmd");
		//保存数据
		$this->dao=D("Config");
		if(strcmp("save",$cmd)==0){
			//保存数据
			$data=$this->dao->create();
			
			if(empty($id)){
				$this->dao->add();
			}else{
				$this->dao->where("id=".$id)->save($data);
			}
			$this->success("数据保存完毕！",U("config"));
			die();			
		}
		
		if(!empty($id)){
			$data=$this->dao->where("id=$id")->find();
			$this->assign($data);
		}
		
		$this->display("Config:add");
	}
	
	  public function main(){
    	
    	//数据统计
    	
    	//
    	
    	$this->display("System:main");
    }
    
    public function editpass(){
    	$cmd=I("post.cmd");
    	if(strcmp($cmd,"save")==0){
			
			$oldpass=$_POST["oldpass"];
			$newpass=$_POST["newpass"];
			
			//判断旧密码
			$oldpass_c=M("Admin")->where("id=".$_SESSION[C("USER_AUTH_KEY")])->getField("userpass");
			if(strcmp($oldpass_c,md5($oldpass))==0){
				M("Admin")->where("id=".$_SESSION[C("USER_AUTH_KEY")])->setField("userpass",md5($newpass));
				$this->success("密码修改完毕，下次请用新密码登陆！",U("main"));
				die();
			}else{
				$this->error("旧密码有误！");
			}
		}
    	$this->display();
    }
    
	
}