<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图片管理</title>
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
				"{:U('')}",
				{id:id,cmd:'del'},
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
	<h2>图片管理</h2>
    <div id="m_h_right"></div>
    </div>
<form name="data_form" id="data_form" method="POST" action="{:U('sort')}">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
       	<th width="80">排序</th>
    <th width="180" >标题</th>
    <th width="300">图片</th>
    <th width="80">状态</th>
    <th width="230">操作</th>
      </tr>
	    
     <volist name="list" id="rs">
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
		<td class="td_center"><input type="hidden" name="id[]" value="{$rs.id}" /><input type="text" name="listorder[]" value="{$rs.listorder}" size="3" maxlength="3" /></td>
    <td class="td_left">&nbsp;&nbsp;&nbsp;{$rs.title}</td>
    <td class="td_left"><img src="{$rs.pic}" height="120" /></td>
    <td class="td_center">{$rs.status}</td>
    <td class="td_center"><a href="{:U('picadd','id='.$rs[id])}" title="编辑该模型">编辑</a>  | <a href="javascript:void();" onclick="do_del('{$rs.id}');">删除</a></td>
		</tr>
			
        </volist>
       
	     <tr>
         <td colspan="5" class="td_left">
         <button class="btn02" type="submit">排序</button>
         <button class="btn02" type="button" onclick="location.href='{:U('list')}'">幻灯片</button>
         <button class="btn02" type="button" onclick="location.href='{:U('picadd','fid='.$fid)}'">新增图片</button>
         
         </td>
         </tr>
      </tbody></table>
    </form>
	</div>
    <div></div>
</div>
</body>
</html>