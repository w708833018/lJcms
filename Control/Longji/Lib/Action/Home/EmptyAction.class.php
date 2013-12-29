<?php
/**
 * 
 * Empty (绌烘ā鍧�
 *
 */

class EmptyAction extends Action
{	
	public $lang,$langid,$hometemplate,$Categorys,$module;
	public function _initialize(){
		
		$cl=I("l",C("DEFAULT_LANG"));
		
		if(!$cl){
			$cl="cn";
		}
		$this->langdata=F("lang");
		if($cl){
			cookie("homelang",$cl,3600*24*30);
			$this->lang=$cl;
			$this->langid=$this->langdata[$cl]["id"];
		}
		cookie("think_language",$cl);
		$this->assign("langs",$this->langdata);
		$this->assign("l",$this->lang);
		$this->assign("langid",$this->langid);
		$this->assign(F("Config_".$this->langid));
		$this->Categorys=F("Category_".$this->langid);
		$this->assign("Categorys",F("Category_".$this->langid));
		
		
		$this->hometemplate=$this->langdata[$this->lang]["template"];
		
		$T = F('config_'.$this->lang,'', $this->hometemplate);
		$this->assign('T',$T);
	}
	
	public function _empty()
	{
		//绌烘搷浣�绌烘ā鍧�
			$Mod = F('Module');
			foreach($Mod as $key=>$value){
				$AllModule[$key]=$value["name"];
			}
			if(!in_array(MODULE_NAME,$AllModule)){ 
				throw_exception('404');
			}
		$lang=$this->langid;
		$a=ACTION_NAME;
		$id =  intval(I('id'));
		$catid = intval(I('catid'));
		$moduleid =  intval(I('moduleid'));
		
		if(empty($id)){
			$Cat = F('Category_'.$lang);
			$id = $Cat[$id];
			unset($Cat);
		}
		
		$m=MODULE_NAME;			
		import('@.Action.Home');
		$bae=new HomeAction();
		if(!method_exists($bae,$a)){
			throw_exception('404');
		}
		$bae->$a($id,$m);
		
		
	 
	}
	
	
}
?>