<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />

</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">
	<div class="main_h2">
	<h2>图片库</h2>
    <div id="m_h_right"><form name="search_x" id="search_x">
    路径：<php>print_r($paths)</php>
    </form></div>
    </div>
<form name="data_form" id="data_form" method="POST" action="{:U('')}">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
        <th class="td_left">&nbsp;&nbsp;&nbsp;&nbsp;名称</th>
        <th width="80">大小</th>
        <th width="180">时间</th>
      </tr>
	   
       <volist name="folder" id="rs">
     
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
		<td class="td_left">&nbsp;{if $rs[type]==1}<a href="{:U('','paths='.$rs['filename'])}">{$rs.name}</a>{else}<img src="{$rs.filename|thumb=###,32,32,1}" width="16">{$rs.name}{/if}</td>
        <td class="td_center">&nbsp;{$rs.size|byte_format=###}</td>
        <td class="td_center">&nbsp;{$rs.time|toDate=###}</td>
        
    </tr>
    </volist>
    
     <volist name="list" id="rs">
     
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
		<td class="td_left">&nbsp;{if $rs[type]==1}<a href="{:U('','paths='.$rs['filename'])}">{$rs.name}</a>{else}<img src="{$rs.filename|thumb=###,32,32,1}" width="16">{$rs.name}{/if}</td>
        <td class="td_center">&nbsp;{$rs.size|byte_format=###}</td>
        <td class="td_center">&nbsp;{$rs.time|toDate=###}</td>
        
    </tr>
			
        </volist>
       
	   
       
      </tbody></table>
    </form>
    <div id="pages">{$pages}</div>
	</div>
    <div></div>
</div>

</body>
</html>