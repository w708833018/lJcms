<?php
class ContentAction extends AdminAction{
	protected $fields,$moduleid,$moduletitle,$moduletypes;
	function _initialize(){
		parent::_initialize();
		$module_i=M("Module")->where("name='".MODULE_NAME."'")->field("id,title,lgtypes")->find();
		$this->moduleid=$module_i[id];
		$this->moduletitle=$module_i[title];
		$this->moduletypes=$module_i[lgtypes];
		$fields=F($this->moduleid."_Fields");
		foreach($fields as $key => $res){
			$res['setup']=string2array($res['setup']);
			$this->fields[$key]=$res;
		}
		unset($fields);
		unset($res);
		$this->assign("moduleid",$this->moduleid);
		$this->assign("moduletitle",$this->moduletitle);
		$this->assign("moduletypes",$this->moduletypes);
	}
	
	function add(){
		
		$id=I("id");		
		import("@.ORG.Form");
		$cmd=I("cmd","");
		if($id){
			$actions="编辑";
			$this->dao=M(MODULE_NAME);
			$data=$this->dao->where("id=$id")->find();
			$data["createtime"]=toDate($data["createtime"]);
			$form=new Form($data);
		}else{
			$actions="新增";
			$this->assign("status",1);
			$data["catid"]=I("catid");
			$data["createtime"]=Date("Y-m-d H:i:s");
			$form=new Form($data);
			$form->isadmin=1;
			
		}
		if($cmd=="copy"){
			$actions="新增";
			unset($data["id"]);
		}
		
		$this->assign($data);
		$this->assign ( 'form', $form );
		//获取字段
		
		$this->assign("Fields",$this->fields);
		$this->assign("categorys",F("category_".$this->lang));
		$template =  file_exists(ADMIN_THEME_PATH.MODULE_NAME.'/edit.tpl') ? MODULE_NAME.':edit' : 'Content:edit';
		$this->assign("actions",$actions);
		$this->display($template);
	}
	
	function insert(){
		$id=I("post.id");
		$this->dao=D(MODULE_NAME);
		$validate = array(
    					array('title','require','标题必须填写！',0,1),
    									
    				);
    	$auto	=	array(
    			array('createtime','strtotime',3,'function'),
		    	array('updatetime','time',3,'function'),
				array('reg_ip','get_number_ip',1,'function'),
    			);
    	
    	
    	
    	$this->dao->setProperty("_validate",$validate);
    	$this->dao->setProperty("_auto",$auto);
    	$data=$this->dao->create();
    	if($data){
    		if($id){
    			//unset($data["createtime"]);
    			$this->dao->where("id=$id")->save($data);
    		}else{
    			$data["lang"]=$this->lang;
    			$id=$this->dao->add($data);
    			$data["id"]=$id;
    		}
    		
    		//更新url
    		
    		//
    		$Categorys=F("Category_".$this->lang);
    		$cat=$Categorys[$data["catid"]];
    		$url=geturl($cat,$data);
    		$this->dao->where("id=$id")->setField("url",$url);
    		$this->success("保存成功！",U("index"));
    	}else{
    		$this->success("保存失败！");
    	}
    	
    	
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
					$value=I("value");
					$mtstatus=empty($value)?1:0;
					$id=I("post.ids");
					$listorder=I("post.listorder");
					for($i=0;$i<count($id);$i++){
						$data["status"]=$mtstatus;
						$data["id"]=$id[$i];
						$this->dao->save($data);
					}
					
				
				
				break;
				
			case "del":
				$this->dao=M(MODULE_NAME);
				$id=I("post.id");
				if(is_array($id)){
					for($i=0;$i<count($id);$i++){
						$this->dao->where("id=".$id[$i])->delete();
					}
				}else{
					$this->dao->where("id=".$id)->delete();
				}
				break;
		}
		
		$order=I("order","id");
		$listrows=I("listrows",C("PAGE_ROWS"));
		
		$map["lang"]=$this->lang;
		
		$count = $this->dao->where ( $map )->count();
		
		import ( "@.ORG.Page" );
		
		$page = new Page ( $count, $listrows );
		
		$list = $this->dao->where($map)->order( "`" . $order . "` desc")->limit($page->firstRow . ',' . $page->listRows)->select();
		
		$show = $page->show ();
		
		$this->assign ( 'list', $list );
		$this->assign ( 'pages', $show );
		
		$this->assign("categorys",F("category_".$this->lang));
		
		import("@.ORG.Form");
		$form=new Form();
		$this->assign("form",$form);
		$template =  file_exists(ADMIN_THEME_PATH.MODULE_NAME.'/index.tpl') ? MODULE_NAME.':index' : 'Content:index';
		$this->display($template);
	}
	
}
?>