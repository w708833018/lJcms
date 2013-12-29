<?php
/**
 * 类功能：
 * 	管理栏目目录，新增栏目目录
 */
class CategoryAction extends AdminAction{
	public $categorys,$dao;
	function _initialize(){
		parent::_initialize();
		$this->categorys = F('Category_'.$this->lang);
		$this->assign("categorys",$this->categorys);
		$this->dao=M("Category");
	}
	
	function index(){
		$cmd=I("cmd");
		$id=I("id");
		switch($cmd){
			case "del":
				$this->dao->where("id=$id")->delete();
				save_cache("category");
				$this->error("删除完毕！");
				break;
		}
		$this->assign("list",$this->categorys);
		$this->assign("modules",F("Module"));
		$template =  file_exists(ADMIN_THEME_PATH.MODULE_NAME.'/index.tpl') ? MODULE_NAME.':index' : 'Content:index';
		$this->display($template);
	}
	
	function add(){
		import("@.ORG.Form");
		
		$id=I("id");
		$cmd=I("cmd");
		$parentid=I("parentid");
		
		
		
		if($cmd=="save"){
			//保存数据
			$parentid=I("post.parentid",0);
			$data=$this->dao->create();
			if(!$data){$this->error("创建数据失败！");};
			$data["catdir"]=trim($data["catdir"]);
			//更新父路径
			if(!empty($parentid)){
				$parent_d=M("Category")->where("id=$parentid")->field("parentdir,catdir,arrparentid")->find();
				if($parent_d){
					$data["parentdir"]=empty($parent_d["catdir"])?"":$parent_d["parentdir"].$parent_d["catdir"]."/";
					$data["arrparentid"]=empty($parent_d["arrparentid"])?$parentid:$parent_d["arrparentid"].",".$parentid;
					
				}
				
			}
			$module_name=M("Module")->where("id=".$data["moduleid"])->getField("name");
			$data["module"]=$module_name;
			
			if(C("IS_HTML")){
					$map_c["catdir"]=array("EQ",$data["catdir"]);
					$map_c["lang"]=$this->lang;
					if(!empty($id)){
						$map_c["id"]=array("NEQ",$id);
					}
					//判断目录是否存在
					$have_e=$this->dao->where($map_c)->getField("");
					if($have_e){
						$this->error("该目录已经存在，请重命名！");
					}
				}
			
			
			if(empty($id)){
				//
				$data["lang"]=$this->lang;
				$data["langmark"]=$this->langname;
				$id=$this->dao->add($data);
				if(empty($id)){
					$this->error("添加栏目失败！".$this->dao->getError());
				}
				$data["id"]=$id;
				save_cache("category");
				//如果是page，提交到Page库
				switch(strtolower($module_name)){
					case "page":
						$datap["id"]=$id;
						$datap["catid"]=$id;
						$datap["title"]=$data["catname"];
						$datap["lang"]=$this->lang;
						$datap["createtime"]=time();
						$datap["updatetime"]=time();
						
						M("Page")->add($datap);
						
						//新增一个单页链接
							/*
							 * 
							$menudata["parent"]=C("menu_page");
							$menudata["title"]=$data["catname"];
							$menudata["module"]="Page";
							$menudata["action"]="add";
							$menudata["url"]="id=".$id;
							M("Menu")->add($menudata);
						*/
						
						break;
				}
				
				
			}else{
				//修改的时候不改语言参数
				
				
				
				$this->dao->where("id=$id")->save($data);
				$data_x=$this->dao->where("id=$id")->find();
				$data["lang"]=$data_x["lang"];
				$data["langmark"]=$data_x["langmark"];
				
				//判断子栏目是否一起修改
				$arraychild=$data_x["arrchildid"];
				$tochild=I("tochild");
				if($tochild){
					$d_c["pagesize"]=I("pagesize",0);
					$d_c["template_list"]=I("template_list",'list');
					$d_c["template_show"]=I("template_show",'show');
					$this->dao->where("id in(".$arraychild.")")->save($d_c);
				}
				//
				
			}
			$olddata=$data;
			
			//所有子目录
			$data=array();
			$data["arrchildid"]=$this->get_arrchildid($id);
			$data["url"]=geturl($olddata);
			$this->dao->where("id=$id")->save($data);
			
			switch(strtolower($module_name)){
					case "page":
						M("Page")->where("catid=$id")->setField("url",$data["url"]);
						break;
				}
			
			
			/*
			if(C("IS_HTML")){
				//生成栏目，更新栏目
				$this->create_my_list($id);
				//更新首页
			}
			*/
			save_cache("category");
			$this->refresh(false);
			$this->success("栏目保存成功！",U("index"));
			die();
		}
		
		
		
		$module=F("Module");
		
		$module_x=array();
		foreach($module as $key=>$value){
			if($value["status"]>=1){
				$value_x['id']=$value["id"];
				$value_x['name']=ucfirst($value["name"]);
				$value_x['title']=ucfirst($value["title"]);
				$module_x[$key]=$value_x;
			}
		}
		$this->assign("module_x",$module_x);
		
		if(!empty($id)){
			$data=$this->dao->where("id=$id")->find();
			$parentid=$data["parentid"];
		}else{
			$data["moduleid"]=0;
			$data["ismenu"]=1;
		}
		
		//添加子栏目
		
		if($parentid){
			$pd=$this->dao->where("id=$parentid")->find();
			$data["moduleid"]=$pd["moduleid"];
			$data["parentid"]=$parentid;	
		}
		
		
		$this->assign("vo",$data);
		
		$templates= template_file('',$this->langdata[$this->langname][template],C("TMPL_TEMPLATE_SUFFIX"));
		$this->assign ( 'templates',$templates );
		$this->assign("id",$id);
		
		
		foreach($this->categorys as $r) {
			$array[] = $r;
		}
		import ( '@.ORG.Tree' );	
		$str  = "<option value='\$id' \$selected>\$spacer \$catname</option>";
		$tree = new Tree ($array);		 
		$select_categorys = $tree->get_tree(0, $str,$parentid);
		$this->assign('select_categorys', $select_categorys);
		
		if($id){
			$actions="编辑";
			$data=M("Category")->where("id=$id")->find();
		}else{
			$actions="新增";
			$data["ismenu"]=1;
		}
		$this->assign("module",$module);
		$this->assign("actions",$actions);
		$this->assign($data);
		$template =  file_exists(ADMIN_THEME_PATH.MODULE_NAME.'/edit.tpl') ? MODULE_NAME.':edit' : 'Content:edit';
		$this->display($template);
	}
	
	public function get_arrchildid($id) {
		$arrchildid = $id;
		$this->categorys = F('category_'.$this->lang);
		
		if(is_array($this->categorys)) {
			foreach($this->categorys as $catid => $cat) {
				
				if($cat['parentid'] && $id != $catid) {
					$arrparentids = explode(',', $cat['arrparentid']);
					if(in_array($id, $arrparentids)) $arrchildid .= ','.$catid;
				}
			}
		}
		return $arrchildid;
	}
	
	public function get_deep($parentid){
		$this->categorys = F('Category_'.$this->lang);
		return $this->categorys[$parentid]["deep"]+1;
	}
	
	public function get_arrparentid($id){
		$this->categorys = F('Category_'.$this->lang);
		$parentid=$this->categorys[$id]["parentid"];
		if(empty($parentid)){
			return "0";
		}else{
			$arrparentid=$this->categorys[$parentid]["arrparentid"].",".$parentid;
			return $arrparentid;
		}
		
		
	}
	
	public function refresh($isalert=true){
		$id=I("id",0);
		if($id){
			$map["id"]=$id;
		}else{
			$map=array();
		}
		$map["lang"]=$this->lang;
		$data=M("Category")->where($map)->order("id asc")->select();
		foreach($data as $key=>$value){
			$data_x["arrchildid"]=$this->get_arrchildid($value[id]);
			$data_x["url"]=geturl($value);
			$data_x["deep"]=$this->get_deep($value["parentid"]);
			$data_x["arrparentid"]=$this->get_arrparentid($value[id]);
			
			M("Category")->where("id=".$value["id"])->save($data_x);
		}
		save_cache("category");
		if($isalert){
			$this->success("更新完毕！",U("index"));
		}
		
		
	}
	
	public function sort(){
		R("Admin/sort");
		save_cache("category");
	}
}
?>