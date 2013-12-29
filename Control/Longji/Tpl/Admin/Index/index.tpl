<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/artDialog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="__BJS__/editor.js"></script>
<title>龙吉网络E建站系统 - 授权：{$site_name}</title>
<script>
$(document).ready(function(e) {
    $("#cglang").click(function(){
		cg_language('选择要编辑的语言：',"{:U('Ajax/setlanguage')}");
		});
});
</script>
</head>
<body>

<div id="header">
  <div id="logo"><img src="__PUBLIC__/images/logo.gif" /></div>
  <div id="header_r"><font color="#FF9900">网站语言：<b>{$lang}</b></font> <span style="cursor:pointer;" id="cglang">切换</span><br />欢迎您 <font color="#FF9900"><b>{:cookie("username")}</b></font> | <a href="{:U('System/editpass')}" target="main">修改密码</a> | <a href="{:U('System/main')}" target="main">管理主页</a> | <a href="{:U('clear')}" target="main">清理缓存</a> | <a href="{:U('Home/Index/index')}" target="_blank">网站主页</a> | <a href="{:U('Login/out')}" target="_top">退出登录</a></div>
</div>

<div id="content">

    <div class="menu" id="menu_box">
        <div id="menu">
        <Volist name="Menu_list" id="vo" key="k">
        {if $vo['status']>0}
        <php>
        if($vo['module']!='Tool'){
        	$show=true;
        }else{
        	if($mygroupid>=9){
            	$show=true;
            }else{
            	$show=false;
            }
        }
        </php>
        
        {if $show}
        <h4 id="mh_{$vo.id}" class='menu_title<if condition="$k elt 1">_dis</if>' id="mt_{$vo.id}" onclick="do_menu({$vo.id})" title="{$vo.remark}">{$vo.title}</h4>
        <ul id="mb_{$vo.id}" class="menu_body" <if condition="$k gt 1">style="display:none"</if>>
          <Volist name="vo['child']" id="vo1">
          {if $vo1[status]>0}
          <li>
          <a href="{:U($vo1['module'].'/'.$vo1['action'],$vo1['url'])}" target="main" title="{$vo1.remark}">{$vo1.title}</a>
          <Volist name="vo1['child']" id="vo2">
          {if $vo2[status]>0}
          &nbsp;|&nbsp;<a href="{:U($vo2['module'].'/'.$vo2['action'],$vo2['url'])}" target="main" title="{$vo2.remark}">{$vo2.title}</a>
          {/if}
          </Volist>
          </li>
          {/if}
          </volist>
        </ul>
        {/if}
        {/if}
        </volist>        
        </div>
    </div>
    
    <div class="main" id="body_box">
        <iframe id="main" name="main" frameborder="0" src="{:U('System/config')}"></iframe>
    </div>

</div>
<script type="text/javascript">
<!--
var winHeight=0;
function findDimensions() //函数：获取尺寸
{
	winHeight=document.documentElement.clientHeight;
	winWidth=document.documentElement.clientWidth;
	var height = winHeight - 60;
	var width = winWidth - document.getElementById("menu_box").offsetWidth;	
	document.getElementById("content").style.width = winWidth+"px";
	document.getElementById("content").style.height = height+"px";
	document.getElementById("menu_box").style.height = height+"px";
	document.getElementById("menu_box").style.background = 'url(__PUBLIC__/images/left_bg.gif) right repeat-y';	
	document.getElementById("body_box").style.width = width+"px";	
	document.getElementById("body_box").style.height = height+"px";
}
findDimensions();
window.onresize=findDimensions;
//-->

function do_menu(id)
{
	menulist=$("#menu ul");
	menuh4list=$("#menu h4");
	for(i=0;i<menulist.length;i++){
				
					$(menulist[i]).hide("fast");
					$(menuh4list[i]).removeClass("menu_title_dis");
					$(menuh4list[i]).addClass("menu_title");
				
		}
	$("#mb_"+id).show("fast");
	$("#mh_"+id).removeClass("menu_title");
	$("#mh_"+id).addClass("menu_title_dis");

}

$(function(){
    $('#menu li a').click(function(){
        $("#menu li a").each(function(){
            $(this).removeClass();
        });         
        $(this).addClass("menu_li_a_hover");
    });
});

</script>
</body>
</html>