<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>栏目管理</title>
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.form.js"></script>
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">
	<div class="main_h2">
	<h2>栏目管理</h2>
    <div id="m_h_right"></div>
    </div>
<form name="myform" id="myfrm" method="POST" action="{:U('sort')}">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
        <th width="70">排序</th>
    <th width="50">编号</th>
    <th>栏目名称</th>
    <th width="80">模型</th>
    <th width="60">导航</th>
    <th width="60">访问</th>
    <th width="220">修改</th>
      </tr>
	  
      
      <volist name="list" id="rs">
<if condition="$rs['parentid'] eq 0">
<tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
	<td class="td_center"><input type="hidden" name="id[]" value="{$rs.id}" /><input type="text" name="listorder[]" value="{$rs.listorder}" size="3" maxlength="3" class="inpt_1" /></td>
    <td class="td_left">{$rs.id}</td>
    <td class="td_left">{$rs.catname}</td>
    <td class="td_center">{$modules[$rs[moduleid]][title]}</td>
    <td class="td_center">{$rs.ismenu|m_s=###,array('<font color="red">隐藏</font>','显示')}</td>
    <td class="td_center"><a href="{$rs.url}" target="_blank">访问</a></td>
    <td class="td_center"><a href="{:U('add','parentid='.$rs['id'])}">子栏目</a> | {if $modules[$rs['moduleid']][lgtypes]=='page'}<a href="{:U($rs['module'].'/add','id='.$rs['id'])}">修改内容</a>{else}<a href="{:U($rs['module'].'/add','catid='.$rs['id'])}" title="新增内容"><font color="#0000FF">添加内容</font></a>{/if} | <a href="{:U('add','id='.$rs[id])}" title="编辑该模型">编辑</a> | 删除</td>
</tr>
    <volist name="rs['child']" id="rs1">
    <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
        <td class="td_center"><input type="hidden" name="id[]" value="{$rs1.id}" /><input type="text" name="listorder[]" value="{$rs1.listorder}" size="3" maxlength="3" class="inpt_1" /></td>
        <td class="td_left">{$rs1.id}</td>
        <td class="td_left">&nbsp;&nbsp;&nbsp;&nbsp;|--{$rs1.catname}</td>
        <td class="td_center">{$modules[$rs1[moduleid]][title]}</td>
        <td class="td_center">{$rs1.ismenu|m_s=###,array('<font color="red">隐藏</font>','显示')}</td>
        <td class="td_center"><a href="{$rs1.url}" target="_blank">访问</a></td>
        <td class="td_center"><a href="{:U('add','parentid='.$rs1['id'])}">子栏目</a> | {if $modules[$rs1['moduleid']][lgtypes]=='page'}<a href="{:U($rs1['module'].'/add','id='.$rs1['id'])}">修改内容</a>{else}<a href="{:U($rs1['module'].'/add','catid='.$rs1['id'])}" title="新增内容"><font color="#0000FF">添加内容</font></a>{/if} | <a href="{:U('add','id='.$rs1[id])}" title="编辑该模型">编辑</a> | <a href="{:U('','cmd=del&id='.$rs1['id'])}" onclick="return confirm('您确定要删除该栏目？')">删除</a></td>
    </tr>
    	<volist name="rs1['child']" id="rs2">
            <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
                <td class="td_center"><input type="hidden" name="id[]" value="{$rs2.id}" /><input type="text" name="listorder[]" value="{$rs2.listorder}" size="3" maxlength="3" class="inpt_1" /></td>
                <td class="td_left">{$rs2.id}</td>
                <td class="td_left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|--{$rs2.catname}</td>
                <td class="td_center">{$modules[$rs2[moduleid]][title]}</td>
                <td class="td_center">{$rs2.ismenu|m_s=###,array('<font color="red">隐藏</font>','显示')}</td>
                <td class="td_center"><a href="{$rs2.url}" target="_blank">访问</a></td>
                <td class="td_center"><font color="#CCCCCC" title="不提供添加四级目录！这样很不利于优化！">子栏目</font> | {if $modules[$rs2['moduleid']][lgtypes]=='page'}<a href="{:U($rs2['module'].'/add','id='.$rs2['id'])}">修改内容</a>{else}<a href="{:U($rs2['module'].'/add','catid='.$rs2['id'])}" title="新增内容"><font color="#0000FF">添加内容</font></a>{/if} | <a href="{:U('add','id='.$rs2[id])}" title="编辑该模型">编辑</a> | <a href="{:U('','cmd=del&id='.$rs2['id'])}" onclick="return confirm('您确定要删除该栏目？')">删除</a></td>
            </tr>
        </volist>
    </volist>
</if>
</volist>


	     <tr>
         <td colspan="7" class="td_left">
         <button class="btn02" type="submit">保存排序</button>
         <button class="btn02" type="button" onclick="location.href='{:U('add')}'">新增栏目</button>
         <button class="btn02" type="button" onclick="location.href='{:U('refresh')}'">更新栏目</button>
         </td>
         </tr>
      </tbody></table>
    </form>
	</div>
    <div></div>
</div>
</body>
</html>