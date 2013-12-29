<?php
class AttacheAction extends AdminAction{
	public $allowsize,$defaultext;
	public $ext,$maxsize;
	function _initialize(){
		$this->allowsize=3145728;
		$this->defaultext="jpg,png,gif,bmp,jpeg";
		
		$this->ext=I("get.ext",$this->defaultext);
		$this->maxsize=I("get.maxsize");
		if(empty($this->maxsize)){$this->maxsize=$this->allowsize;};
	}
	
	function index(){
		//显示上传图片栏
		$type=I("type");
		$this->assign("ext",$this->ext);
		$this->assign("maxsize",$this->maxsize);
		switch($type){
		case "alllist":
			$paths=I("paths");
			$page=I("page",1);
			$lists=$this->listinfo($paths);
			$pagesize=8;
			//计数
			$count=count($lists["file"]);
			$allpage=ceil($count / $pagesize);
			//
			$this->assign("folder",$lists["folder"]);
			
			$list_n=array();
			for($i=0;$i<$pagesize;$i++){
				$nowf=($page-1)*$pagesize+$i;
				if($count>$nowf){
					$list_n[]=$lists["file"][$nowf];
				}
				
			}
			$page_str="<span>共 $count 个 共  $allpage 页</span> <a href=\"javascript:myupload('选择图片','".U('','type=alllist')."','',1,'$paths')\">|<</a>  <a href=\"javascript:myupload('选择图片','".U('','type=alllist')."','',".($page<=1?1:($page-1)).",'$paths')\"> << </a>  <a href=\"javascript:myupload('选择图片','".U('','type=alllist')."','',".($page>=$allpage?$allpage:($page+1)).",'$paths')\"> >> </a>  <a href=\"javascript:myupload('选择图片','".U('','type=alllist')."','',".$allpage.",'$paths')\">>|</a> ";
			$this->assign("pages",$page_str);
			$this->assign("list",$list_n);
			$this->assign("page",$page);
			$this->display("choosepic");
			break;
		default:
			$this->display();
		}
				
	}
	
	public function imagelist(){
		
		$root_path = UPLOAD_PATH;
		$root_url = __ROOT__."/Attache/";
		//图片扩展名
		$ext_arr = array('gif', 'jpg', 'jpeg', 'png', 'bmp');
		//根据path参数，设置各路径和URL
		if (empty($_GET['path'])) {
			$current_path = realpath($root_path) . '/';
			$current_url = $root_url;
			$current_dir_path = '';
			$moveup_dir_path = '';
		} else {
			$current_path = realpath($root_path) . '/' . $_GET['path'];
			$current_url = $root_url . $_GET['path'];
			$current_dir_path = $_GET['path'];
			$moveup_dir_path = preg_replace('/(.*?)[^\/]+\/$/', '$1', $current_dir_path);
		}
		echo realpath($root_path);
		//排序形式，name or size or type
		$order = I("order","strtolower","name");
	
		//不允许使用..移动到上一级目录
		if (preg_match('/\.\./', $current_path)) {
			echo 'Access is not allowed.';
			exit;
		}
		//最后一个字符不是/
		if (!preg_match('/\/$/', $current_path)) {
			echo 'Parameter is not valid.';
			exit;
		}
		//目录不存在或不是目录
		if (!file_exists($current_path) || !is_dir($current_path)) {
			echo 'Directory does not exist.';
			exit;
		}
	
		//遍历目录取得文件信息
		$file_list = array();
		if ($handle = opendir($current_path)) {
			$i = 0;
			while (false !== ($filename = readdir($handle))) {
				if ($filename{0} == '.') continue;
				$file = $current_path . $filename;
				if (is_dir($file)) {
					$file_list[$i]['is_dir'] = true; //是否文件夹
					$file_list[$i]['has_file'] = (count(scandir($file)) > 2); //文件夹是否包含文件
					$file_list[$i]['filesize'] = 0; //文件大小
					$file_list[$i]['is_photo'] = false; //是否图片
					$file_list[$i]['filetype'] = ''; //文件类别，用扩展名判断
				} else {
					$file_list[$i]['is_dir'] = false;
					$file_list[$i]['has_file'] = false;
					$file_list[$i]['filesize'] = filesize($file);
					$file_list[$i]['dir_path'] = '';
					$file_ext = strtolower(pathinfo($file, PATHINFO_EXTENSION));
					$file_list[$i]['is_photo'] = in_array($file_ext, $ext_arr);
					$file_list[$i]['filetype'] = $file_ext;
				}
				$file_list[$i]['filename'] = $filename; //文件名，包含扩展名
				$file_list[$i]['datetime'] = date('Y-m-d H:i:s', filemtime($file)); //文件最后修改时间
				$i++;
			}
			closedir($handle);
		}
		usort($file_list, 'cmp_func');
		
		$result = array();
		//相对于根目录的上一级目录
		$result['moveup_dir_path'] = $moveup_dir_path;
		//相对于根目录的当前目录
		$result['current_dir_path'] = $current_dir_path;
		//当前目录的URL
		$result['current_url'] = $current_url;
		//文件数
		$result['total_count'] = count($file_list);
		//文件列表数组
		$result['file_list'] = $file_list;


		$this->ajaxReturn($result,"JSON");
	}
	
	
	
	function upload(){
		import("@.ORG.UploadFile");
		
		$upload = new UploadFile();// 实例化上传类
		$upload->maxSize  = $this->maxsize ;// 设置附件上传大小
		$upload->allowExts  = explode(",",$this->ext);
		$upload->savePath =  UPLOAD_PATH;// 设置附件上传目录
		$upload->autoSub = true; 
		$upload->subType = 'date';
		$upload->dateFormat = 'Ym';
		if(!$upload->upload()) {// 上传错误提示错误信息
			$data["error"]=$upload->getErrorMsg();
			$data["status"]=0;
			$this->ajaxReturn($data,'JSON');
		}else{// 上传成功 获取上传文件信息
			$info =  $upload->getUploadFileInfo();
			$data["error"]="";
			$data['status'] = 1;
			$data['info'] = 'info';
			$data['size'] = 9;
			$data['url'] = __ROOT__.substr($info[0]['savepath'].strtolower($info[0]['savename']),1);;
			$data['filesize'] = $info[0]['size']; 

			$this->ajaxReturn($data,'JSON');
	}
		die();
	}
	
	function imageup(){
		import("@.ORG.UploadFile");
		
		$upload = new UploadFile();// 实例化上传类
		$upload->maxSize  = 3145728 ;// 设置附件上传大小
		$upload->allowExts  = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
		$upload->savePath =  UPLOAD_PATH;// 设置附件上传目录
		$upload->autoSub = true; 
		$upload->subType = 'date';
		$upload->dateFormat = 'Ym';
		if(!$upload->upload()) {// 上传错误提示错误信息
			$data["error"]=$upload->getErrorMsg();
			$data["status"]=0;
			$this->ajaxReturn($data,'JSON');
		}else{// 上传成功 获取上传文件信息
			$info =  $upload->getUploadFileInfo();
			$data["error"]=0;
			$data['url'] = __ROOT__.substr($info[0]['savepath'].strtolower($info[0]['savename']),1);;
			$data['filesize'] = $info[0]['size']; 
			$this->ajaxReturn($data,'JSON');
	}
		die();
	}

	function alllist(){
		//读取父路径
		$paths=I("paths");
		$page=I("p",1);
		$lists=$this->listinfo($paths);
		$pagesize=15;
		//计数
		$count=count($lists["file"]);
		$allpage=ceil($count / $pagesize);
		//
		$this->assign("folder",$lists["folder"]);
		
		$list_n=array();
		for($i=0;$i<$pagesize;$i++){
			$nowf=($page-1)*$pagesize+$i;
			if($count>$nowf){
				$list_n[]=$lists["file"][$nowf];
			}
			
		}
		$page_str="<a href='".U('','paths='.$paths)."'>|<</a><a href='".U('','p='.($page<=1?1:($page-1)).'&paths='.$paths)."'><<</a><a href='".U('','p='.($page>=$allpage?$allpage:($page+1)).'&paths='.$paths)."'>>></a><a href='".U('','p='.$allpage.'&paths='.$paths)."'>>|</a>";
		$this->assign("pages",$page_str);
		$this->assign("list",$list_n);
		$this->display();
	}


	function listinfo($paths){
		$directory=UPLOAD_PATH . $paths;
			$paths=str_replace("\\","/",$directory);
			$paths_e=explode("/",str_replace(UPLOAD_PATH,"",$paths));
			$path_str="<a href='".U('','')."'>根目录</a>";
			$path_str1="<a href=\"javascript:myupload('选择图片','".U('','type=alllist')."','',1,'')\">根目录</a>";
			$path_t="/";
			for($i=0;$i<count($paths_e);$i++){
				if($paths_e[$i]!='.'){
					$path_t.=$paths_e[$i];
					$path_str.="<a href='".U('','paths='.$path_t)."'>".$paths_e[$i]."</a>"."/";
					$path_str1.="<a href=\"javascript:myupload('选择图片','".U('','type=alllist')."','',1,'".$path_t."')\">".$paths_e[$i]."</a>/";
				}
				
			}
			$this->assign("paths",$path_str);
			$this->assign("paths1",$path_str1);
		
			

			$mydir=dir($directory);
			$list=array();
			$folder=array();
			$filelist=array();
			while($file=$mydir->read()){
				
				if(($file!=".") and ($file!="..")){
					$filename=$directory."/".$file;
					if((is_dir("$directory/$file"))){
						$d_i=array("filename"=>str_replace(UPLOAD_PATH,"",$filename),"name"=>$file,"type"=>1,"size"=>filesize($filename),"time"=>filemtime($filename));
						$folder[]=$d_i;
					}else{
						if(strchr($file,"thumb_32_32_")==0){
							$d_i=array("filename"=>str_replace("//","/",$filename),"name"=>$file,"type"=>0,"size"=>filesize($filename),"time"=>filemtime($filename));
							$filelist[]=$d_i;
						}
					}
				}
			}
			$list["folder"]=$folder;
			$list["file"]=$filelist;
			return $list;
	}
	
}