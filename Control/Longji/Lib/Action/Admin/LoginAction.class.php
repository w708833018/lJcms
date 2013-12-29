<?php
class LoginAction extends AdminAction{
	function _initialize(){
		parent::_initialize();	
	}
	
	function index(){
		if(empty($_SESSION[C("USER_AUTH_KEY")])){
			$this->display();
		}else{
			$this->redirect(U('Index/index'));
		}
		
	}
	
	function dologin(){
		$data=I("post.");
		
		$username=$data["username"];
		$userpass=$data["userpass"];
		
		//检测授权
		$Info=M("Account")->where("username='$username'")->find();
		if($Info){
			if($Info["status"]<=0){$this->error("该账号已被禁用！");};
			if(strcmp($Info["userpass"],md5($userpass))!=0){$this->error("用户密码有误！");};
			$_SESSION[C("USER_AUTH_KEY")]=$Info["id"];
			
			cookie("lastlogin",$Info["lastlogin"]);
			cookie("lastip",$Info["lastip"]);
			cookie("username",$username);
			//更改信息1
			M("Account")->where("id=".$Info["id"])->setInc("logintimes",1);
			
			$data_s["lastlogin"]=time();
			$data_s["lastip"]=get_client_ip(1);
			M("Account")->where("id=".$Info["id"])->save($data_s);
			$this->success("欢迎您回来, $username!",U("Index/index"));
		}else{
			$this->error("该账户不存在!");
		}
	}
	
	function out(){
		unset($_SESSION[C("USER_AUTH_KEY")]);
		cookie("lastlogin",NULL);
		cookie("lastip",NULL);
		cookie("username",NULL);
		$this->error("您已经成功退出登录！",U("Login/index"));
	}
}
?>