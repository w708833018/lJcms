<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>{$moduletitle}</title>
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
	<h2>{$moduletitle}</h2>
    <div id="m_h_right"><form name="search_x" id="search_x">
    
    </form></div>
    </div>
<form name="data_form" id="data_form" method="POST" action="{:U('')}">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
        <th width="40"></th>
        <th width="60">排序</th>
        <th width="60">编号</th>
        <th width="180">栏目</th>
        <th>标题</th>
        <th width="60">状态</th>
        <th width="110">操作</th>
      </tr>
	    
     <volist name="list" id="rs">
     
     <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
		<td class="td_center"><input type="checkbox" name="id[]" id="id_{$rs.id}" value="{$rs.id}" /></td>
        <td class="td_center"><input type="hidden" name="ids[]" value="{$rs.id}" /><input type="text" name="listorder[]" value="{$rs.listorder}" size="3" maxlength="3" /></td>
    <td class="td_center">{$rs.id}</td>
    <td class="td_center" title="栏目：{$categorys[$rs[catid]][catname]}">{$categorys[$rs[catid]][catname]|str_cut=###,22,'...'}</td>
    <td class="td_left">{$rs.title}</td>
    <td class="td_center"><a href="{:U('','cmd=status&value='.$rs['status'])}">{$rs.status|m_s=###,array('<font color="red">禁止</font>','<font color="#0000FF">显示</font>')}</a></td>
    <td class="td_center"><a href="{:U('add','cmd=copy&id='.$rs[id])}" title="复制一个相同产品">复制</a> | <a href="{:U('add','id='.$rs[id])}" title="编辑该模型">编辑</a> | <a href="javascript:void();" onclick="do_del('{$rs.id}');">删除</a></td>
		</tr>
			
        </volist>
       
	   <tr onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#f6f9fd'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
       <td colspan="7" class="td_left">
       &nbsp;&nbsp;<input type="checkbox" name="chk_sel" id="check_box" onclick="selectall('id[]')" /><label for="check_box">全选</label>&nbsp;&nbsp;&nbsp;
       &nbsp;<button class="btn02" type="button" onclick="dopost('del');">删除</button>
       &nbsp;<button class="btn02" type="button" onclick="dopost('order');">排序</button>
       &nbsp;<button class="btn02" type="button" onclick="dopost('status',0);">通过审核</button>
       &nbsp;<button class="btn02" type="button" onclick="dopost('status',1);">取消审核</button>
       &nbsp;<button class="btn02" type="button" onclick="location.href='{:U('add')}'">添加内容</button>
       <input type="hidden" name="cmd" id="cmd" value="" />
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
function dopost(cmd,value){
if(!confirm('您确定要执行该操作？')){return false;};
	$("#cmd").val(cmd);
	$("#value").val(value);
	$("#data_form").submit();
	}
</script>
</body>
</html>