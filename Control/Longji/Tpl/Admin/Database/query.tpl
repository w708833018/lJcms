<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>执行SQL语句</title>
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="main">
  <div class="main_box">
	<div class="main_h2">
	<h2>执行SQL语句</h2>
    <div id="m_h_right">
    </div>
    </div>
<form name="data_form" id="data_form" method="POST" action="{:U('doquery')}">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
	    
       
       <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
         <td colspan="2" class="td_left">&nbsp;
         <p>提示：</p>
         <p>1.读取表头请用{pre}代替！</p>
         <p>2.可同时执行多条语句，每行一条</p>
		 <p>3.SQL执行后影响到的结果不可恢复，请谨慎使用此功能</p>
		 <p>4.若数有重要数据，请在执行SQL语句前备份数据库，以免数据丢失<br></p>
         &nbsp;
         </td>
         </tr>
       <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
         <td width="120" class="td_right">
         要执行的SQL语句：
         </td>
         <td class="td_left"><textarea name="sql"  id="sql" style="width:500px; height:200px;margin:8px; border:1px #ddd solid;">SELECT * FROM {pre}config LIMIT 0,10;</textarea></td>
         </tr>
       
	   <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
       <td colspan="2" class="td_left">
       &nbsp;&nbsp;<button class="btn02" type="submit">执行</button>
       &nbsp;<button class="btn02" type="button" onclick="location.href='{:U('index')}';">备份数据库</button>
       &nbsp;<button class="btn02" type="button" onclick="location.href='{:U('recover')}'">欢原数据库</button>
       </td>
       </tr>
       
      </tbody></table>
    </form>
	</div>
    <div></div>
</div>
</body>
</html>