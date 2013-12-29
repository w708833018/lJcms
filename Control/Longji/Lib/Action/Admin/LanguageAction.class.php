<?php
class LanguageAction extends AdminAction{
	
	function _initialize(){
		parent::_initialize();
		
		
	}
	
	function add(){
		$id=I("id");
		$cmd=I("cmd");
		$this->dao=D("Lang");
		switch($cmd){
			case "save":
			
				$validate = array(
				    array('name','require','请输入语言名称!'),
				    array('mark','','该语言标示已经存在!',0,'unique',1)				    
				);
				
				$this->dao->setProperty("_validate",$validate);
				$data=$this->dao->create();
				if(!$data){$this->error($this->dao->getError());};
				if(empty($id)){
					$id=$this->dao->add();
					$lang_path =LANG_PATH.I("post.mark").'/';
					$r =dir_copy(LANG_PATH.'cn/',$lang_path); 
					if($id){
						$db=D('');
						$db =   DB::getInstance();
						$db->execute("INSERT INTO `".C("DB_PREFIX")."config`  (`name`,`title`,`value`,`lang`) VALUES ('site_name','网站名称','龙吉网络企业建站系统',$id),
						('site_url','网站网址','',$id),
						('logo','网站LOGO','./Public/Images/logo.gif',$id),
						('site_email','站点邮箱','jishu@jnlongji.com',$id),
						('seo_title','网站标题','企业建站,济南建站,上海建站,高端建站,网站建设',$id),
						('seo_keywords','关键词','网站建设',$id),
						('seo_description','网站简介','济南最佳网站建设',$id);");
					}
					
				}else{
					$this->dao->where("id=$id")->save($data);
				}
				save_cache("lang");
				
				
				$this->success("保存成功！",U("index"));
				die();
				break;
			
		}
		
		if($id){
			$actions="编辑";
			$data=$this->dao->where("id=$id")->find();
		}else{
			$actions="新增";
			$data["status"]=1;
		}
		$this->assign($data);
		$this->assign("actions",$actions);
		//列出模板路径
		$this->assign("templatedir",getsubdir(TEMPLATE_PATH,true));
		
		$this->display("Language:edit");
	}
	
	
	function index(){
		
		$this->dao=M(MODULE_NAME);
		
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
		
		$list=M("Lang")->order("id")->select();
		$this->assign("list",$list);
		$template =  file_exists(ADMIN_THEME_PATH.MODULE_NAME.'/index.tpl') ? MODULE_NAME.':index' : 'Content:index';
		$this->display($template);
	}
	
	
	function lang(){
		
		$lang=I("lang");
		
		if(I("cmd")=="save"){
			$name=I("post.name");
			$value=I("post.value");
			for($i=0;$i<count($name);$i++){
				if($name[$i] && $value[$i]){
					$data[$name[$i]]=$value[$i];
				}
			}
			F("common",$data,APP_PATH."Lang/".$lang."/");
			$this->success("语言包配置完成！");
			die();
		}
		
		$k=-1;
		$list=F("common",'',APP_PATH."Lang/".$lang."/");
		unset($data);
		foreach($list as $key=>$value){
				$k++;
				$data[$k]=array("name"=>$key,"value"=>$value);
		}
		$this->assign("lang",$lang);
		$this->assign("list",$data);
		$this->display();
	}
	
	function template(){
		
		$lang=I("lang");
		
		if(I("cmd")=="save"){
			$name=I("post.name");
			$value=I("post.value");
			for($i=0;$i<count($name);$i++){
				if($name[$i] && $value[$i]){
					$data[$name[$i]]=$value[$i];
				}
			}
			F("config_".$lang,$data,$this->hometemplate);
			$this->success("语言包配置完成！");
			die();
		}
		
		$k=-1;
		$list=F("config_".$lang,'',$this->hometemplate);
		unset($data);
		foreach($list as $key=>$value){
				$k++;
				$data[$k]=array("name"=>$key,"value"=>$value);
		}
		$this->assign("lang",$lang);
		$this->assign("list",$data);
		$this->display();
	}
}
?>