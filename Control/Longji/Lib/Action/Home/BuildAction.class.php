<?php
/**
 * 
 * 生成html静态页面
 *

 */

class BuildAction extends Action
{
	public $categorys,$langdata,$module,$hometemplate;
	function _initialize(){
		$lang=I("langid");
		if(!$lang){
			$data["content"]="清先选择要更新语言！";
			$this->ajaxReturn($data,"JSON");
			exit();
		}
		
		$this->langdata=M("lang")->where("id=$lang")->find();
		
		$this->categorys=F("category_".$lang);
		
		cookie("think_language",$this->langdata['mark']);
		$this->assign("langs",M("lang")->order("id desc")->select());
		$this->assign("l",$this->langdata['mark']);
		$this->assign("langid",$this->langdata['id']);
		$this->assign(F("Config_".$lang));
		$this->Categorys=F("Category_".$lang);
		$this->assign("Categorys",F("Category_".$lang));
		
		
		$this->hometemplate=$this->langdata["template"];
		
		$T = F('config_'.$lang,'', $this->hometemplate);
		$this->assign('T',$T);
		
	}
    
 	
 	/*
 	 * 生成首页
 	 * */
 	 
 	function buildIndex(){
 			
 		
 			$this->buildHtml("index",".".C("HTML_ROOT").$this->langdata["mark"]."/",$this->langdata["template"]."Index_index.tpl");
 			$data["content"]="更新完毕";
 			$data["filepath"]=TEMPLATE_PATH;
 			$this->ajaxReturn($data,"JSON");
 			die();
 	}


	function buildList(){
		$categorysx=$this->categorys;
		$catid=I("catid");
		$module=I("module");
		if($catid && is_numeric($catid)){
			$categorysx=M("category")->where("id=$catid");
		}
		
		if($module){
			$categorysx=M("category")->where("module='$module'");
		}
		
		foreach($this->categorys as $key=>$value){
				$cat = $value;
				$catid=$value["id"];
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
			
			
				switch(strtolower($value["module"])){
					case "page":
						$data=M($value["module"])->where("id=$catid")->find();
						
						$template_list=$this->Categorys[$catid]["template_show"];
						if(empty($template_list)){
							$template_list="about";
						}
						$this->assign($data);
						$this->buildHtml("index",".".C("HTML_ROOT").$this->langdata["mark"]."/".$value["parentdir"]."/".$value["catdir"]."/",$this->langdata["template"].ucfirst($value["module"])."_".$template_list.".tpl");
						
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
							$where = " status>=1 ";					
							if($cat['child']){							
								$where .= " and catid in(".$cat['arrchildid'].")";			
							}else{
								$where .=  " and catid=".$catid;			
							}							
							if(empty($cat['listtype'])){
								$this->dao= M($value['module']);
								$count = $this->dao->where($where)->count();
								
									import ( "@.ORG.Page" );
									$listRows =  !empty($cat['pagesize']) ? $cat['pagesize'] : C('PAGE_LISTROWS');
									$page = new Page ( $count, $listRows);
									$page->setConfig('theme',' %first% %upPage% %prePage%%linkPage% %nextPage%  %downPage% %end%');
									
									$totalpage=$page->get_totalpage();
									if(empty($totalpage)){$totalpage=1;};
									$field =  $this->module[$moduleid]['infield'];
									$field =  $field ? $field : '*';
									for($pg=1;$pg<=$totalpage;$pg++){
										$page->set_page($pg,"index/show");
										$pages = $page->show();
										$list = $this->dao->field($field)->where($where)->order('listorder asc,id desc')->limit($page->firstRow . ',' . $page->listRows)->select();
										$this->assign('pages',$pages);
										$this->assign('list',$list);
										
										//如果模板列表页为空
										if($cat["template_list"]){
											$template_r = 'list';
										}else{
											$template_r = $cat["template_list"];
										}
									
										$this->buildHtml("index".($pg>1?"-".$pg:""),".".C("HTML_ROOT").$this->langdata["mark"]."/".$value["parentdir"]."/".$value["catdir"]."/",$this->langdata["template"].ucfirst($value["module"])."_".$template_r.".tpl");
									}	
								
							}else{
								$template_r = 'index';
								$this->buildHtml("index",".".C("HTML_ROOT").$this->langdata["mark"]."/".$value["parentdir"]."/".$value["catdir"]."/",$this->langdata["template"].ucfirst($value["module"])."_".$template_r.".tpl");
							}
						
				}
			//分页显示
				
				
		}
		$datax["content"]="<li>已生成全部列表页！</li>";
		$this->ajaxReturn($datax,"JSON");
	}


	function buildDetail(){
	
	}


}
?>