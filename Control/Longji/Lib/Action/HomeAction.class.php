<?php
class HomeAction extends EmptyAction{
	
	
	public function _initialize(){
		parent::_initialize();
	}

	//生成验证码
    
    public function verficode(){
    	header('Content-type: image/jpeg');
        $type	 =	 isset($_GET['type'])? get_safe_replace($_GET['type']):'jpeg';
        import("@.ORG.Image");
        Image::buildImageVerify(4,1,$type);	
    }
    
    //接收客户提交数据并保存
    public function saveinfo()
    {
    	$data=I("post.");
    	$moduleid=I("post.moduleid");
    	
    	//判断
    	$module=F("module");
    	$nmodule=$module[$moduleid];
    	if(strtolower($nmodule["lgtypes"])!='guestbook'){
    		$this->error(L("CANTWRITE"));
    	}
    	
    	$data["createip"]=get_client_ip(0);
    	$data["createtime"]=time();
    	$M=M($nmodule["name"]);
    	$M->add($data);
    	
    	/*
    	 * 留言回执
    	 * */
    	 $sys_c=array_merge(F("sys.config"),F("Config_".$this->langid));
    	if($sys_c["feedback_msg"]){
    		$mailbody_b="";
    		$mailbody='<html>';
			$mailbody.='<title></title>';
			$mailbody.='<style type="text/css">';
			$mailbody.='body,td,th {';
			$mailbody.='	font-size: 12px;';
			$mailbody.='	color: #CCC;';
			$mailbody.='	}';
			$mailbody.='</style>';
			$mailbody.='</head>';
			
			$mailbody.='			<body>';
			$mailbody.='<p>亲爱的&nbsp;<b>'.$sys_c["site_name"].'</b>&nbsp;管理员： </p>';
			$mailbody.='<p>贵站有一条最新留言信息，留言信息如下：</p>';
			$mailbody.='<table width="600" border="0" cellspacing="1" cellpadding="1" bgcolor="#ddd">';
			$Fields=F($moduleid."_Fields");
			foreach($Fields as $r){
				if($r['ispost'] && $r['status']){
					$mailbody_b.='<tr><td height="25" bgcolor="#FFFFFF" align="left"><b>'.$r[name].'</b>:<br />&nbsp;&nbsp;'.crhtml($data[$r['field']]).'</td></tr>';
				}
				
				
				
			}
			
			$mailbody_b.='<tr><td height="25" bgcolor="#FFFFFF" align="left"><b>IP:</b>&nbsp;&nbsp;'.get_client_ip().'</td></tr>';
			
 			$mailbody.=$mailbody_b;

			$mailbody.='</table>';
			$mailbody.='<p>请及时查看操作。 </p>';
			$mailbody.='<p>龙吉网络技术部</p>';
			$mailbody.='<p>'.toDate(time()).'</p>';
			$mailbody.='</body>';

    		$r=sendmail($sys_c["feedback_email"],"亲，您的网站有新客户留言，请及时查看！",$mailbody);
    		
    	}
    	
    	$this->success(L("DO_SUCCESS"));
    		
    }
    
	public function index($catid='',$module='')
    {
		if(empty($catid)) $catid =  intval(I("id"));
		
		$p= max(intval(I(C('VAR_PAGE'),1)),1);
		if($catid){
			$cat = $this->Categorys[$catid];
			$bcid = explode(",",$cat['arrparentid']); 
			
			$bcid = $bcid[0];
			
			
			if($bcid == '') $bcid=intval($catid);
			if(empty($module))$module=$cat['module'];
			$moduleid=$cat["moduleid"];
			$this->assign('module_name',$module);
			unset($cat['id']);
			$this->assign($cat);
			$cat['id']=$catid;
			$this->assign('catid',$catid);
			$this->assign('bcid',$bcid);
		}
		$this->module=F("module");
		//阅读权限
		$fields = F($moduleid.'_Fields');
		foreach($fields as $key=>$r){
			$fields[$key]['setup'] =string2array($fields[$key]['setup']);
		}
		$this->assign ( 'fields', $fields); 


		$seo_title = $cat['title'] ? $cat['title'] : $cat['catname'];
		$this->assign ('seo_title',$seo_title);
		$this->assign ('seo_keywords',$cat['keywords']);
		$this->assign ('seo_description',$cat['description']);
		
		
		switch(strtolower(MODULE_NAME)){
			case "page":
				$data=M(MODULE_NAME)->where("id=$catid")->find();
				
				$template_list=$this->Categorys[$catid]["template_show"];
				if(empty($template_list)){
					$template_list="about";
				}
				$this->assign($data);
				break;
			case "guestbook":
			
				$template_list=$this->Categorys[$catid]["template_show"];
				if(empty($template_list)){
					$template_list="index";
				}
				
				$where['status']=array('eq',1);
				$this->dao= M($module);
				$count = $this->dao->where($where)->count();
				if($count){
					import ( "@.ORG.Page" );
					$listRows =  !empty($cat['pagesize']) ? $cat['pagesize'] : C('PAGE_LISTROWS');		
					$page = new Page ( $count, $listRows );
					$page->urlrule = geturl($cat,'');
					$pages = $page->show();
					$field =  $this->module[$moduleid]['infield'];
					$field =  $field ? $field : '*';
					$list = $this->dao->field($field)->where($where)->order('createtime desc,id desc')->limit($page->firstRow . ',' . $page->listRows)->select();
					$this->assign('pages',$pages);
					$this->assign('list',$list);
				}
				break;
			default:
				if($catid){
					$where = " status>=1 ";					
					if($cat['child']){							
						$where .= " and catid in(".$cat['arrchildid'].")";			
					}else{
						$where .=  " and catid=".$catid;			
					}
					
					if(empty($cat['listtype'])){
						$this->dao= M($module);
						$count = $this->dao->where($where)->count();
							import ( "@.ORG.Page" );
							$listRows =  !empty($cat['pagesize']) ? $cat['pagesize'] : C('PAGE_LISTROWS');
							$page = new Page ( $count, $listRows );
							
							$page->setConfig('theme',' %first% %upPage% %prePage%%linkPage% %nextPage%  %downPage% %end%');
							$pages = $page->show();
							$field =  $this->module[$moduleid]['infield'];
							$field =  $field ? $field : '*';
							$list = $this->dao->field($field)->where($where)->order('listorder asc,id desc')->limit($page->firstRow . ',' . $page->listRows)->select();
							$this->assign('pages',$pages);
							$this->assign('list',$list);

							//如果模板列表页为空
							if(!$cat["template_list"]){
								$template_r = 'list';
							}else{
								$template_r = $cat["template_list"];
							}
						
					}else{
						$template_r = 'index';
					}
				}else{
					$template_r = 'list';
				}
				$template_list=$template_r;
				
		}
		
		$this->display($this->hometemplate.MODULE_NAME."_".$template_list.C('TMPL_TEMPLATE_SUFFIX'));
    }

 

	public function detail($id='',$module='')
    {
		$this->Urlrule =F('Urlrule');
		$p= max(intval($_REQUEST[C('VAR_PAGE')]),1);		
		$id = $id ? $id : intval($_REQUEST['id']);
		$module = $module ? $module : MODULE_NAME;
		$this->assign('module_name',$module);
		$this->dao= M($module);;
		$data = $this->dao->find($id);
		
		
		$catid = $data['catid'];
		$cat = $this->categorys[$data['catid']];
		if(empty($cat['ishtml']))$this->dao->where("id=".$id)->setInc('hits'); //添加点击次数
		$bcid = explode(",",$cat['arrparentid']); 
		$bcid = $bcid[1]; 
		if($bcid == '') $bcid=intval($catid);

		
		$seo_title = $data['title'].'-'.$cat['catname'];
		$this->assign ('seo_title',$seo_title);
		$this->assign ('seo_keywords',$data['keywords']);
		$this->assign ('seo_description',$data['description']);
		$this->assign ( 'fields', F($cat['moduleid'].'_Field') ); 
		

		$fields = F($this->mod[$module].'_Field');
		foreach($data as $key=>$c_d){
			$setup='';
			$fields[$key]['setup'] =$setup=string2array($fields[$key]['setup']);
			if($setup['fieldtype']=='varchar' && $fields[$key]['type']!='text'){
				$data[$key.'_old_val'] =$data[$key];
				$data[$key]=fieldoption($fields[$key],$data[$key]);
			}elseif($fields[$key]['type']=='images' || $fields[$key]['type']=='files'){ 
				if(!empty($data[$key])){
					$p_data=explode(':::',$data[$key]);
					$data[$key]=array();
					foreach($p_data as $k=>$res){
						$p_data_arr=explode('|',$res);					
						$data[$key][$k]['filepath'] = $p_data_arr[0];
						$data[$key][$k]['filename'] = $p_data_arr[1];
					}
					unset($p_data);
					unset($p_data_arr);
				}
			}
			unset($setup);
		}
		$this->assign('fields',$fields); 


		

		if(!empty($data['template'])){
			$template = $data['template'];
		}elseif(!empty($cat['template_show'])){
			$template = $cat['template_show'];
		}else{
			$template =  'show';
		}

		$this->assign('catid',$catid);
		$this->assign ($cat);
		$this->assign('bcid',$bcid);

		$this->assign ($data);

		$this->display($this->hometemplate.MODULE_NAME."_".$template.C('TMPL_TEMPLATE_SUFFIX')); 
    }

	public function shows($id='',$module='')
    {
		$this->Urlrule =F('Urlrule');
		$p= max(intval($_REQUEST[C('VAR_PAGE')]),1);		
		$id = $id ? $id : intval($_REQUEST['id']);
		$module = $module ? $module : MODULE_NAME;
		$this->assign('module_name',$module);
		$this->dao= M($module);;
		$data = $this->dao->find($id);
		
		
		$catid = $data['catid'];
		$cat = $this->categorys[$data['catid']];
		if(empty($cat['ishtml']))$this->dao->where("id=".$id)->setInc('hits'); //添加点击次数
		$bcid = explode(",",$cat['arrparentid']); 
		$bcid = $bcid[1]; 
		if($bcid == '') $bcid=intval($catid);

		
		$seo_title = $data['title'].'-'.$cat['catname'];
		$this->assign ('seo_title',$seo_title);
		$this->assign ('seo_keywords',$data['keywords']);
		$this->assign ('seo_description',$data['description']);
		$this->assign ( 'fields', F($cat['moduleid'].'_Field') ); 
		


		$this->display($this->hometemplate.MODULE_NAME."_shows".C('TMPL_TEMPLATE_SUFFIX')); 
    }

	public function down()
	{

		$module = $module ? $module : MODULE_NAME;
		$id = $id ? $id : intval($_REQUEST['id']);
		$this->dao= M($module);
		$filepath = $this->dao->where("id=".$id)->getField('file');
		$this->dao->where("id=".$id)->setInc('downs');
		$filename="";
		if(strpos($filepath, ':/')) { 
			header("Location: $filepath");
		} else {	
			$filepath = '.'.$filepath;
			if(!$filename) $filename = basename($filepath);
			$useragent = strtolower($_SERVER['HTTP_USER_AGENT']);
			if(strpos($useragent, 'msie ') !== false) $filename = rawurlencode($filename);
			$filetype = strtolower(trim(substr(strrchr($filename, '.'), 1, 10)));
			$filesize = sprintf("%u", filesize($filepath));
			if(ob_get_length() !== false) @ob_end_clean();
			header('Pragma: public');
			header('Last-Modified: '.gmdate('D, d M Y H:i:s') . ' GMT');
			header('Cache-Control: no-store, no-cache, must-revalidate');
			header('Cache-Control: pre-check=0, post-check=0, max-age=0');
			header('Content-Transfer-Encoding: binary');
			header('Content-Encoding: none');
			header('Content-type: '.$filetype);
			header('Content-Disposition: attachment; filename="'.$filename.'"');
			header('Content-length: '.$filesize);
			readfile($filepath);
		}
		exit;
	}

	/*
	 * 点击数
	 * */
	public function hits()
	{
		$module = $module ? $module : MODULE_NAME;
		$id = $id ? $id : intval($_REQUEST['id']);
		$this->dao= M($module);
		$this->dao->where("id=".$id)->setInc('hits');

		if($module=='Download'){
			$r = $this->dao->find($id);
			echo '$("#hits").html('.$r['hits'].');$("#downs").html('.$r['downs'].');';
		}else{
			$hits = $this->dao->where("id=".$id)->getField('hits');
			echo '$("#hits").html('.$hits.');';
		}
		exit;
	}
	
	
	
}