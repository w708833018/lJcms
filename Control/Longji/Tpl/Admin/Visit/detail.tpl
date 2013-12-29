<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<load href="__PUBLIC__/Admin/Css/Style.css" />
<load href="__PUBLIC__/Js/jquery.min.js" />
<load href="__PUBLIC__/Js/framemenu.js" />
</head>

<body>
<div class="main_top">
<div class="top_tip">
访问明细查看
</div>

<ul></ul>
    
</div>
<div class="listtable">
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
	<th>来访时间</th>
    <th>来访IP</th>
    <th>来自</th>
    <th>访问页</th>
    <th>来路页</th>
</tr>
<volist name="list" id="rs">
<tr>
	<td class="td_center">{$rs.inpvtime|toDate=###}</td>
    <td class="td_left">{$rs.ip|long2ip=###}</td>
    <td class="td_left">loading...</td>
    <td class="td_left">[ <font color="#FF0000" title="查看 {$rs.pvnum} 次">{$rs.pvnum}次</font> ]&nbsp;<a href="{$rs.pageurl}" target="_blank" title="访问：{$rs.pageurl}">{$rs.pageurl|getdomainstr=###,1}</a></td>
    <td class="td_center">&nbsp;<a href="{$rs.referer}" target="_blank" title="来自：{$rs.referer}">{$rs.referer|getdomainstr=###,0}</a></td>
</tr>
</volist>
</table>

</div>
</body>
</html>
