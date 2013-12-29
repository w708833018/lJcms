<?php

class ContactAction extends Action{

    public function index()
    {
    	$cmd=I("cmd","");
    	switch($cmd){
    		case "search":
    			$keyword=I("post.keyword");
				$map["isself"]=1;
				
				if($keyword){
		    		$map["message"]=array("like","%$keyword%");
		    	}
    			break;
    		case "del":
    		
    			break;
    	}

		$order="id";
		$count = M("contact")->where ($map)->count();		
		import ( "@.ORG.Page" );		
		$page = new Page ( $count,10 );		
		$slist = M("contact")->where($map)->order( "`" . $order . "` asc")->limit($page->firstRow . ',' . $page->listRows)->select();	
		$show = $page->show ();
				
		$this->assign ( 'slist', $slist );
		$this->assign ( 'pages', $show );
		$this->assign('keyword',$keyword);
    	$this->display();
    }
    
    
    public function editmessage()
    {
    
    	$id=I("id",0);
    	
    	if($id)
    	{
    		$data=M("contact")->where("id=$id")->find();
    		$this->assign($data);
    	}
    	$this->display();
    }
    
  public function deletemessage()
  {
  	
  		$id=I("id",0);
  	
  		$isok=M("contact")->where("id=$id")->delete();
  		if(!$isok)
  		{
  			$this->error("删除信息失败",U("Contact/index"));
  		}
  		$this->success("删除信息成功",U("Contact/index"));
  }
    
    
    
    
    
}
?>