<?php
/*
 * 来访客户统计系统
 * */
class CountAction extends Action{
	protected $fromInfo;
	var $pageurl;	//访问页面
	var $referer;	//来源页面
	var $language;	//客户访问语言
	var $color;	//屏幕颜色分辨率
	var $screensize;	//屏幕分辨率
	var $firsttime,$lasttime;	//初次到访与最后刷新到访
	var $timezone;	//时区
	var $ip;
	public function _initialize(){
		//var $tmpDir = TMPDIR;
		
	}
	
	public function log(){
		//echo $Referer;
		echo $this->fromInfo;
	}
	
	
	public function record(){
		$this->dao=M("visit_data");
		//
		/**
		 * //index.php?g=Tool&m=Count&a=record&
		 * &counturl=&pageurl=http%3A//cms.b.cn/&
		 * referer=http%3A//www.baidu.com/s%3Fword%3Dhttp%253A%252F%252Fcms.b.cn%252F%26tn%3Dsitehao123%26ie%3Dutf-8&
		 * language=zh-CN&
		 * color=32&
		 * screensize=1366*768&debug=undefined&
		 * firsttime=113-7-18-17-35-24&lasttime=113-7-19-15-58-57&type=1&charset=UTF-8&timezone=-8&return1=15
		*/
		$this->ip=ip2long(get_client_ip(1));
		$this->pageurl=I("pageurl");
		$this->referer=I("referer");	//
		$this->language=I("language");
		$this->color=I("color");
		$this->screensize=I("screensize");
		$this->firsttime=I("firsttime");
		$this->lasttime=I("lasttime");
		$this->timezone=I("timezone");
		
		//读取是否第一次入账(30分钟默认为一个新客户)
		$map["ip"]=array("EQ",$this->ip);
		$map["language"]=array("EQ",$this->language);
		$map["intime"]=array("EGT",strtotime("-30 minutes"));
		
		$bid=$this->dao->where($map)->getField("id");
		$data=array();
		if(empty($bid)){
			$data["ip"]=$this->ip;
			$data["language"]=$this->language;
			$data["color"]=$this->color;
			$data["screensize"]=$this->screensize;
			$data["timezone"]=$this->timezone;
			$data["intime"]=time();
			$bid=$this->dao->add($data);
			unset($data);
			$data["isfirst"]=1;
		}
			
			$data["bid"]=$bid;
			$data["pageurl"]=$this->pageurl;
			$data["referer"]=$this->referer;
			$frominfo=$this->getKeyWord($this->referer);
			$data["fromsearch"]=$frominfo[0];
			$data["keywords"]=$frominfo[1];
			
			$did=M("visit_pvdata")->where($data)->getField("id");
			if(!$did){
				$data["pvnum"]=1;
				$data["inpvtime"]=time();		
				M("visit_pvdata")->add($data);
			}else{
				M("visit_pvdata")->where("id=$did")->setInc("pvnum");
			}
			$this->dao->where("id=$bid")->setInc("pvnum");
			$this->dao->where("id=$bid")->setField("lasttime",time());
	}
	
	function getKeyWord($referurl)
		{

			$domainName = $referurl;
			$refererUrl = $referurl;
			$fromsearch="";
			if( strstr( $domainName, 'baidu.com') )
			{
				preg_match( "|baidu.+wo?r?d=([^\&]*)|is", $refererUrl, $tmp );
				$keyWord = urldecode( $tmp[1] );
				$fromsearch="百度";
			}
			else if( strstr( $domainName, 'google.') )
			{
				preg_match( "|google.+q=([^\&]*)|is", $refererUrl, $tmp );
				if( stristr( $refererUrl, 'gb2312' ) )
				{
					$keyWord = urldecode( $tmp[1] );
				}
				else 
				{
					$keyWord = utf82gb2312( urldecode( $tmp[1] ) );
				}
				$fromsearch="谷歌";
			}
			else if( strstr( $domainName, 'sohu.com') )
			{
				preg_match( "|sohu.+query=([^\&]*)|is", $refererUrl, $tmp );
				$keyWord = urldecode( $tmp[1] );
				$fromsearch="搜狐";
			}
			else if( strstr( $domainName, 'sina.com.cn') )
			{
				preg_match( "|sina.+searchkey=([^\&]*)|is", $refererUrl, $tmp );
				$keyWord = urldecode( $tmp[1] );
				$fromsearch="新浪";
			}
			else if( strstr( $domainName, '163.com') )
			{
				preg_match( "|163.+q=([^\&]*)|is", $refererUrl, $tmp );
				$keyWord = urldecode( $tmp[1] );
				$fromsearch="163";
			}
			else if( strstr( $domainName, 'yahoo.com') )
			{
				preg_match( "|yahoo.+p=([^\&]*)|is", $refererUrl, $tmp );
				if( stristr( $refererUrl, 'gb2312' ) )
				{
					$keyWord = urldecode( $tmp[1] );
				}
				else 
				{
					$keyWord = utf82gb2312( urldecode( $tmp[1] ) );
				}
				$fromsearch="雅虎";
			}
			else if( strstr( $domainName, 'lycos.com') )
			{
				preg_match( "|lycos.+query=([^\&]*)|is", $refererUrl, $tmp );
				$keyWord = urldecode( $tmp[1] );
				$fromsearch="lycos";
			}
			else if( strstr( $domainName, '3721.com') )
			{
				preg_match( "|3721.+p=([^\&]*)|is", $refererUrl, $tmp );
				$keyWord = urldecode( $tmp[1] );
				$fromsearch="3721";
			}
			else if( strstr( $domainName, 'qq.com') )
			{
				preg_match( "|qq.+word=([^\&]*)|is", $refererUrl, $tmp );
				$keyWord = urldecode( $tmp[1] );
				$fromsearch="qq";
			}
			else if( strstr( $domainName, 'tom.com') )
			{
				preg_match( "|tom.+word=([^\&]*)|is", $refererUrl, $tmp );
				$keyWord = urldecode( $tmp[1] );
				$fromsearch="tom";
			}
			else if( strstr( $domainName, '21cn.com') )
			{
				preg_match( "|21cn.+word=([^\&]*)|is", $refererUrl, $tmp );
				$keyWord = urldecode( $tmp[1] );
				$fromsearch="21cn";
			}
			else if( strstr( $domainName, 'sogou.com') )
			{
				preg_match( "|sogou.+query=([^\&]*)|is", $refererUrl, $tmp );
				$keyWord = urldecode( $tmp[1] );
				$fromsearch="搜狗";
			}
			else if( strstr( $domainName, 'aol.com') )
			{
				preg_match( "|aol.+query=([^\&]*)|is", $refererUrl, $tmp );
				$keyWord = urldecode( $tmp[1] );
				$fromsearch="ao1";
			}



			return array($fromsearch,$keyWord);
		}
		
	
}
?>