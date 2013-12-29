<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据库管理</title>
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.form.js"></script>
<script type="text/javascript" src="__BJS__/artDialog/jquery.artDialog.source.js?skin=default"></script>
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


function do_del(id){
	artDialog({
		id: 'Confirm',
		icon: 'question',
		fixed: true,
		content: '您确定要删除该数据？',
		ok: function () {
			$("#loading").show("fast");
			$.post(
				"{:U('deleteinfo')}",
				{id:id},
				function(data){
					window.location.reload();
				}
			);
		},
		cancel: function () {
			
		}
	});
	
	
	
	}

</script>
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">
	<div class="main_h2">
	<h2>数据库管理</h2>
    <div id="m_h_right">
    </div>
    </div>
<form name="data_form" id="data_form" method="POST" action="">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
        <th width="40"></th>
        <th width="160">表名</th>
        <th width="120">类型</th>
        <th width="180">字符集</th>
        <th width="80">记录数</th>
        <th width="80">碎片</th>
        <th width="110">大小</th>
      </tr>
	    
     <volist name="dataList" id="rs" key="k">
     
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
		<td class="td_center"><input type="checkbox" name="tables[]" id="id_{$k}" value="{$rs.Name}" /></td>
        <td class="td_center">{$rs.Name|str_replace=C("DB_PREFIX"),'',###}</td>
    <td class="td_center">{$rs.Engine}</td>
    <td class="td_center">{$rs.Collation}</td>
    <td class="td_center">{$rs.Rows}</td>
    <td class="td_center">{$rs.Data_free|byte_format}</td>
    <td class="td_center">{$rs.Data_length|byte_format}</td>
		</tr>
			
        </volist>
       
	   <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
       <td colspan="7" class="td_left">
       &nbsp;&nbsp;数据库大小：
       {$totalSize|byte_format}
       &nbsp;&nbsp;<input type="checkbox" name="chk_sel" id="check_box" onclick="selectall('tables[]')" /><label for="check_box">全选</label>&nbsp;&nbsp;&nbsp;
       &nbsp;<button class="btn02" type="button" onclick="dopost('docommand','repair');">优化</button>
       &nbsp;<button class="btn02" type="button" onclick="dopost('docommand','optimze');">检查</button>
       &nbsp;<button class="btn02" type="button" onclick="dopost('docommand','check');">分析</button>
       分卷大小：<input type="text" name="sizelimit" value="2048" class="input-text" size="4">
       &nbsp;<button class="btn03" type="button" onclick="dopost('backup');">备份数据库</button>
       &nbsp;<button class="btn01" type="button" onclick="location.href='{:U('recover')}';">还原数据库</button>
       &nbsp;<button class="btn04" type="button" onclick="location.href='{:U('query')}'">执行SQL</button>
       <input type="hidden" name="a" id="a" value="" />
       <input type="hidden" name="value" id="value" value="" />
       </td>
       </tr>
       
      </tbody></table>
    </form>
    <div id="pages">{$pages}</div>
	</div>
    <div></div>
</div>
<script>
function dopost(a,cmd){
	this.disbaled=true;
	$("#data_form").attr("action","./index.php?g=Admin&m=Database&a="+a+"&do="+cmd);
	$("#data_form").submit();
	}
</script>
</body>
</html>