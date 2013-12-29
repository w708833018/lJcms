<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>模型字段管理</title>
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
	<h2>模型[{$moduleinfo[name]}]&nbsp;字段管理</h2>
    <div id="m_h_right"></div>
    </div>
<form name="data_form" id="data_form" method="POST" action="{:U('sort')}">
	<input type="hidden" name="mid" value="{$mid}">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
        <th width="60">排序</th>
    <th width="120">字段名</th>
    <th>字段别名</th>
    <th width="80">字段类型</th>
    <th width="60">前台</th>
    <th width="60">后台</th>
    <th width="120">操作</th>
      </tr>
	    
     <volist name="list" id="rs">
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
		<td class="td_center"><input type="hidden" name="id[]" value="{$rs.id}" /><input type="text" name="listorder[]" id="listorder_{$rs.id}" value="{$rs.listorder}" class="inpt_1" size="3" maxlength="3"/></td>
    <td class="td_left">{$rs.field}</td>
    <td  class="td_left"><input type="text" name="name[]" id="name_{$rs.id}" value="{$rs.name}" class="inpt_1" size="30" maxlength="30"/></td>
    <td class="td_center">{$rs.type}</td>
    <td class="td_center">{$rs.ispost|m_s=###,array('<font color="red">禁止</font>','正常')}</td>
    <td class="td_center">{$rs.status|m_s=###,array('<font color="red">禁止</font>','正常')}</td>
    <td class="td_center"><a href="{:U('add','id='.$rs[id])}" title="编辑该模型">编辑</a> | <a href="#">移除</a> </td>
		</tr>
			
        </volist>
       
	     <tr>
         <td colspan="7" class="td_left">
         <button class="btn02" type="submit">保存排序</button>
         <button class="btn02" type="button" onclick="location.href='{:U('add','mid='.$mid)}'">新增字段</button>
         <button class="btn04" type="button" onclick="location.href='{:U('modulefieldrefresh','mid='.$mid)}'">刷新模型</button>
         </td>
         </tr>
      </tbody></table>
    </form>
	</div>
    <div></div>
</div>
</body>
</html>