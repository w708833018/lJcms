<?php
class VisitAction extends AdminAction{
	protected $dao;
	public $js_url;
	
	public function _initialize(){
		parent::_initialize();
		$this->js_url='__COUNTJS__';
	}
	
	public function index(){
		$M=M("visit_data");
		$this->assign("js_url",$this->js_url);
		
		//��ȡ����
		$ipall=$M->count();
		$pvall=$M->Sum("pvnum");
		
		$this->assign("ipall",$ipall);
		$this->assign("pvall",$pvall?$pvall:0);
		
		
		//��ȡ����
		$map=array();
		$map["intime"]=array(
			array("EGT",strtotime(Date("Y-m-d")." 0:0:0")),
			array("ELT",strtotime(Date("Y-m-d")." 23:59:59"))
		);
		$todayip=$M->where($map)->count();
		$todaypv=$M->where($map)->Sum("pvnum");
		$this->assign("todayip",$todayip);
		$this->assign("todaypv",$todaypv?$todaypv:0);
		
		//��ȡ����
		$yesterday=Date("Y-m-d",strtotime("-1 days"));
		unset($map);
		$map["intime"]=array(
			array("EGT",strtotime($yesterday." 0:0:0")),
			array("ELT",strtotime($yesterday." 23:59:59"))
		);
		$yesdayip=$M->where($map)->count();
		$yesdaypv=$M->where($map)->Sum("pvnum");
		$this->assign("yesdayip",$yesdayip);
		$this->assign("yesdaypv",$yesdaypv?$yesdaypv:0);
		
		//��ȡ����
		$monthlastday=Date("Y-m")."-".Date("t",strtotime(Date("Y-m-d")));
		$monthfirstday=Date("Y-m")."-1";
		
		unset($map);
		$map["intime"]=array(
			array("EGT",strtotime($monthfirstday." 0:0:0")),
			array("ELT",strtotime($monthlastday." 23:59:59"))
		);
		$monthip=$M->where($map)->count();
		$monthpv=$M->where($map)->Sum("pvnum");
		$this->assign("monthip",$monthip);
		$this->assign("monthpv",$monthpv?$monthpv:0);
		
		
		$this->display();
	}
	
	
	public function detail(){
		$pre_head=C("DB_PREFIX");
		$this->dao=new Model();
		$table=$pre_head."visit_data as a,".$pre_head."visit_pvdata as b";
		
		$map["_string"]="a.id=b.bid";
		
		import("@.ORG.Page");
		$count      = $this->dao->where($map)->count();//��ѯ����Ҫ����ܼ�¼�� $map��ʾ��ѯ����
		$Page       = new Page($count,15);// ʵ������ҳ�� �����ܼ�¼��
		$show       = $Page->show();// ��ҳ��ʾ���
		// ���з�ҳ���ݲ�ѯ��
		$list = $this->dao->table($table)->where($map)->order('b.id desc')->field("b.*,a.ip")->limit($Page->firstRow.','.$Page->listRows)->select();
		
		$this->assign("list",$list);
		$this->assign("pages",$show);
		$this->display();
	}
	
	
	//�����ؼ���
	function keyword()
	{
		$M=M("visit_pvdata");
		import("@.ORG.Page");

		$count=$M->count();
		$Page= new Page($count,12);// ʵ������ҳ�� �����ܼ�¼��
		$show= $Page->show();// ��ҳ��ʾ���
		// ���з�ҳ���ݲ�ѯ��
		$list = $M->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();
	
		$this->assign("klist",$list);
		$this->assign("pages",$show);
		
		$this->display();
	}
	
	//���߿ͻ�
	public function online()
	{
		$M=M("visit_data");
		$this->assign("js_url",$this->js_url);
		
		//��ȡ����
		$ipall=$M->count();
		$pvall=$M->Sum("pvnum");
		
		$this->assign("ipall",$ipall);
		$this->assign("pvall",$pvall?$pvall:0);
		
		//��ȡ����
		$yesterday=Date("Y-m-d",strtotime("-1 days"));
		unset($map);
		$map["intime"]=array(
			array("EGT",strtotime($yesterday." 0:0:0")),
			array("ELT",strtotime($yesterday." 23:59:59"))
		);
		$yesdayip=$M->where($map)->count();
		$yesdaypv=$M->where($map)->Sum("pvnum");
		$this->assign("yesdayip",$yesdayip);
		$this->assign("yesdaypv",$yesdaypv?$yesdaypv:0);
		
		//��ȡ����
		$monthlastday=Date("Y-m")."-".Date("t",strtotime(Date("Y-m-d")));
		$monthfirstday=Date("Y-m")."-1";
		
		unset($map);
		$map["intime"]=array(
			array("EGT",strtotime($monthfirstday." 0:0:0")),
			array("ELT",strtotime($monthlastday." 23:59:59"))
		);
		$monthip=$M->where($map)->count();
		$monthpv=$M->where($map)->Sum("pvnum");
		$this->assign("monthip",$monthip);
		$this->assign("monthpv",$monthpv?$monthpv:0);
		
		//��ȡ����
		$map=array();
		$map["intime"]=array(
			array("EGT",strtotime(Date("Y-m-d")." 0:0:0")),
			array("ELT",strtotime(Date("Y-m-d")." 23:59:59"))
		);
		$todayip=$M->where($map)->count();
		$todaypv=$M->where($map)->Sum("pvnum");
		$this->assign("todayip",$todayip);
		$this->assign("todaypv",$todaypv?$todaypv:0);
		
		//30���������߿ͻ�
		$nowtime=date("Y-m-d H:i:s");
		//echo date('Y-m-d H:i:s',strtotime("$nowtime-30 minute"))."</br>";
		$lasttime= date(strtotime("$nowtime-30 minute"));
		$countip=$M->where("lasttime<$lasttime")->count('distinct ip');
		$this->assign("countip",$countip);
		$this->display();
	}
	
	//��·����
	public function area()
	{
		import("@.ORG.Page");
		$count=M("visit_data")->count();
		$Page= new Page($count,12);
		$show= $Page->show();
		$alist = M("visit_data")->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();
		import("@.ORG.IpLocation");
		$Ip = new IpLocation('UTFWry.dat');
		
		foreach($alist as $key=>$value)
		{
			$alist[$key]["ip"]=long2ip($value["ip"]);
			$area = $Ip->getlocation($alist[$key]["ip"]);
			$info =  iconv('gbk','utf-8',$area['country'].$area['area']);
			$this->assign("info",$info);
		};
		
		$this->assign("alist",$alist);
		$this->assign("pages",$show);
		
		$this->display();
		return $area;
	}
	
	//��·�����
	function browser()
	{
		import("@.ORG.Page");
		$count=M("visit_data")->count();
		$Page= new Page($count,12);
		$show= $Page->show();
		
		$blist=M("visit_data")->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign("blist",$blist);
		$this->assign("pages",$show);
		
		$this->display();
	}
	
	
	//��������
	public function soso()
	{
		import("@.ORG.Page");
		$count=M("visit_pvdata")->count();
		$Page= new Page($count,12);
		$show= $Page->show();
		$slist = M("visit_pvdata")->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();
		
		$this->assign("slist",$slist);
		$this->assign("pages",$show);
		
		$this->display();
	}
	
}