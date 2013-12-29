<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>模型管理</title>
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.form.js"></script>
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
    
function selectall(name) {
	if ($("#check_box").attr("checked")) {
		$("input[name='"+name+"']").each(function() {
			this.checked=true;
		});
	} else {
		$("input[name='"+name+"']").each(function() {
			this.checked=false;
		});
	}
}

//Ajax备份


</script>
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">
	<div class="main_h2">
	<h2>模型管理</h2>
    <div id="m_h_right"></div>
    </div>
<form name="data_form" id="data_form" method="POST" action="{:U('sort')}">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
        <th width="60">编号</th>
    <th width="75">表名</th>
    <th width="180">标题</th>
    <th>详细介绍</th>
    <th width="60">状态</th>
    <th width="160">操作</th>
      </tr>
	    
     <volist name="list" id="rs">
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
		<td class="td_center">{$rs.id}</td>
    <td class="td_center">{$rs.name}</td>
    <td class="td_center">{$rs.title}</td>
    <td class="td_left">{$rs.demo}</td>
    <td class="td_center"><a href="{:U('','cmd=status&status='.$rs['status'])}">{$rs.status|m_s=###}</a></td>
    <td class="td_center"><a href="{:U('Field/modulefieldrefresh','mid='.$rs['id'])}">刷新</a> <a href="{:U('Field/index','mid='.$rs['id'])}">字段</a> <a href="{:U('add','id='.$rs[id])}" title="编辑该模型">编辑</a></td>
		</tr>
			
        </volist>
       
	     
      </tbody></table>
    </form>
	</div>
    <div></div>
</div>
</body>
</html>