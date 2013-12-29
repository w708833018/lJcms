<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>菜单管理</title>
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
	<h2>菜单管理</h2>
    <div id="m_h_right"></div>
    </div>
<form name="data_form" id="data_form" method="POST" action="{:U('')}">
	<input type="hidden" name="cmd" value="order" />
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
      	<th>排序</th>
        <th>菜单名称</th>
        <th>模型</th>
        <th>动作</th>
        <th width="90">访问</th>
        <th>状态</th>
        <th>操作</th>
      </tr>
	    
     <volist name="list" id="vo">
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
     	<td class="td_center"><input type="hidden" name="id[]" id="id_{$vo.id}"  value="{$vo.id}" /><input type="text" name="listorder[]" value="{$vo.listorder}" class="input1" size="3" maxlength="3"/></td>
		<td class="td_left">&nbsp;{$vo.title}</td>
        <td>&nbsp;&nbsp;{$vo.module}</td>
        <td>{$vo.action}</td>
        <td align="center"><a href="#">访问</a></td>       
        <td align="center"><a href="{:U('','cmd=status&id='.$vo[id].'&status='.$vo[status])}"><if condition="$vo[status] egt 1">显示<else />隐藏</if></a></td>
        <td align="center"><a href="{:U('add','id='.$vo[id])}">编辑</a> <a href="#">删除</a> <a href="{:U('add','pid='.$vo[id])}">新增</a></td>
		</tr>
			<volist name="vo[child]" id="vo1">
            	<tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
                    <td class="td_center"><input type="hidden" name="id[]" id="id_{$vo1.id}" value="{$vo1.id}" /><input type="text" name="listorder[]" value="{$vo1.listorder}" class="input1" size="3" maxlength="3"/></td>
                    <td class="td_left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|--&nbsp;&nbsp;&nbsp;{$vo1.title}</td>
                    <td>&nbsp;&nbsp;{$vo1.module}</td>
                    <td>{$vo1.action}</td>
                    <td align="center"><a href="#">访问</a></td>       
                    <td align="center"><a href="{:U('','cmd=status&id='.$vo1[id].'&status='.$vo1[status])}"><if condition="$vo1[status] egt 1">显示<else />隐藏</if></a></td>
                    <td align="center"><a href="{:U('add','id='.$vo1[id])}">编辑</a> 删除 <a href="{:U('add','pid='.$vo1[id])}">新增</a></td>
                 </tr>
                     <volist name="vo1[child]" id="vo2">
                            <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
                                <td class="td_center"><input type="hidden" name="id[]" id="id_{$vo2.id}"  value="{$vo2.id}" /><input type="text" name="listorder[]" value="{$vo2.listorder}" class="input1" size="3" maxlength="3"/></td>
                                <td class="td_left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|--&nbsp;&nbsp;&nbsp;{$vo2.title}</td>
                                <td>&nbsp;&nbsp;{$vo2.module}</td>
                                <td>{$vo2.action}</td>
                                <td align="center"><a href="#">访问</a></td>       
                                <td align="center"><a href="{:U('','cmd=status&id='.$vo2[id].'&status='.$vo2[status])}"><if condition="$vo2[status] egt 1">显示<else />隐藏</if></a></td>
                                <td align="center"><a href="{:U('add','id='.$vo2[id])}">编辑</a> 删除 <span>新增</span></td>
                             </tr>
                	</volist>
            </volist>
        </volist>
       <tr>
       <td colspan="7" class="td_left"><button type="submit" class="btn01">保存排序</button></td>
       </tr>
	     
      </tbody></table>
    </form>
	</div>
    <div></div>
</div>
</body>
</html>