<?php
class FieldAction extends AdminAction{
	protected $dao;
	public function _initialize(){
		parent::_initialize();
	}
	
	
	public function index(){
		$mid=I("mid");
		if(empty($mid)){
			$this->error("请选择要编辑的模型！",U("module"));
		}
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
		
		$moduleinfo=M("module")->where("id=$mid")->find();
		
		$this->assign("moduleinfo",$moduleinfo);
		$this->assign("mid",$mid);
		
		$list=M("Field")->where("moduleid=$mid")->order("listorder asc,id desc")->select();
		$this->assign("list",$list);
		$this->display();
	}
	
	public function add(){
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
		
		$this->assign("id",$id);
		
		if(empty($id)){
			$data["status"]=1;
			$data["minlength"]=0;
			$data["maxlength"]=0;
			
		}else{
			$data=M("field")->where("id=$id")->find();
			$mid=$data["moduleid"];
		}
		$this->assign($data);
		$this->assign("mid",$mid);
		$this->display("edit");
	}
	
	public function fieldajax(){
		$fieldtypes=strtolower(I("fieldtypes"));
		$this->assign("fieldtypes",$fieldtypes);
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
		$moduleid=I("post.mid");
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
			$title=I("name");
			if(empty($name)){
				$this->error("请输入字段名！");
			}
			if(empty($title)){
				$this->error("请输入字段描述！");
			}
			
			$tablename=C('DB_PREFIX').M("Module")->where("id=$moduleid")->getField("name");
			//$db=D('');
			$db =   DB::getInstance();			
			$Fields=$db->getFields($tablename); 
			foreach ( $Fields as $key =>$r){
				if($key==$name) $ishave=1;break;
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
			$this->success ("添加成功！",U("index","mid=".$moduleid));
		} else {
			$this->error (L('add_error').': '.$model->getDbError());
		}
	}

	function fieldupdate() {
		$moduleid=I("post.mid");
		if(empty($_POST['issystem']))$editfieldsql =$this->get_tablesql($_POST,'edit');
		
		if($_POST['setup']) $_POST['setup']=array2string($_POST['setup']);
		
		$name = MODULE_NAME;
		$model = M ( $name );
		if (false === $model->create ()) {
			$this->error ( $model->getError () );
		}
		if (false !== $model->save ()) {
			save_cache(MODULE_NAME,$moduleid);
			if(empty($_POST['issystem'])){
				if(is_array($editfieldsql)){
					foreach($editfieldsql as $sql){
					$model->execute($sql);
					}
				}else{ 
					$r=$model->execute($editfieldsql); 
				}
			}
			save_field($moduleid);
			$this->success ("字段编辑成功！",U('index','mid='.$moduleid));
		} else {
			$this->success ("字段修改失败，错误原因:".': '.$model->getDbError());
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