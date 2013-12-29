<?php
/**网站管理员基础权限
 * 
 */
class AdminAction extends BaseAction{
	public $lang,$langdata;
	public $hometemplate;
	public function _initialize(){
		
		//判断是否登录
		if(MODULE_NAME!='Login'){
			if(empty($_SESSION[C("USER_AUTH_KEY")])){
				$this->error("您的登录已经失效，请重新登录！",U("Login/index"));
			}
		}
		
		
		$cl=I("l",cookie("langname"));
		if(!$cl){
			$cl=C("default_lang");
		}
		$this->langdata=F("lang");
		if($cl){
			cookie("langname",$cl,3600*24*30);
			$this->langname=$cl;
			$this->lang=$this->langdata[$cl]["id"];
		}
		
		$this->assign(F("Config_".$this->lang));
		$this->assign(F("sys.config"));
		$this->assign("langdata",$this->langdata);
		$this->assign("lang",$this->langdata[$cl]['name']);
		$this->assign("langname",$this->langname);
		$this->assign("langid",$this->lang);
		$this->hometemplate=$this->langdata[$this->langname]["template"];
	}
	
	public function sort(){
				$this->dao=M(MODULE_NAME);
				$id=I("post.id");
				$listorder=I("post.listorder");
				for($i=0;$i<count($id);$i++){
					$data["listorder"]=$listorder[$i];
					$data["id"]=$id[$i];
					$this->dao->save($data);
				}
		$this->success("排序完成");
	}
	
	
	public function deleteinfo(){
				$this->dao=M(MODULE_NAME);
				$id=I("post.id");
				if(is_array($id)){
					for($i=0;$i<count($id);$i++){
						$this->dao->where("id=".$id[$i])->delete();
					}
				}else{
					$this->dao->where("id=".$id)->delete();
				}
				
				$info["status"]=1;
				$this->ajaxReturn($info,"JSON");
	}

	/*本系统新增功能*/
	
	function saveproduct(){
		$datas=$_POST;
		$catid=I("catid",0);
		$sid=I("sid",0);
		
		$pid=I("pid",0);
		$title=$datas["title"];
		$scyear=$datas["scyear"];
		$xinghao=$datas["xinghao"];
		$oems=$datas["oems"];
		$image=$datas["image"];
		$id=$datas["id"];
		for($i=0;$i<count($title);$i++){
			$data["title"]=$title[$i];
			$data["scyear"]=$scyear[$i];
			$data["xinghao"]=$xinghao[$i];
			$data["oems"]=$oems[$i];
			$data["image"]=$image[$i];
			$data["catid"]=$catid;
			$data["sid"]=$sid;
			$data["pid"]=$pid;
			if($title[$i]!=''){
				if($id[$i]>0){
					M("product")->where("id=".$id[$i])->save($data);
				}else{
					M("product")->add($data);
				}
			}
		}
		$this->error("保存完毕",U('Product/add','catid='.$catid."&sid=".$sid));
	}

	//生成静态页面
	
	//创建栏目静态页面
	
	public function create_my_list($id,$p=1,$count=0){
		if(!$id){return false;};
		//获取该id栏目参数
		$catdata=M("Category")->where("id=$id")->find();
		if(!$catdata){return false;};
		
		$langdata=F("lang");
		$mylang=$catdata[langmark];
		$filename=$catdata["url"];
		L(include LANG_PATH.$mylang.'/common.php');
		$T = F('config_'.$mylang,'', $this->hometemplate);
		$this->assign('T',$T);
		$this->assign ( 'form',new Form());

		$this->assign($this->Config);
		$this->assign('Categorys',$this->categorys);
		$this->assign('Module',$this->module);
		$this->assign('Type',$this->Type);
		
		switch(strtolower($catdata["module"])){
			case "page":
				$template="Page_".$catdata["template_show"];
				break;
			case "guestbook":
				return false;
				break;
			default:
				$template=ucwords($catdata["module"])."_".$catdata["template_list"];
				break;
		}
		
		$filename=str_replace(C("HTML_EXT"),"",$filename);
		
		return $this->buildHtml(C("HTML_ROOT").$filename,"./",$this->hometemplate.$template.C("TMPL_TEMPLATE_SUFFIX"));
		
	}
	
	public function create_my_index($sitemap){
			$mylang=$this->langname;
			L(include LANG_PATH.$mylang.'/common.php');
		
			$T = F('config_'.$mylang,'', $this->hometemplate);
			
			$this->assign('T',$T);
			foreach((array)$this->module as $r){
				if($r['issearch'])$search_module[$r['name']] = L($r['name']);
			}
			$this->assign('search_module',$search_module);
	 
		
			$this->assign ( 'form',new Form());
			$this->assign('Module',$this->module);
			$this->assign('Type',$this->Type);
			$this->assign($this->Config);
			$this->assign('Categorys',$this->categorys);
 		
 			 		
		if(empty($sitemap)){
			$this->assign('ishome','home');
			$this->assign('bcid',0);
			$r=$this->buildHtml(C("HTML_ROOT").$mylang.'/index','./',$this->hometemplate.'Index_index'.C("TMPL_TEMPLATE_SUFFIX"));
		}else{
			$this->assign('sitemap','1');
			$r=$this->buildHtml(C("HTML_ROOT").$mylang.'/sitemap','./',$this->hometemplate.'Sitemap'.C("TMPL_TEMPLATE_SUFFIX"));
		}
		if($r) return true;
	}
	/*
	 * 内页
	 * 
	 */
	public function create_my_show($id,$module){
		if(!$id){return false;};
		$mydata=M($module)->where("id=$id")->find();
		$catid=$mydata[catid];
		if(!$catid){return false;};
		//获取该id栏目参数
		$catdata=M("Category")->where("id=$catid")->find();
		if(!$catdata){return false;};
		
		$langdata=F("lang");
		$mylang=$catdata[langmark];
		$filename=$mydata["url"];
		L(include LANG_PATH.$mylang.'/common.php');
		$T = F('config_'.$mylang,'', $this->hometemplate);
		$this->assign('T',$T);
		$this->assign ( 'form',new Form());

		$this->assign($this->Config);
		$this->assign('Categorys',$this->categorys);
		$this->assign('Module',$this->module);
		$this->assign('Type',$this->Type);
		$this->assign('module_name',$module);
		
		$seo_title = $mydata['title'].'-'.$catdata['catname'];
		$this->assign ('seo_title',$seo_title);
		$this->assign ('seo_keywords',$mydata['keywords']);
		$this->assign ('seo_description',$mydata['description']);
		
		$this->assign($mydata);
		$template=ucwords($catdata["module"])."_".$catdata["template_show"];
		
		$filename=str_replace(C("HTML_EXT"),"",$filename);
		
		return $this->buildHtml(C("HTML_ROOT").$filename,"./",$this->hometemplate.$template);
	}
	
	
}
?>