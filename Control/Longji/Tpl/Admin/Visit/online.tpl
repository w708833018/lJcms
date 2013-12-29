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
	<th width="197">&nbsp;</th>
    <th width="253" >IP（总来源IP）</th>
    <th width="371" >PV（页面总刷新数）</th>
    <th width="527">优化相关</th>
</tr>

<tr>
  <td class="td_center">总量</td>
  <td class="td_center">&nbsp;{$ipall} 个</td>
  <td class="td_center">&nbsp;{$pvall} 次</td>
  <td rowspan="6" align="left" valign="middle" class="td_left" style="border-left:#ddd solid 1px;">
  <font color="red">提醒：</font><br />
  1、每个页面都完整的填写页面标题，页面关键字以及描述；<br />
  2、撰写软文，在流量比较大的网站投稿；<br />
  3、不要经常更新网站标题与关键字；<br /></td>
</tr>
<tr>
  <td class="td_center">今日</td>
  <td class="td_center">&nbsp;{$todayip} 个</td>
  <td class="td_center">&nbsp;{$todaypv} 次</td>
</tr>
<tr>
  <td class="td_center">昨日</td>
  <td class="td_center">&nbsp;{$yesdayip} 个</td>
  <td class="td_center">&nbsp;{$yesdaypv} 次</td>
</tr>
<tr>
  <td class="td_center">本月</td>
  <td class="td_center">&nbsp;{$monthip} 个</td>
  <td class="td_center">&nbsp;{$monthpv} 次</td>
</tr>
<tr>
  <td colspan="3" class="td_left">&nbsp;<b>在线客户</b>&nbsp;</td>
  </tr>
<tr>
  <td colspan="3" class="td_left">&nbsp;&nbsp;&nbsp;(<font color="red">30分钟内在线客户</font>)&nbsp;&nbsp;&nbsp;在线客户： {$countip} 个，查看页面 {$todaypv} 次：</td>
  </tr>
<tr>
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
