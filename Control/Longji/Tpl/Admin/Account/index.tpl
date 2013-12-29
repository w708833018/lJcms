<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台账号管理</title>
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.form.js"></script>
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">
	<div class="main_h2">
	<h2>账号管理</h2>
    <div id="m_h_right"></div>
    </div>
<form name="data_form" id="data_form" method="POST" action="{:U('databackup')}">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
       	<th width="100">编号</th>
    <th width="180" >账号</th>
    <th width="220">最后登录时间</th>
    <th width="140">最后登录IP</th>
    <th width="100">登录次数</th>
    <th width="80">状态</th>
    <th width="80">操作</th>
      </tr>
	    
     <volist name="list" id="rs">
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
		<td class="td_center">{$rs.id}</td>
    <td class="td_left">&nbsp;&nbsp;&nbsp;{$rs.username}</td>
    <td class="td_left">{$rs.lastlogin|toDate=###}</td>
    <td class="td_left">{$rs.lastip|long2ip=###}</td>
    <td class="td_left">{$rs.logintimes}</td>
    <td class="td_center">{$rs.status|M_S=###}</td>
    <td class="td_center"> <a href="{:U('add','id='.$rs[id])}" title="编辑该模型">编辑</a> 删除</td>
		</tr>
			
        </volist>
       
	     <tr>
         <td colspan="7" class="td_left">
         <button class="btn02" type="button" onclick="location.href='{:U('add')}'">新增账号</button>
         </td>
         </tr>
      </tbody></table>
    </form>
	</div>
    <div></div>
</div>
</body>
</html>