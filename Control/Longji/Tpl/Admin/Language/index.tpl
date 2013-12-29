<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>语言管理</title>
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.form.js"></script>
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />

</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">
	<div class="main_h2">
	<h2>语言管理</h2>
    <div id="m_h_right"></div>
    </div>
<form name="data_form" id="data_form" method="POST" action="{:U('')}">
<input type="hidden" name="lang" value="{$lang}">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
        <th width="60">编号</th>
    <th width="90">语言名称</th>
    <th width="70">标示</th>
    <th width="120">图标</th>
    <th width="160">模板</th>
    <th width="60">状态</th>
    <th width="130">操作</th>
      </tr>
	    
     <volist name="list" id="r">
     
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
		<td class="td_center">{$r.id}</td>
    <td class="td_center">{$r.name}</td>
    <td class="td_center">{$r.mark}</td>
    <td class="td_center">{if $r.flag}<img src="{$r.flag}"/>{/if}</td>
    <td class="td_center">{$r.template}</td>
    <td class="td_center">{$r.status|m_s=###}</td>
    <td class="td_center"><a href="{:U('add','id='.$r[id])}" title="编辑语言属性">编辑</a> <a href="{:U('lang','lang='.$r['mark'])}">语言包</a> <a href="{:U('template','lang='.$r['mark'])}">模板参数</a></td>
		</tr>
			
        </volist>
       
	  
       
      </tbody></table>
    </form>
   
	</div>
    <div></div>
</div>
</body>
</html>