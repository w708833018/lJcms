<?php

function save_lang(){
	$list=M("lang")->where("status>=1")->field("mark")->select();
	$i=0;
	foreach($list as $key=>$value){
		$data[$i]=$value['mark'];
		$i++;
	}
	$data_str=implode(",",$data);
	$bd["LANG_LIST"]=$data_str;
	F("lang",$bd,RUNTIME_PATH);
	return true;
}

function m_s($status,$barray=array("<font color=red>已禁用</font>","<font color=green>正常</font>")){
	switch($status){
		case 0:
			$st=$barray[0];
			break;
		case 1:
			$st=$barray[1];
			break;
	}
	
	return $st;
}


/*重新组合查询时间*/

function toDate($times,$format="Y-m-d H:i:s"){
		return Date($format,$times);
}

/*转换为IP数字*/

function get_ip_num($ipstr=""){
	if(empty($ipstr)){
		$ipstr=get_client_ip();
	}
	return ip2long($ipstr);
}

/*
 * 文件操作
 * 删除、新建文件夹，文件等
 * */
 
 function template_file($module='',$path='',$ext='html'){
 	$ext=str_replace(".","",$ext);
	$path= $path ? $path : TMPL_PATH.'Home/';
	$tempfiles = dir_list($path,$ext);
	foreach ($tempfiles as $key=>$file){
		$dirname = basename($file);
		if($module){
			if(strstr($dirname,$module.'_')) {
				$arr[$key]['name'] =  substr($dirname,0,strrpos($dirname, '.'));
				$arr[$key]['value'] =  substr($arr[$key]['name'],strpos($arr[$key]['name'], '_')+1);
				$arr[$key]['filename'] = $dirname;
				$arr[$key]['filepath'] = $file;
			}
		}else{
			$arr[$key]['name'] = substr($dirname,0,strrpos($dirname, '.'));
			$arr[$key]['value'] =  substr($arr[$key]['name'],strpos($arr[$key]['name'], '_')+1);
			$arr[$key]['filename'] = $dirname;
			$arr[$key]['filepath'] = $file;
		}
	}
	return  $arr;
}
 
 
 
function fileext($filename) {
	return strtolower(trim(substr(strrchr($filename, '.'), 1, 10)));
}

function dir_path($path) {
	$path = str_replace('\\', '/', $path);
	if(substr($path, -1) != '/') $path = $path.'/';
	return $path;
}

function dir_create($path, $mode = 0777) {
	if(is_dir($path)) return TRUE;
	$ftp_enable = 0;
	$path = dir_path($path);
	$temp = explode('/', $path);
	$cur_dir = '';
	$max = count($temp) - 1;
	for($i=0; $i<$max; $i++) {
		$cur_dir .= $temp[$i].'/';
		if (@is_dir($cur_dir)) continue;
		@mkdir($cur_dir, $mode,true);
		@chmod($cur_dir, $mode);
	}
	return is_dir($path);
}

function mk_dir($dir, $mode = 0777) {
    if (is_dir($dir) || @mkdir($dir, $mode))
        return true;
    if (!mk_dir(dirname($dir), $mode))
        return false;
    return @mkdir($dir, $mode);
}

function dir_copy($fromdir, $todir) {
	$fromdir = dir_path($fromdir);
	$todir = dir_path($todir);
	if (!is_dir($fromdir)) return FALSE;
	if (!is_dir($todir)) dir_create($todir);
	$list = glob($fromdir.'*');
	if (!empty($list)) {
		foreach($list as $v) {
			$path = $todir.basename($v);
			if(is_dir($v)) {
				dir_copy($v, $path);
			} else {
				copy($v, $path);
				@chmod($path, 0777);
			}
		}
	}
    return TRUE;
}

function dir_list($path, $exts = '', $list= array()) {
	$path = dir_path($path);
	$files = glob($path.'*');
	foreach($files as $v) {
		$fileext = fileext($v);
		if (!$exts || preg_match("/\.($exts)/i", $v)) {
			$list[] = $v;
			if (is_dir($v)) {
				$list = dir_list($v, $exts, $list);
			}
		}
	}
	return $list;
}
  
function dir_tree($dir, $parentid = 0, $dirs = array()) {
	if ($parentid == 0) $id = 0;
	$list = glob($dir.'*');
	foreach($list as $v) {
		if (is_dir($v)) {
            $id++;
			$dirs[$id] = array('id'=>$id,'parentid'=>$parentid, 'name'=>basename($v), 'dir'=>$v.'/');
			$dirs = dir_tree($v.'/', $id, $dirs);
		}
	}
	return $dirs;
}

function sendmail($tomail,$subject,$body,$config=''){

		if(!$config)$config = F('sys.config');
		import("@.ORG.PHPMailer");
		$mail = new PHPMailer();
		$mail->PluginDir=LIB_PATH."ORG/";
		$mail->IsSMTP();
		$mail->SMTPAuth = true; // 开启SMTP认证
		
		//$mail->PluginDir=LIB_PATH."ORG/";
		$mail->CharSet='utf-8';
		$mail->SMTPDebug  = false;        // 改为2可以开启调试
		$mail->Host = $config['mail_smtp'];      // GMAIL的SMTP
		//$mail->SMTPSecure = "ssl"; // 设置连接服务器前缀
		//$mail->Encoding = "base64";
		$mail->Port = $config['mail_port']?$config["mail_port"]:25;    // SMTP端口号（默认是25）
		$mail->Username = $config['mail_user']; // MAIL用户名
		$mail->Password = $config['mail_pass']; // MAIL密码
		$mail->SetFrom($config['mail_user'], $config['mail_name']);     //发送者邮箱
		$mail->AddAddress($tomail); //可同时发多个
		//$mail->WordWrap = 50; // 设定 word wrap
		//$mail->AddAttachment("/var/tmp/file.tar.gz"); // 附件1
		//$mail->AddAttachment("/tmp/image.jpg", "new.jpg"); // 附件2
		$mail->IsHTML(true); // 以HTML发送
		$mail->Subject = $subject;
		$mail->Body = $body;
		if(!$mail->Send())
		{
			return false;
		}else{
			return true;
		}
}

function dir_delete($dir) {
	//$dir = dir_path($dir);
	if (!is_dir($dir)) return FALSE; 
	$handle = opendir($dir); //打开目录
	while(($file = readdir($handle)) !== false) {
	        if($file == '.' || $file == '..')continue;
			$d = $dir.DIRECTORY_SEPARATOR.$file;
	        is_dir($d) ? dir_delete($d) : @unlink($d);
	}
	closedir($handle);
	return @rmdir($dir);
}
 
/*
 * 转换为缩略图
 * 
 * */

function thumb($f, $tw=300, $th=300 ,$autocat=0, $nopic = 'nopic.jpg',$t=''){
	if(strstr($f,'://')) return $f;
	if(empty($f)) return __ROOT__.'/Public/Images/'.$nopic;
	$f= '.'.str_replace(__ROOT__,'',$f);
	
	$temp = array(1=>'gif', 2=>'jpeg', 3=>'png');
	list($fw, $fh, $tmp) = getimagesize($f);
	if(empty($t)){
		if($fw>$tw && $fh>$th){
			$pathinfo = pathinfo($f);
			$t = $pathinfo['dirname'].'/thumb_'.$tw.'_'.$th.'_'.$pathinfo['basename'];
			if(is_file($t)){
				return  __ROOT__.substr($t,1);
			}
		}else{
			return  __ROOT__.substr($f,1);
		}		
	}
	
	if(!$temp[$tmp]){	return false; }

	if($autocat){
		if($fw/$tw > $fh/$th){
		$fw = $tw * ($fh/$th);
		}else{
		$fh = $th * ($fw/$tw);
		}
	}else{

		 $scale = min($tw/$fw, $th/$fh); // 计算缩放比例
            if($scale>=1) {
                // 超过原图大小不再缩略
                $tw   =  $fw;
                $th  =  $fh;
            }else{
                // 缩略图尺寸
                $tw  = (int)($fw*$scale);
                $th = (int)($fh*$scale);
            }


	}

	$tmp = $temp[$tmp];
	$infunc = "imagecreatefrom$tmp";
	$outfunc = "image$tmp";
	$fimg = $infunc($f);

	if($tmp != 'gif' && function_exists('imagecreatetruecolor')){
		$timg = imagecreatetruecolor($tw, $th);
	}else{
		$timg = imagecreate($tw, $th);
	}


	if(function_exists('imagecopyresampled'))
		imagecopyresampled($timg, $fimg, 0,0, 0,0, $tw,$th, $fw,$fh);
	else
		imagecopyresized($timg, $fimg, 0,0, 0,0, $tw,$th, $fw,$fh);
	if($tmp=='gif' || $tmp=='png') {
		$background_color  =  imagecolorallocate($timg,  0, 255, 0);  //  指派一个绿色
		imagecolortransparent($timg, $background_color);  //  设置为透明色，若注释掉该行则输出绿色的图
	}
	$outfunc($timg, $t);
	imagedestroy($timg);
	imagedestroy($fimg);
	return  __ROOT__.substr($t,1);
}


//字符串截取

function str_cut($sourcestr,$cutlength,$suffix='...')
{
	$str_length = strlen($sourcestr);
	if($str_length <= $cutlength) {
		return $sourcestr;
	}
	$returnstr='';	
	$n = $i = $noc = 0;
	while($n < $str_length) {
			$t = ord($sourcestr[$n]);
			if($t == 9 || $t == 10 || (32 <= $t && $t <= 126)) {
				$i = 1; $n++; $noc++;
			} elseif(194 <= $t && $t <= 223) {
				$i = 2; $n += 2; $noc += 2;
			} elseif(224 <= $t && $t <= 239) {
				$i = 3; $n += 3; $noc += 2;
			} elseif(240 <= $t && $t <= 247) {
				$i = 4; $n += 4; $noc += 2;
			} elseif(248 <= $t && $t <= 251) {
				$i = 5; $n += 5; $noc += 2;
			} elseif($t == 252 || $t == 253) {
				$i = 6; $n += 6; $noc += 2;
			} else {
				$n++;
			}
			if($noc >= $cutlength) {
				break;
			}
	}
	if($noc > $cutlength) {
			$n -= $i;
	}
	$returnstr = substr($sourcestr, 0, $n);
 

	if ( substr($sourcestr, $n, 6)){
          $returnstr = $returnstr . $suffix;//超过长度时在尾处加上省略号
      }
	return $returnstr;
}


/*获取IP地址*/

function IP($ip='',$file='UTFWry.dat') {
	import("@.ORG.IpLocation");
	$iplocation = new IpLocation($file);
	$location = $iplocation->getlocation($ip);
	return $location;
}


/*随机生成字符串*/

function rand_str($len = 6, $type = '', $addChars = ''){
	
	$str = '';
	switch ($type) {
		case 0 :
			$chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' . $addChars;
			break;
		case 1 :
			$chars = str_repeat ( '0123456789', 3 );
			break;
		case 2 :
			$chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' . $addChars;
			break;
		case 3 :
			$chars = 'abcdefghijklmnopqrstuvwxyz' . $addChars;
			break;
		default :
			// 默认去掉了容易混淆的字符oOLl和数字01，要添加请使用addChars参数
			$chars = 'ABCDEFGHIJKMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789' . $addChars;
			break;
	}
	if ($len > 10) { //位数过长重复字符串一定次数
		$chars = $type == 1 ? str_repeat ( $chars, $len ) : str_repeat ( $chars, 5 );
	}
	if ($type != 4) {
		$chars = str_shuffle ( $chars );
		$str = substr ( $chars, 0, $len );
	} else {
		// 中文随机字
		for($i = 0; $i < $len; $i ++) {
			$str .= msubstr ( $chars, floor ( mt_rand ( 0, mb_strlen ( $chars, 'utf-8' ) - 1 ) ), 1 );
		}
	}
	return $str;
	
}

/*获取字段参数*/

function get_field_info(){
	
}

/*字节转换*/

function byte_format($input, $dec=0)
{
  $prefix_arr = array("B", "K", "M", "G", "T");
  $value = round($input, $dec);
  $i=0;
  while ($value>1024)
  {
     $value /= 1024;
     $i++;
  }
  $return_str = round($value, $dec).$prefix_arr[$i];
  return $return_str;
}

/*
 * 获取自定义字段信息
 * 
 * */
function getvalidate($info){
        $validate_data=array();
        if($info['minlength']) $validate_data['minlength'] = ' minlength:'.$info['minlength'];
		if($info['maxlength']) $validate_data['maxlength'] = ' maxlength:'.$info['maxlength'];
		if($info['required']) $validate_data['required'] = ' required:true';		
		if($info['pattern'] == 'equalTo'){			
			$equalTo = str_replace('re','',$info['field']);
			$validate_data['pattern'] = ' equalTo:#'.$equalTo;
		}else{
			if($info['pattern']) $validate_data['pattern'] = ' '.$info['pattern'].':true';
		}
        if($info['errormsg']) $errormsg = ' title="'.$info['errormsg'].'"';
        $validate= implode(',',$validate_data);
        $validate= $validate ? 'validate="'.$validate.'" ' : '';
        $parseStr = $validate.$errormsg;
        return $parseStr;
}

function get_number_ip($ip){
	return get_client_ip(1);
}

function checkfield($fields,$postdata){

		foreach ( $postdata as $key => $val ) {
				$setup=$fields[$key]['setup'];

				if(!empty($fields[$key]['required']) && empty($postdata[$key])) return '';
				//$setup=string2array($fields[$key]['setup']);
				if($setup['safefun']){
					$fun =$setup['safefun'];
					if($fun!='no')
					$postdata[$key] = $fun($postdata[$key]);
				
				}elseif($setup['multiple'] || $setup['inputtype']=='checkbox' || $fields[$key]['type']=='checkbox'){
					$postdata[$key] =  safe_replace(strip_tags($postdata[$key]));
					$postdata[$key] = implode(',',$postdata[$key]);		
				}elseif($fields[$key]['type']=='datetime'){
					$postdata[$key] =strtotime($postdata[$key]);
				}elseif($fields[$key]['type']=='images' || $fields[$key]['type']=='files'){
					$name = $key.'_name';
					$arrdata =array();
					foreach($postdata[$key] as $k=>$res){
						if(!empty($postdata[$key][$k])) $arrdata[]= safe_replace(strip_tags($postdata[$key][$k].'|'.$postdata[$name][$k]));
					}
					$postdata[$key]=implode(':::',$arrdata);
				}elseif($fields[$key]['type']=='textarea'){
					$postdata[$key] = safe_replace(strip_tags($postdata[$key]));
				}elseif($key=='aid'){
					$postdata[$key] =  $postdata[$key];
				}else{
					$postdata[$key] =  safe_replace(strip_tags($postdata[$key]));
				}
		}
		return $postdata;
}

function string2array($info) {
		$r=array();
        if($info == '') return array();
        $info=stripcslashes($info);
        eval("\$r = $info;");
        return $r;
}



function array2string($info) {
	if($info == '') return '';
	if(!is_array($info)) $string = stripslashes($info);
	foreach($info as $key => $val) $string[$key] = stripslashes($val);
	return addslashes(var_export($string, TRUE));
}


/*写缓存*/

function save_cache($ModuleName,$FileName='',$where=array(),$field='*'){
	$M=M($ModuleName);
	if(empty($FileName)){
		$FileName=$ModuleName;
	}
	switch(strtolower($ModuleName)){
		
		case "category":
			$Lan_List=M("lang")->field("id")->select();
			foreach ( $Lan_List as $key => $value ) {
				$lang=$value["id"];
       			$Data_T=M($ModuleName)->where("lang=$lang")->field($field)->order("listorder asc,id desc")->select();
       			$Data=array();
       			foreach($Data_T as $key1=>$value1){
       				$Data[$value1["id"]]=$value1;
       				$parentid1=$value1["id"];
       				$Data_T_I=M($ModuleName)->where("lang=$lang and parentid=$parentid1")->field($field)->order("listorder asc,id desc")->select();
       				//$Data[$value1["id"]]['child']=$Data_T_I;
	       				foreach($Data_T_I as $key2=>$value2){
	       						$parentid2=$value2["id"];
	       						$Data[$value1["id"]]['child'][$value2["id"]]=$value2;
	       						$Data_T_M=M($ModuleName)->where("lang=$lang and parentid=$parentid2")->field($field)->order("listorder asc,id desc")->select();
	       						foreach($Data_T_M as $key3=>$value3){
	       							$Data[$value1["id"]]['child'][$value2["id"]]['child'][$value3["id"]]=$value3;
	       						}
	       						
	       				}
       			}
       			
       			F($FileName."_".$value["id"],$Data);
			}
			
			break;
		
		case "sys.config":
				$Data_T=M("Config")->where("lang=0")->field("name,value")->select();
       			$Data=array();
       			foreach($Data_T as $key1=>$value1){
       				$Data[$value1["name"]]=$value1["value"];
       			}
       			F("sys.config",$Data);
			break;
			
		case "config":
			$Lan_List=M("Lang")->select();
			foreach ( $Lan_List as $key => $value ) {
       			$Data_T=M("Config")->where("lang=".$value["id"])->field("name,value")->select();
       			$Data=array();
       			foreach($Data_T as $key1=>$value1){
       				$Data[$value1["name"]]=$value1["value"];
       			}
       			F("Config_".$value["id"],$Data);
			}
			
			//系统参数
			$Data_T=M("Config")->where("lang=0")->field("name,value")->select();
       			$Data=array();
       			foreach($Data_T as $key1=>$value1){
       				$Data[$value1["name"]]=$value1["value"];
       			}
			
			F("Sys.Config",$Data);
			break;
		case "menu":
			$map["parent"]=array("EQ",0);
			//$map["status"]=array("GT",0);
			$list_data = $M->order('listorder asc,id desc')->where($map)->select();
			$list_data_i=array();
			foreach($list_data as $key=>$value){
				$list_data_i[$key]=$value;
				$map["parent"]=array("EQ",$value["id"]);
				$list_data_it=$M->order('listorder asc,id desc')->where($map)->select();
				$list_data_i[$key]["child"]=$list_data_it;
				foreach($list_data_it as $key1=>$value1){
					$list_data_i[$key]["child"][$key1]=$value1;
					$map["parent"]=array("EQ",$value1["id"]);
					$list_data_i[$key]["child"][$key1]['child']=$M->order('listorder asc,id desc')->where($map)->select();
				}
			}
			$Data=$list_data_i;
			F($FileName,$Data);
			break;
		case "lang":
			$Data_i=$M->where($where)->field($field)->select();
			foreach($Data_i as $key=>$value){
				$Data[$value["mark"]]=$value;
			}
			F($FileName,$Data);
			save_lang();
			break;
		default:
			$where["status"]=array("GT",0);
			$Data_i=$M->where($where)->field($field)->select();
			foreach($Data_i as $key=>$value){
				$Data[$value["id"]]=$value;
			}
			F($FileName,$Data);
		
	}
	
}

function homeurl($langmark){
	if(C("IS_HTML")){
		$urls=C("html_root")."/".$langmark."/index".C("HTML_EXT");
	}else{
			/*
			if($langmark!=C("DEFAULT_LANG")){
				$lanstr="l=".$langmark;
			}else{
				$lanstr="";
			}
			*/
			$lanstr="l=".$langmark;
		$urls=U("Home/Index/index",$lanstr);
		$urls=str_replace("/Home","",$urls);
		$urls=str_replace("g=Home&","",$urls);
	}
	return $urls;
}

function geturl($cat,$data=''){
		
		//生成url
			$catdir=$cat["catdir"];
			$parentdir = $cat['parentdir'];
			$catid=$cat["id"];
			$module = $cat['module'];
			$moduleid =$cat['moduleid'];
			$catl=$cat["langmark"];
			//详细页
			
			$id=$data['id'];
			
		if(C("IS_HTML")){
			if($id){
				$urls="/".$catl."/".$parentdir.$catdir."/detail-".$id.C("HTML_EXT");
			}else{
				$urls="/".$catl."/".$parentdir.$catdir."/index".C("HTML_EXT");	
			}
		}else{
			if($catl!=C("DEFAULT_LANG")){
				$lanstr="&l=".$catl;
			}else{
				$lanstr="";
			}
			if($id){
				//内页
				$urls=U("Home/".$module."/detail","id=".$id.$lanstr);
			}else{
				$urls=U("Home/".$module."/index","id=".$catid.$lanstr);	
			}
		}
		$urls=str_replace("/Home","",$urls);
		$urls=str_replace("g=Home&","",$urls);
		return $urls;
}

// 自动转换字符集 支持数组转换
function auto_charset($fContents, $from='gbk', $to='utf-8') {
    $from = strtoupper($from) == 'UTF8' ? 'utf-8' : $from;
    $to = strtoupper($to) == 'UTF8' ? 'utf-8' : $to;
    if (strtoupper($from) === strtoupper($to) || empty($fContents) || (is_scalar($fContents) && !is_string($fContents))) {
        //如果编码相同或者非字符串标量则不转换
        return $fContents;
    }
    if (is_string($fContents)) {
        if (function_exists('mb_convert_encoding')) {
            return mb_convert_encoding($fContents, $to, $from);
        } elseif (function_exists('iconv')) {
            return iconv($from, $to, $fContents);
        } else {
            return $fContents;
        }
    } elseif (is_array($fContents)) {
        foreach ($fContents as $key => $val) {
            $_key = auto_charset($key, $from, $to);
            $fContents[$_key] = auto_charset($val, $from, $to);
            if ($key != $_key)
                unset($fContents[$key]);
        }
        return $fContents;
    }
    else {
        return $fContents;
    }
}


function getform($info,$value='',$form){
	if(empty($form)){
		import ( '@.ORG.Form' );	
		$form = new Form();
	}
	return  $form->$info['type']($info,$value);
}


/*模型静态缓存表*/
function save_field($moduleid){
	$Data=M("Field")->where("moduleid=$moduleid")->select();
	foreach($Data as $key=>$value){
		$Data_L[$value["id"]]=$value;
	}
	F($moduleid."_Fields",$Data_L);
}
/*新增模型*/

function ini_table($modelname){
		//$db=D('');
		$db =   DB::getInstance();
		$sql="Create table if not exists `".C("DB_PREFIX").$modelname."`(`id` int(11) unsigned not null AUTO_INCREMENT,`listorder` int(10) unsigned NOT NULL DEFAULT '0', `createtime` int(11) unsigned NOT NULL DEFAULT '0',`updatetime` int(11) unsigned NOT NULL DEFAULT '0',`status` tinyint(1) default 1 comment '状态',`lang` tinyint(3) default 1 comment '语言版本',`title` varchar(150) default '' comment '标题',`keyword` varchar(150) comment '关键字',`description` varchar(250) comment '页面描述',`image` varchar(250) comment '页面图片',`url` varchar(250) comment '页面路径', Primary key(id)) ENGINE=MyISAM DEFAULT CHARSET=utf8;";
		return $db->execute($sql);
}

function ini_field($modelname,$field,$fieldtype,$default,$comment){
	$M=M($modelname);
	return $M->execute("alter table `".C("DB_PREFIX").$modelname."` add `$field` $fieldtype default '$default' comment '$comment';");
}


function del_field($modelname,$field){
	$M=M($modelname);
	return $M->execute("alter table `".C("DB_PREFIX").$modelname."` DROP `$field`;");
}

function re_ini_field($modelname,$field,$fieldtype,$default,$comment){
	$M=M($modelname);
	return $M->execute("alter table `".C("DB_PREFIX").$modelname."` CHANGE `$field` `$field` $fieldtype default '$default' comment '$comment';");
}


/*
 * 获取域名domain或后缀（$types:0 域名，1：后缀）
 * */
 
 function getdomainstr($strs,$types=0){
 	preg_match( "|http://[^/]+?(/.*)|is", $strs, $tmp1 );
 	//print_r($tmp1);
 	$domain=$tmp1[0];
 	$domainstr=$tmp1[1];
	if(!$types){
		if($domainstr!="/"){
			return str_replace($domainstr,"",$domain);
		}else{
			return $domain;
		}
		
	}else{
		return $domainstr;
	}
 }
 
 
 function crhtml($strs){
 	$strs=str_replace(chr(13),"<br />",$strs);
 	return $strs;
 }

function getsubdir($dir,$onlyfolder=FALSE) 
{
	$subdirs = array();
	if(!$dh = opendir($dir)) 
		return $subdirs;
		$i = 0;
	while ($f = readdir($dh)) 
	{
			
     	if($f =='.' || $f =='..') 
			continue;
		$path = $f;
		if($onlyfolder){
			if(is_dir($dir.$path)){
				$subdirs[$i] = $path;
				$i++;
			}
		}else{
			$subdirs[$i] = $path;
			$i++;
		}
		
	}
	return $subdirs;
}

function myurl(){
	
	$domain = empty ($_SERVER['HTTP_HOST']) ?  $_SERVER['HTTP_HOST']  : $_SERVER['SERVER_NAME'] ;
	return "http://".$domain;
}
 
 //排序
function cmp_func($a, $b) {
	global $order;
	if ($a['is_dir'] && !$b['is_dir']) {
		return -1;
	} else if (!$a['is_dir'] && $b['is_dir']) {
		return 1;
	} else {
		if ($order == 'size') {
			if ($a['filesize'] > $b['filesize']) {
				return 1;
			} else if ($a['filesize'] < $b['filesize']) {
				return -1;
			} else {
				return 0;
			}
		} else if ($order == 'type') {
			return strcmp($a['filetype'], $b['filetype']);
		} else {
			return strcmp($a['filename'], $b['filename']);
		}
	}
}
?>
