

/*
 *
 *全局变量定义开始
 *
 */
	var plays		=0;
	var state 	=0;

/*
 *
 *效果启动开始
 *
 */
window.onload=function()
 {
 	slide_start();//焦点广告启动方法
 }
 
function slide_start()
 {
  if(verify())
   {
   	slideSize();
   	styleAll();
   	pagenum();
		slideplay();
	  switch(config.isOnMouse)
	  {
	  	case 0: 
	  		{
	  		if(config.isPlay=="off"){slideClick();}
	  		return false;
	  		break;
	  		}
	  	
	  	case 1: slideClick();
	  	break;
	  	
	  	case 2: slideHover();
	  	break;
	  }
   }
   
 } 

function verify()
{
	if(verify_Ms() && verify_Width())
	{
		return true;
	}
}

function verify_Ms()
{
	if(config.Ms < config.fadeInMs) 
	{
		alert("幻灯片切换秒数小于渐显时间,\r\n\r\n请修改配置文件!");
		return false;
	}
	else
	{
		return true;
	}

}

function verify_Width()
{
	if(config.isStTitle == "on") //是否允许自动调整标题的宽度
	{
		
		$("#slideTitle").css("width",config.width - parseInt($("#"+config.dlID +" .pageNum:eq(0)").css("right")) + 17);
		return true;
	}
	else
	{
		if((config.width - parseInt($("#"+config.dlID +" .pageNum:eq(0)").css("right")) + 17) < config.stTitle)
		{
			alert("幻灯片标题宽度不能大于总宽度减去页码的总宽度");
			return false;
		}
		else
		{
			return true;
		}
	}
}

function styleAll()
 {
 	
 	 if(config.isDtInnerTags == "a")
 	 {
 	 		if(config.isDtInnerTagsNewOpen == 0)
		{
			$("#"+config.dlID+" dt").html("<a id=\"slideTitle\" target=\"_self\"></a>");
		}
		else if
		(config.isDtInnerTagsNewOpen == 1)
		{
			$("#"+config.dlID+" dt").html("<a id=\"slideTitle\" target=\"_blank\"></a>");
		}
 	 }
 	 else if(config.isDtInnerTags == "span")
	{
		$("#"+config.dlID+" dt").html("<span id=\"slideTitle\"></span>");
	}
 }

function slideSize()
{
	if(config.isImgSize == "on")
	{
		$("#"+config.dlID+",#"+config.dlID+" dd img").css({width:""+config.width+"px",height:""+config.height+"px"});
	} 
	else
	{
		$("#"+config.dlID).css({width:config.width+"px",height:config.height+"px"});
	}
	$("#"+config.dlID +" dt").css({"background":"#" + config.stTitleBg,"opacity":config.stTitleOpacite});
}

function pagenum()
 {	
 	for(var i=1;i<=$("#"+config.dlID+" dd").length;i++) 
 	{
 		$("#"+config.dlID+" dt").html($("#"+config.dlID+" dt").html()+"<a class=\"pagenum\">"+i+"</a>");	
 	}
 		
  for(var i=$("#"+config.dlID+" dd").length-1;i>=0;i--)
  {
  	$("#"+config.dlID+" .pagenum").eq(i).css("right",""+config.rightPitch+"px");
 		config.rightPitch = config.rightPitch+(17+config.pitch);
  }
 }

function slideplay()
 {
 	animation();
 	if(config.isPlay == "on")
   {
  	setTimeout("slideplay()",config.Ms);
   }
  else
   {
  	 return false;
   }		
 }

function animation()
 {	
 	effects();
 	$("#"+config.dlID+" .pagenum").eq(plays).attr("class",$("#"+config.dlID+" .pagenum").eq(plays).attr("class")+" "+config.pageNumBg+"");	
 	plays +=1;
 	if(plays == $("#"+config.dlID+" .pagenum").length){ plays =0;}	
 }

function effects()
 {
 	var ddimg = $("#"+config.dlID+" dd img");
 	titleEffects(plays);
 	if(state ==0){
 		ddimg.fadeOut();
 		ddimg.eq(plays).fadeIn(config.fadeInMs);
		
 	}else{
 		ddimg.hide();
		ddimg.eq(plays).show();
 	}
 	$("#"+config.dlID+" .pagenum").attr("class","pagenum"); //切换按钮效果
 	state = 0;
 }

function slideClick()
 {
 	$("#"+config.dlID+" .pagenum").click
 	(
 		function()
 		{
 			plays =parseInt($(this).text())-1;
 			if(config.isSlideMouseEffects == "off"){state = 1;}
 			animation();
 		}
 	)
 }

function slideHover()
 {
 	$("#"+config.dlID+" .pagenum").mouseover
 	(
 		function()
 		{
 			plays = parseInt($(this).text()-1);
 			timeout = setTimeout
 			(
	 			function()
	 			{
	 				plays=plays;
	 				if(config.isSlideMouseEffects == "off"){state = 1;}
		 			animation();
	 			},config.hoverMs
 			);				
 		}
 	).mouseout
 	(
 		function()
 		{
 			clearTimeout(timeout);
 			plays=plays;
 		}
 	);
 }

function titleEffects(num)
 {
 	if(config.isSlideTitle == "on")
 	{
	 		$("#slideTitle").animate(
	 		{top:2,width:config.stTitle+"px"},config.isSlideTitleMs,
	 		function(){
					$(this).text($("#"+config.dlID+" dd img").eq(num).attr("alt"));
					$(this).attr("href",$("#"+config.dlID+" dd a").eq(num).attr("href"));				
				}
	 		)
 	}
 	else
 		{ $("#slideTitle").html($("#"+config.dlID+" dd img:eq("+ num +")").attr("alt"));}
 	}
 