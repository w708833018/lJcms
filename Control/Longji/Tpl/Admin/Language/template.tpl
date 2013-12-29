<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
<title></title>
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.validate.js"></script>
<load href="__CSS__/Jquery.form.css" />
<load href="__BJS__/Date/WdatePicker.js" />
<script type="text/javascript" src="__BJS__/artDialog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="__BJS__/Editor/kindeditor-min.js"></script>
<script type="text/javascript" src="__BJS__/editor.js"></script>
<script>
function getDel(k){
    $("#tr_"+k).remove();    
}

</script>
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>编辑模板参数</h2>
    <div id="m_h_right"></div>
    </div>
<form name="gzform" id="myform" method="post" action="">
<input type="hidden" name="cmd" value="save" />
<input type="hidden" name="lang" value="{$lang}" />
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
<tr>
  <td  width="180" height="26" class="td_center">配置名称</td>
  <td class="td_left">&nbsp;&nbsp;&nbsp;&nbsp;配置内容</td>
</tr>

<volist name="list" id="r" key="k">
<tr id="tr_{$k}">
  <td  width="120" class="td_center"><input type="text" name="name[]" value="{$r['name']}" size="25" ></td>
  <td class="td_left">&nbsp;<input type="text" name="value[]" value="{$r.value}" size="25" validate="required:true">
  &nbsp;<button type="button" class="btn02" onclick="getDel({$k});">删除</button>
  </td>
</tr>
</volist>

<for start="1" end="5">
<tr>
  <td  width="120" class="td_center"><input type="text" name="name[]" value="" size="25" ></td>
  <td class="td_left">&nbsp;<input type="text" name="value[]" value="" size="25" validate="required:true">&nbsp;
  </td>
</tr>
</for>

      
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
          <input type="submit" value="提交" id="submit" onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" class="btn05" name="submit">
          <input type="button" value="返回"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" onclick="location.href='{:U('index')}'" class="btn05" id="backbutton" name="backbutton"></td>
      </tr>
    </tbody></table>
</form>    

	</div>
</div>
</body>
</html>