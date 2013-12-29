<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据库管理</title>
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
	<h2>数据表管理</h2>
    <div id="m_h_right">搜索相关</div>
    </div>
<form name="data_form" id="data_form" method="POST" action="{:U('databackup')}">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
        <th width="8%">选择</th>
        <th>名称</th>
        <th width="14%">类型</th>
        <th width="14%">字符集</th>
        <th width="12%">记录数</th>
        <th width="12%">碎片</th>
        <th width="12%">大小</th>
      </tr>
	    
     <volist name="dataList" id="vo">
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
		<td><input type="checkbox" name="tables[]" value="{$vo.Name}" id="{$vo.Name}"> </td>
        <td>{$vo.Name}</td>
        <td align="left">&nbsp;&nbsp;{$vo.Engine}</td>
        <td>{$vo.Collation}</td>
        <td>{$vo.Rows}</td>       
        <td>{$vo.Data_free|byte_format}</td>
		 <td>{$vo.Data_length|byte_format}</td>
		</tr>

        </volist>
       
	  <tr style="background: none repeat scroll 0% 0% rgb(248, 248, 248);">
              <td><input type="checkbox" value="" id="check_box" onclick="selectall('tables[]');"><label for="check_box">全选</label></td>
              <td class="td_left" colspan="6">
             &nbsp;&nbsp;
             数据库大小：{$totalSize|byte_format}&nbsp;&nbsp;&nbsp;&nbsp;
			 分卷大小：<input type="text" name="sizelimit" value="2048" size=4>
             <input type="hidden" name="cmd" value="bak" />&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" class="btn02" value="备份数据" name="Submit">
            <input type="button" onclick="location.href='{:U("recover")}'" class="btn02" value="还原数据" name="addmenu">
          <input type="hidden" value="del" name="action">      </td></tr>	      
      </tbody></table>
    </form>
	</div>
</div>
</body>
</html>