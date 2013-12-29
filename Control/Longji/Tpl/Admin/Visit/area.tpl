<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<load href="__PUBLIC__/Admin/Css/Style.css" />
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
<load href="__PUBLIC__/Js/jquery.min.js" />
<load href="__PUBLIC__/Js/framemenu.js" />
</head>

<body>
<div class="main_top">
<div class="top_tip">
<h2>本站详细访问概况</h2>
</div>

<ul>   
</ul>
    
</div>
<div class="listtable">
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="t_list">
<tr>
	<th width="197">ID</th>
    <th width="253" >IP（总来源IP）</th>
    <th width="371" >来自地区</th>
</tr>

<volist name="alist" id="rs">
<tr>
  <td class="td_center">{$rs.id}</td>
  <td class="td_center">{$rs.ip}</td>
  <td class="td_center">{$info}</td>
</tr>
</volist>

</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
       <td class="td_left" bgcolor="#F6F9FD" height="30">页面引用：(统计代码：以下代码将在您网站底部出现，请勿自行删除！)</td>
    	</tr>
	    
      <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
        <td class="td_left">&nbsp;注意：本IP计算方式为30分钟内重复访问为无效IP，不记录在册。</td>
      </tr>
      <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
        <td class="td_left">
          <textarea name="textarea" id="textarea" cols="65" rows="5" class="input1"><script language="javascript" type="text/javascript" src="{$js_url}" ></script></textarea></td>
  </tr>   
</tbody>
</table>


</div>
</body>
</html>
