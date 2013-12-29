<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>联系我们</title>
<script type="text/javascript" src="/Control/Public/Js/jquery.min.js"></script>
<script type="text/javascript" src="/Control/Public/Js/jquery.form.js"></script>
<link href="/Control/Public/Admin/layout.css" rel="stylesheet" type="text/css" />
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

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="/Public/images/loader.gif"></div>

<div id="main">
  <div class="main_box">
	<div class="main_h2">
	<h2>联系我们</h2>
    <div id="m_h_right">
	<form name="search" method="post" action="">
	<input type="hidden" name="cmd" value="search" />

    关键字：<input type="text" name="keyword" value="{$keyword}" title="输入姓名或电话或邮箱或公司或地址或留言内容进行搜索" /><input type="submit" value="搜索" class="btn02"></form>
	</div>
    </div>
<form name="data_form" id="data_form" method="POST" action="{:U('Contact/index')}">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
        <th width="80">编号</th>
    <th>姓名</th>
    <th>电话</th>
    <th>邮箱</th>
    <th width="160">操作</th>
      </tr>
	    
     <volist name="slist" id="rs">
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
    <td class="td_center">{$rs.id}</td>
    <td class="td_center">{$rs.name}</td>
    <td class="td_center">{$rs.phone}</td>
    <td class="td_center">{$rs.email}</td>
    <td class="td_center"><a href="{:U('Contact/editmessage','id='.$rs[id])}" title="查看该信息">查看</a> 
	<a href="{:U('Contact/deletemessage','id='.$rs[id])}"  onclick="return confirm('您确定要删除该信息？')" title="删除该信息">删除</a></td>
		</tr>
			
        </volist>
	     
      </tbody></table>
	  <div id="pages">{$pages}</div>
    </form>
	</div>
    <div></div>
</div>
</body>
</html>