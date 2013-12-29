<?php
class DatabaseAction extends AdminAction{
	
    protected $db = '', $datadir = '' , $startrow=0,$startfrom=0, $complete=true;
    function _initialize()
    {
		parent::_initialize();
		$this->datadir = RUNTIME_PATH.C("BACK_PATH")."/";
		if(!is_dir($this->datadir))mkdir($this->datadir,0755,true);
		$db=D('');
		$this->db =   DB::getInstance();
    }

    public function index()
    {
        $dataList = $this->db->query("SHOW TABLE STATUS LIKE '".C('DB_PREFIX')."%'");
        
        
        foreach ($dataList as $row){
            $total += $row['Data_length'];
        }
        $this->assign('totalSize', $total);
        $this->assign("dataList", $dataList);
        $this->display();
    }

    public function excuteQuery($sql='')
    {
        if(empty($sql)) {$this->error(L('do_empty'));}
        $queryType = 'INSERT|UPDATE|DELETE|REPLACE|CREATE|DROP|LOAD DATA|SELECT .* INTO|COPY|ALTER|GRANT|TRUNCATE|REVOKE|LOCK|UNLOCK';
        if (preg_match('/^\s*"?(' . $queryType . ')\s+/i', $sql)) {
            $data['result'] = $this->db->execute($sql);
            $data['type'] = 'execute';
        }else {
				
            $data['result'] = $this->db->query($sql);
            $data['type'] = 'query';
		
        }
        return $data;
    }

    public function query(){
        $this->display();
    }

    public function doquery(){
		$sqls=explode("\n",stripcslashes(I("post.sql")));
		
		
		
		foreach ((array)$sqls as $sql){
			if($sql)$r =$this->excuteQuery($this->spsql($sql)); 
		}
		
		if($r['result']!=''){
			$this->success("操作完成");	
		}else{
			if($r['dberror']) $this->error($r['dberror']);
			$this->error("执行完毕！");	 
		}
    }
    
    public function spsql($sql){
    	return str_replace("{pre}",C("DB_PREFIX"),$sql);
    }
	public function recover(){
		if($_GET['do']=='delete'){

			foreach ((array)$_POST['files'] as $r){
				unlink($r);
			}
			$this->error("删除完成！",U("recover"));
			die();
			
		}elseif($_GET['do']=='import'){
			header('Content-Type: text/html; charset=UTF-8');
			//$filename = $_GET['files'];
			$filename = $_GET['filename'];
			$filelist = dir_list($this->datadir);
			//提取同一备份文件
			foreach ((array)$filelist as $r){
				$file = explode('-',basename($r));
				
				if($file[0] ==$filename){
					$files[]  = $r;
				}
			}
			foreach((array)$files as $file){
				//读取数据文件
				$sqldata = file_get_contents($file);
				$sqlFormat = sql_split($sqldata, C('DB_PREFIX'));
				foreach ((array)$sqlFormat as $sql){
						$sql = trim($sql);
						if (strstr($sql, 'CREATE TABLE')){
							preg_match('/CREATE TABLE `([^ ]*)`/', $sql, $matches);
							$ret =$this->excuteQuery($sql);
						}else{
							$ret = $this->excuteQuery($sql);
						}
				}
				echo "恢复数据完成:".basename($file).'<br>';
			}

		}else{
			$filelist = dir_list($this->datadir);
			foreach ((array)$filelist as $r){
				$filename = explode('-',basename($r));
				$files[] = array('path'=> $r,'file'=>basename($r),'name' => $filename[0], 'size' => filesize($r), 'time' => filemtime($r));
			}
			$this->assign('files',$files);
			$this->display();
		}
	}

	public function docommand()
    {
        $tables = I('tables');
        $do= I("get.do");
		if(empty($do) || empty($tables)) $this->error("您尚未选择表！",U("index"));
		if($do=='show'){
			 foreach ((array)$tables as $t){
				$this->db->execute("SHOW COLUMNS FROM {$t}");
			}
		}else{
			$tables = implode(',',$tables);
			$r=$this->db->execute($do.' TABLE '.$tables);
			if(false != $r){ $this->error("操作完成！",U("index"));}else{ $this->error($r['dbError']);}
		}
    }

	public function backup(){
		$tableid = intval(I('tableid'));
		$this->startfrom = intval(I('startfrom'));
		$sizelimit = intval(I('sizelimit',"2048"));
		$volume = intval($_GET['volume']) + 1;

		$dataList = $this->db->query("SHOW TABLE STATUS LIKE '".C('DB_PREFIX')."%'");
		foreach ($dataList as $row){
				$table_info[$row['Name']]=$row;
		}		
		$tables = S('backuptables');
		if(empty( $_POST['tables']) && empty($tables)) {	
			foreach ($dataList as $row){
				$tables[]= $row['Name'];
			}
		}else{
			$tables = array();
			if(!$tableid) {
				$tables=I('tables');
				S('backuptables',$tables);
			} else {
				$tables = S('backuptables');
			}
			if( !is_array($tables) || empty($tables)) {
				$this->error("请先选择一个要备份的表！");	
			}
		}
		unset($dataList);
		$sql='';
		if(!$tableid) {
				$sql .= "-- System SQL Backup\n-- Time:".toDate(time())."\n-- \n\n";
				foreach($tables as $key=>$table) {
					$sql .= "--\n-- GuozhiEBuild Table `$table`\n-- \n";
					$sql .= "DROP TABLE IF EXISTS `$table`;\n";
					$info = $this->db->query("SHOW CREATE TABLE  $table");					
					$sql .= str_replace(array('USING BTREE','ROW_FORMAT=DYNAMIC'),'',$info[0]['Create Table']).";\n";
				}
		}

		for(; $this->complete && $tableid < count($tables) && strlen($sql) + 500 < $sizelimit * 1000; $tableid++) {
			if($table_info[$tables[$tableid]]['Rows']>0){
				$sql .=  $this->dumptablesql($tables[$tableid], $this->startfrom, strlen($sql),$table_info[$tables[$tableid]]['Auto_increment']);
				if($this->complete) {
					$this->startfrom = 0;
				}
				
			}
		}
		!$this->complete && $tableid--;
		$filename = htmlspecialchars(strip_tags($_GET['filename']));
		$filename = !$filename ? 'gz_'.rand_str(10).'_'.date('YmdH') : $filename;
		$filename_valume = sprintf($filename."-%s".'.sql', $volume);
 
		if(trim($sql)){
			$putfile=$this->datadir . $filename_valume;
			$r= file_put_contents($putfile , trim($sql));
		}
	 

		if($tableid < count($tables) || $r){

			$this->assign ( 'waitSecond', 0);
			$urlarray=array(
						'tableid'   => $tableid,
						'startfrom' => $this->startfrom,
						'sizelimit' => $sizelimit,
						'volume'	=> $volume,
						'filename'  => $filename,
					);
			$message = "正在备份数据库：卷宗[$filename_valume]创建成功!";
			$forward = U("Database/backup",$urlarray);
			$this->assign ( 'jumpUrl', $forward);
			$this->success($message);
		 
		}else{ 
			S('backuptables',null);
			$this->success("备份完成！", U('recover'));	
		}
		
	}

	public function dumptablesql($table, $startfrom = 0, $currsize = 0,$auto_increment=0) {
		$offset = 300;
		$insertsql = '';
		$sizelimit = intval($_REQUEST['sizelimit']);
		
		$modelname=str_replace(C('DB_PREFIX'),'',$table);
		$model = M($modelname);
		$keyfield=$model->getPk ();
		$rows = $offset;
		while($currsize + strlen($insertsql) + 500 < $sizelimit * 1000 && $rows == $offset) {
				if($auto_increment) {
					$selectsql = "SELECT * FROM $table WHERE $keyfield > $startfrom ORDER BY $keyfield LIMIT $offset";
				} else {
					$selectsql = "SELECT * FROM $table LIMIT $startfrom, $offset";
				}
				$tabledumped = 1;
				$row = $this->db->query($selectsql);
				$rows = count($row);
				foreach($row as $key=>$val) {
					foreach ($val as $k=>$field){
						if(is_string($field)) {
							$val[$k] = '\''. $this->db->escapeString($field).'\'';
						}elseif(empty($field)){
							$val[$k] = 'NULL';
						}
					}
					if($currsize + strlen($insertsql) + 500 < $sizelimit * 1000) {
						if($auto_increment) {
							$startfrom = $row[$key][$keyfield];
						} else {
							$startfrom++;
						}
						$insertsql .= "INSERT INTO `$table` VALUES (".implode(',', $val).");\n";
					} else {
						$this->complete=false;
						break 2;
					}
				}
				
		}
		$this->startfrom= $startfrom;
		return $insertsql;
	}

}

?>