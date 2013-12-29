<?php
class ToolAction extends AdminAction{
	protected $dao;
	public function _initialize(){
		parent::_initialize();
	}
	
	public function add(){
		$module=I("module");
		$template =  file_exists(ADMIN_THEME_PATH.MODULE_NAME.'/edit.html') ? MODULE_NAME.':edit' : 'Content:edit';
		$this->display($template);
	}
	
	public function install(){
		
		$cmd=I("cmd");
		if($cmd=='save'){
			$bd=I("post.bd");
			F("longji",$bd,RUNTIME_PATH);
			$this->success("配置完成！",U("install"));
			die();
		}
		
		$this->assign("is_html",C("IS_HTML"));
		$this->assign("is_wap",C("IS_WAP"));
		$this->assign("is_tj",C("IS_TJ"));
		$this->assign("menu_page",C("MENU_PAGE"));
		$this->assign("menu_content",C("MENU_CONTENT"));
		$this->assign("menu_guestbook",C("MENU_GUESTBOOK"));
		$this->assign("show_product",C("SHOW_PRODUCT"));
		$this->assign("show_article",C("SHOW_ARTICLE"));
		$this->assign("show_down",C("SHOW_DOWN"));
		$this->assign("html_root",C("HTML_ROOT"));
		$this->assign("html_ext",C("HTML_EXT"));
		$this->assign("default_lang",C("default_lang"));
		$this->assign("back_path",C("back_path"));
		$this->assign("page_listrows",C("PAGE_LISTROWS"));
		$this->assign("page_rows",C("PAGE_ROWS"));
		
		
		
		if(!(C("SAFE_CODE"))){
			$this->assign("safe_code",rand_str(25));
		}else{
			$this->assign("safe_code",C("SAFE_CODE"));
		}
		
		
		$this->display("Tool:install");
	}
	
	public function config(){
		$this->dao=M("Config");
		$cmd=I("cmd");
		
		switch($cmd){
			case "save":
				$data_i=$this->dao->create();
				
				$id_i=$data_i["id"];
				$listorder_i=$data_i["listorder"];
				$title_i=$data_i["title"];
				
				for($i=0;$i<count($id_i);$i++){
					$data["id"]=$id_i[$i];
					$data["listorder"]=$listorder_i[$i];
					$data["title"]=$title_i[$i];
					$this->dao->where("id=".$data["id"])->save($data);
				}
				
				
				$this->success("数据保存完毕！",U("menu"));
				die();
				break;
			case "del":
			
				break;
		}
		
		$this->assign('list',$this->dao->order("id desc")->select());// 赋值数据集
		
		
		$this->display("Config:index");
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
	
	public function menu(){
		$this->dao=M("Menu");
		$cmd=I("cmd");
		//保存排序
		switch($cmd){
			case "save":
				$data_i=$this->dao->create();
				
				$id_i=$data_i["id"];
				$listorder_i=$data_i["listorder"];
				$title_i=$data_i["title"];
				
				for($i=0;$i<count($id_i);$i++){
					$data["id"]=$id_i[$i];
					$data["listorder"]=$listorder_i[$i];
					$data["title"]=$title_i[$i];
					$this->dao->where("id=".$data["id"])->save($data);
				}
				
				
				$this->success("数据保存完毕！",U("menu"));
				die();
				break;
			case "del":
			
				break;
		}
		
		
		$list_data = $this->dao->order('listorder asc,id desc')->where("parent=0")->select();
		$list_data_i=array();
		foreach($list_data as $key=>$value){
			$list_data_i[$key]=$value;
			$list_data_it=$this->dao->order('listorder asc,id desc')->where("parent=".$value["id"])->select();
			$list_data_i[$key]["child"]=$list_data_it;
			foreach($list_data_it as $key1=>$value1){
				$list_data_i[$key]["child"][$key1]=$value1;
				$list_data_i[$key]["child"][$key1]['child']=$this->dao->order('listorder asc,id desc')->where("parent=".$value1["id"])->select();
			}
		}
		
		
		$this->assign('list',$list_data_i);// 赋值数据集
		
		$this->display("");	
	}
	
	public function menuadd(){
		$id=I("id");
		$cmd=I("cmd");
		$pt=I("pt",0);
		//保存数据
		$this->dao=D("Menu");
		if(strcmp("save",$cmd)==0){
			//保存数据
			$data=$this->dao->create();
			
			if(empty($id)){
				$this->dao->add();
			}else{
				$this->dao->where("id=".$id)->save($data);
			}
			$this->success("数据保存完毕！",U("menu"));
			die();			
		}
		
		$this->assign("menudata",F("Menu_1"));
		
		if(!empty($id)){
			$data=$this->dao->where("id=$id")->find();
		}else{
			$data["parent"]=$pt;
			$data["listorder"]=0;
		}
		
		
		$this->assign($data);
		$this->display("Menu:add");
	}
	
	public function language(){
		
		$list=M("Lang")->order("id")->select();
		$this->assign("list",$list);
		
		$this->display("Language:index");
	}
	
	public function languageadd(){
		$id=I("id");
		$cmd=I("cmd");
		$this->dao=D("lang");
		switch($cmd){
			case "save":
				$data=$this->dao->create();
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
				$this->success("保存成功！",U("language"));
				die();
				break;
			
		}
		
		if(empty($id)){
			$data["id"]=0;
			$data["name"]="";
			$data["flag"]="";
			$data["status"]=1;
		}else{
			$data=M("lang")->where("id=$id")->find();
		}
		$this->assign($data);
		$this->display("Language:add");
	}
	
	public function module(){
		$this->dao=M("Module");
		
		$map=array();
	    import('@.ORG.Page');// 导入分页类
	    $count      = $this->dao->where($map)->count();// 查询满足要求的总记录数 $map表示查询条件
		$Page       = new Page($count,15);// 实例化分页类 传入总记录数
		$show       = $Page->show();// 分页显示输出
		// 进行分页数据查询
		$list = $this->dao->where($map)->order('listorder asc,id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('list',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
				
		$this->display("Module:index");
	}
	
	public function modulefield(){
		$mid=I("mid");
		if(empty($mid)){
			$this->error("请选择要编辑的模型！",U("module"));
		}
		
		$moduleinfo=M("module")->where("id=$mid")->find();
		
		$this->assign("moduleinfo",$moduleinfo);
		$this->assign("mid",$mid);
		
		$list=M("Field")->where("moduleid=$mid")->order("listorder asc,id desc")->select();
		$this->assign("list",$list);
		$this->display("Module:field");
	}
	
	public function modulefieldadd(){
		$id=I("id",0);
		$mid=I("mid");
		
		if(empty($mid) && empty($id)){
			$this->error("请选择要编辑的模型！",U("module"));
		}
		
		$field_pattern = array( 
			'0'=> "请选择类型",
			'email' => "电子邮件地址",
			'url' => "网址",
			'date' => "日期",
			'number'=> "有效的数值",
			'digits'=>  "数字",
			'creditcard'=> "信用卡号码",
			'equalTo'=> "再次输入相同的值.",
			'ip4'=>  "IP地址",
			'mobile'=> "手机号码",
			'zipcode'=> "邮编",
			'qq'=> "QQ号码",
			'idcard'=> "身份证号",
			'chinese'=> "中文字符",
			'cn_username'=>"中文英文和数字和下划线",
			'tel'=>"电话号码",
			'english'=> "英文",
			'en_num'=> "英文和数字和下划线",
		);
		
		import('@.ORG.Form');
		
		$this->assign("field_pattern",$field_pattern);
		$moduleinfo=M("module")->where("id=$mid")->find();
		
		$this->assign("moduleinfo",$moduleinfo);
		$this->assign("mid",$mid);
		$this->assign("id",$id);
		
		if(empty($id)){
			$data["status"]=1;
			$data["minlength"]=0;
			$data["maxlength"]=0;
			
		}else{
			$data=M("field")->where("id=$id")->find();
		}
		$this->assign($data);
		$this->display("Module:fieldadd");
	}
	
	public function fieldajax(){
		$fieldtype=I("fieldtype");
		$this->assign("fieldtype",$fieldtype);
		$fieldid=I("fieldid");
		if($fieldid){
			$setup=M("field")->where("id=$fieldid")->getField("setup");
		}
		$this->assign(string2array($setup));
		$this->display("Ajax:ajaxfield");
	}
	
	function modulefieldrefresh(){
		$mid=I("mid");
		save_field($mid);
		$this->success("刷新数据完成！");
	}
	
	function fieldinsert() {
		$moduleid=I("post.moduleid");
		if($_GET['isajax']){//检测字段是否已经存在
			$name=$_GET['field'];
			
			$tablename=C('DB_PREFIX').M("Module")->where("id=$moduleid")->getField("name");
			//$db=D('');
			$db =   DB::getInstance();			
			$Fields=$db->getFields($tablename); 
			foreach ( $Fields as $key =>$r){
				if($key==$name) $ishave=1;
			}
			if($ishave) { echo 'false';}else{echo 'true';}
			exit;
		}
		
		//判断是否已经有了
			$name=I('field');
			
			$tablename=C('DB_PREFIX').M("Module")->where("id=$moduleid")->getField("name");
			//$db=D('');
			$db =   DB::getInstance();			
			$Fields=$db->getFields($tablename); 
			foreach ( $Fields as $key =>$r){
				if($key==$name) $ishave=1;
			}
		if($ishave){
			$this->error("该字段已经存在！");
		}
		
		$addfieldsql =$this->get_tablesql($_POST,'add');
		if($_POST['setup']) $_POST['setup']=array2string($_POST['setup']);
		$_POST['unpostgroup'] = $_POST['unpostgroup'] ?  implode(',',$_POST['unpostgroup']) : '';
		$_POST['status'] =1;
		$name = "Field";
		$model = M ($name);
		if (false === $model->create ()) {
			$this->error ( $model->getError () );
		} 
		if ($model->add() !==false) {
			//savecache(MODULE_NAME,$_POST['moduleid']);

			if(is_array($addfieldsql)){
				foreach($addfieldsql as $sql){
				$model->execute($sql);
				}
			}else{
				if($addfieldsql)$model->execute($addfieldsql);
			}
			save_field($moduleid);
			$this->success ("添加成功！",U("modulefield","mid=".$moduleid));
		} else {
			$this->error (L('add_error').': '.$model->getDbError());
		}
	}

	function fieldupdate() {
		if(empty($_POST['issystem']))$editfieldsql =$this->get_tablesql($_POST,'edit');
		if($_POST['setup']) $_POST['setup']=array2string($_POST['setup']);
		
		$name = MODULE_NAME;
		$model = M ( $name );
		if (false === $model->create ()) {
			$this->error ( $model->getError () );
		}
		if (false !== $model->save ()) {
			savecache(MODULE_NAME,$_POST['moduleid']);
			if(empty($_POST['issystem'])){
				if(is_array($editfieldsql)){
					foreach($editfieldsql as $sql){
					$model->execute($sql);
					}
				}else{ 
					$r=$model->execute($editfieldsql); 
				}
			}
			$this->success (L('edit_ok'));
		} else {
			$this->success (L('edit_error').': '.$model->getDbError());
		}
	}
	
	public function get_tablesql($info,$do){

		$fieldtype = $info['type'];
		if($info['setup']['fieldtype']){
			$fieldtype=$info['setup']['fieldtype'];
		}
		$moduleid = $info['moduleid'];
		$default=$info['setup']['default'];
		$field = $info['field'];
		$tablename=C('DB_PREFIX').strtolower(M("Module")->where("id=$moduleid")->getField("name"));
		$maxlength = intval($info['maxlength']);
		$minlength = intval($info['minlength']);
		$numbertype = $info['setup']['numbertype'];
		$oldfield = $info['oldfield'];
		if($do=='add'){ $do = ' ADD ';}else{$do =  " CHANGE `$oldfield` ";}

 
		switch($fieldtype) {
			case 'varchar':
				if(!$maxlength) $maxlength = 255;
				$maxlength = min($maxlength, 255);
				$sql = "ALTER TABLE `$tablename` $do `$field` VARCHAR( $maxlength ) NOT NULL DEFAULT '$default'";
			break;

			case 'title':
				if(!$maxlength) $maxlength = 255;
				$maxlength = min($maxlength, 255);
				$sql[] = "ALTER TABLE `$tablename` $do `title` VARCHAR( $maxlength ) NOT NULL DEFAULT '$default'";
				$sql[] = "ALTER TABLE `$tablename` $do `title_style` VARCHAR( 40 ) NOT NULL DEFAULT ''";
				$sql[] = "ALTER TABLE `$tablename` $do `thumb` VARCHAR( 100 ) NOT NULL DEFAULT ''";
			break;

			case 'catid':
				$sql = "ALTER TABLE `$tablename` $do `$field` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0'";
			break;

			case 'number':
				$decimaldigits = $info['setup']['decimaldigits'];
				$default = $decimaldigits == 0 ? intval($default) : floatval($default);
				$sql = "ALTER TABLE `$tablename` $do `$field` ".($decimaldigits == 0 ? 'INT' : 'decimal( 10,'.$decimaldigits.' )')." ".($numbertype ==1 ? 'UNSIGNED' : '')."  NOT NULL DEFAULT '$default'";
			break;

			case 'tinyint':
				if(!$maxlength) $maxlength = 3;
				$maxlength = min($maxlength,3);
				$default = intval($default);
				$sql = "ALTER TABLE `$tablename` $do `$field` TINYINT( $maxlength ) ".($numbertype ==1 ? 'UNSIGNED' : '')." NOT NULL DEFAULT '$default'";
			break;


			case 'smallint':
				$default = intval($default);
				if(!$maxlength) $maxlength = 8;
				$maxlength = min($maxlength,8);
				$sql = "ALTER TABLE `$tablename` $do `$field` SMALLINT( $maxlength ) ".($numbertype ==1 ? 'UNSIGNED' : '')." NOT NULL DEFAULT '$default'";
			break;

			case 'int':
				$default = intval($default);
				$sql = "ALTER TABLE `$tablename` $do `$field` INT ".($numbertype ==1 ? 'UNSIGNED' : '')." NOT NULL DEFAULT '$default'";
			break;

			case 'mediumint':
				$default = intval($default);
				$sql = "ALTER TABLE `$tablename` $do `$field` INT ".($numbertype ==1 ? 'UNSIGNED' : '')." NOT NULL DEFAULT '$default'";
			break;

			case 'mediumtext':
				$sql = "ALTER TABLE `$tablename` $do `$field` MEDIUMTEXT NOT NULL";
			break;

			case 'attr':
				$sql = "ALTER TABLE `$tablename` $do `$field` MEDIUMTEXT NOT NULL";
			break;
			
			
			case 'text':
				$sql = "ALTER TABLE `$tablename` $do `$field` TEXT NOT NULL";
			break;

			case 'posid':
				$sql = "ALTER TABLE `$tablename` $do `$field` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0'";
			break;

			//case 'typeid':
				//$sql = "ALTER TABLE `$tablename` $do `$field` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0'";
			//break;			

			case 'datetime':
				$sql = "ALTER TABLE `$tablename` $do `$field` INT(11) UNSIGNED NOT NULL DEFAULT '0'";
			break;
			
			case 'editor':
				$sql = "ALTER TABLE `$tablename` $do `$field` TEXT NOT NULL";
			break;
			
			case 'image':
				$sql = "ALTER TABLE `$tablename` $do `$field` VARCHAR( 80 ) NOT NULL DEFAULT ''";
			break;

			case 'images':
				$sql = "ALTER TABLE `$tablename` $do `$field` MEDIUMTEXT NOT NULL";
			break;

			case 'file':
				$sql = "ALTER TABLE `$tablename` $do `$field` VARCHAR( 80 ) NOT NULL DEFAULT ''";
			break;

			case 'files':
				$sql = "ALTER TABLE `$tablename` $do `$field` MEDIUMTEXT NOT NULL";
			break;
		}
		return $sql;
	}
	
	public function moduleadd(){
		$this->dao=M("Module");
		$id=I("id");
		$cmd=I("cmd");
		if(strcmp($cmd,"save")==0){
			//保存
			$data=$this->dao->create();
			if(empty($id)){
				$modulename=$data["name"];
				
				ini_table($modulename);
				
				//判断是否新增模型成功！
				
				$this->dao->add($data);
				
				$this->success("模型新增成功！",U("module"));
				die();
			}else{
				$this->dao->save($data);
				$this->success("模型修改成功！",U("module"));
				die();
			}
		}
		
		if(!empty($id)){
			$data=M("Module")->where("id=$id")->find();
		}else{
			$data["status"]=1;
			$data["infield"]="*";
			$data["lgtypes"]="content";
		}
		
		$this->assign($data);
		$this->assign("id",$id);
		$this->display("Module:add");
	}
	
}