<?php
// 本类由系统自动生成，仅供测试用途
class IndexAction extends AdminAction {
    
    public function _initialize(){
    	parent::_initialize();
    }
    public function index(){
    	
    	$myinfo=M("Account")->where("id=".$_SESSION[C("USER_AUTH_KEY")])->field("group")->find();
    	$mygroupid=$myinfo["group"];
    	$this->assign("mygroupid",$mygroupid);
    	$langlist=F("lang");
    	$langmark=$langlist[$this->lang][name];
    	$this->assign("langmark",$langmark);
    	$this->assign("Menu_list",F("Menu"));
		$this->display("Index:index");
    }
    
  
    public function clear(){
    	save_cache("module");
    	save_cache("menu");
    	save_cache("lang");
    	save_cache("category");
    	save_cache("config");
    	save_cache("sys.config");
    	$this->success("缓存清理完毕！",U("System/main"));
    }
    
    public function test(){
    	if(sendmail("lgz.py@qq.com","testss","我试试")){
    		echo "ok!";
    	}else{
    		echo "sendfalse!";
    	}
    	//R("Home/Build/test");    	
    }
}