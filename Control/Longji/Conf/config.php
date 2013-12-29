<?php
$dbconfig	=	require (RUNTIME_PATH.'config.php');
$langconfig	=	require (RUNTIME_PATH.'lang.php');
if(file_exists(RUNTIME_PATH.'longji.php')){
	$appconfig	=	require (RUNTIME_PATH.'longji.php');
}else{
	$appconfig=array();
}

$config= array(
	//'配置项'=>'配置值'
	'APP_GROUP_LIST'				=>'Admin,Home',
	'DEFAULT_GROUP'					=>'Home',
	'TAGLIB_PRE_LOAD'				=>'LJ',
	'URL_PATHINFO_DEPR'				=>'-',
	'TMPL_TEMPLATE_SUFFIX'			=>'.tpl',
	'URL_MODEL'						=> '0', 	//URL模式
	'VAR_PAGE'						=>'p',
	'LANG_SWITCH_ON' 				=> true,   	// 开启语言包功能
	'VAR_LANGUAGE'     				=> 'l', 	// 默认语言切换变量
	'LANG_AUTO_DETECT' 				=>true,		// 自动侦测语言 开启多语言功能后有效
);

return array_merge($dbconfig,$langconfig,$appconfig,$config);
?>