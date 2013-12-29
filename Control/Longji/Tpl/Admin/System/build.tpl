<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<load href="__CSS__/Jquery.form.css" />
<script>
$(document).ready(function(e) {
    $("#bindex").click(
		function(){
			$("#loading").show();
			$("#showc").html("正在生成中，请稍后.......");
			$.post(
				"{:U('Home/Build/buildIndex')}",
				{langid:'<php>echo $langid</php>'},
				function(data){
					$("#loading").hide("slow");
					$("#showc").html(data.content);
				});
		}
	);
	
	$("#blist").click(
		function(){
			$("#loading").show();
			$("#showc").html("正在生成中，请稍后.......");
			$.post(
				"{:U('Home/Build/buildList')}",
				{langid:'<php>echo $langid</php>'},
				function(data){
					$("#loading").hide("slow");
					$("#showc").html(data.content);
				});
		}
	);
	
	
});
</script>
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>一键生成静态页面</h2>
    <div id="m_h_right"></div>
    </div>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
 <tr>
  <td  width="120" class="td_right">生成首页面：</td>
  <td class="td_left"><button class="btn02" id="bindex">生成首页</button>
    </td>
  </tr>
  <tr>
  <td class="td_right">生成内容页：</td>
  <td class="td_left"><button class="btn02" id="bshow">生成内容页</button>
    </td>
  </tr>
  
   <tr>
  <td class="td_right">生成列表页：</td>
  <td class="td_left"><button class="btn02" id="blist">生成列表页</button>
    </td>
  </tr>
  
    </tbody></table>
  
	
    <div style=" margin-top:15px; padding:30px;" id="showc">
	
	</div>
    
	</div>
</div>

</body>
</html>
