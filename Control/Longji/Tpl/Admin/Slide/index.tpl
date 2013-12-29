<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>幻灯片管理</title>
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.form.js"></script>
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">
	<div class="main_h2">
	<h2>幻灯片管理</h2>
    <div id="m_h_right"></div>
    </div>
<form name="data_form" id="data_form" method="POST" action="{:U('databackup')}">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
       	<th width="100">FLASHID</th>
    <th width="180" >标题</th>
    <th width="90">图片数</th>
    <th width="300">调用</th>
    <th width="230">操作</th>
      </tr>
	    
     <volist name="list" id="rs">
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
		<td class="td_center">{$rs.id}</td>
    <td class="td_left">&nbsp;&nbsp;&nbsp;{$rs.name}</td>
    <td class="td_center">{$rs.num}</td>
    <td class="td_center"><b><<font color="#990000">LJ:flash</font> <font color="#FF0000">flashid="{$rs.id}"</font> /></b></td>
    <td class="td_center"><a href="{:U('listpic','fid='.$rs[id])}">图片管理</a> <a href="{:U('add','id='.$rs[id])}" title="编辑该模型">编辑</a> 删除</td>
		</tr>
			
        </volist>
       
	     <tr>
         <td colspan="5" class="td_left">
         <button class="btn02" type="button" onclick="location.href='{:U('add')}'">新增幻灯片</button>
         </td>
         </tr>
      </tbody></table>
    </form>
	</div>
    <div></div>
</div>
</body>
</html>