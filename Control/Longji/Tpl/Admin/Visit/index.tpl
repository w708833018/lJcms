<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本站详细访问概况</title>
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.form.js"></script>
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">
	<div class="main_h2">
	<h2>本站详细访问概况</h2>
    <div id="m_h_right"></div>
    </div>

    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
       <th width="72">&nbsp;</th>
    	<th width="220" >IP（总来源IP）</th>
    	<th width="234" >PV（页面总刷新数）</th>
    	<th width="589">优化相关</th>
      </tr>
	    
      <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
        <td class="td_center">总量</td>
  <td class="td_center">&nbsp;{$ipall} 个</td>
  <td class="td_center">&nbsp;{$pvall} 次</td>
  <td rowspan="4" align="left" valign="top" class="td_left" style="border-left:#ddd solid 1px; padding:15px;">
  <font color="red">提醒：</font><br />
  1、每个页面都完整的填写页面标题，页面关键字以及描述；<br />
  2、撰写软文，在流量比较大的网站投稿；<br />
  3、不要经常更新网站标题与关键字；<br />
  </td>
      </tr>
      <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
        <td class="td_center">今日</td>
  <td class="td_center">&nbsp;{$todayip} 个</td>
  <td class="td_center">&nbsp;{$todaypv} 次</td>
      </tr>
      <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
       <td class="td_center">昨日</td>
 		<td class="td_center">&nbsp;{$yesdayip} 个</td>
  		<td class="td_center">&nbsp;{$yesdaypv} 次</td>
      </tr>
      <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
		 <td class="td_center">本月</td>
  		<td class="td_center">&nbsp;{$monthip} 个</td>
  		<td class="td_center">&nbsp;{$monthpv} 次</td>
    </tr>
		
       
	    
      </tbody></table>
   <div>
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
      
		
       
	    
      </tbody></table>
   </div>
  </div>
    <div></div>
</div>
</body>
</html>