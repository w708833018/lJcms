<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="__PUBLIC__/Admin/layout.css" rel="stylesheet" type="text/css" />
<title>广告位新增</title>
<script type="text/javascript" src="__PUBLIC__/Js/jquery.min.js"></script>
<script type="text/javascript" src="__PUBLIC__/Js/jquery.validate.js"></script>
<load href="__PUBLIC__/Css/Jquery.form.css" />
<script type="text/javascript" src="__PUBLIC__/Js/artDialog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="__PUBLIC__/Js/editor.js"></script>
<script>
<php>
echo build_validate("td");
</php>
</script>
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="{$BASE_V}images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
  <div class="main_h2">  
<h2>{$action}系统广告位</h2>
</div>
<form name="modform" id="myform" action="" method="post">    
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <volist name="Fields" id="r">
      <tr>
        <td width="100" class="td_right">{$r.name}：</td>
        <td class="td_left">{$r.id|build_form_field=###,$vo[$r['field']],$id}</td>
      </tr>
      </volist>
      <tr>
        <td class="td_right">状态：</td>
        <td class="td_left"><input type="radio" name="status" id="status_1" value="1" checked="checked"  />
          <label for="status_1">发布</label>
          <input type="radio" name="status" id="status_0" value="0" />
          <label for="status_0">禁止</label></td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
	      <input type="hidden" value="{$id}" name="id">
          <input type="hidden" name="cmd" value="save">
          <input type="submit" value="提交" id="submit" onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" class="btn05" name="submit">
          <input type="reset" class="btn05"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" value="清除" name="reset_button">
          <input type="button" value="返回"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" onclick="location.href='{:U('config')}'" class="btn05" id="backbutton" name="backbutton"></td>
      </tr>
    </tbody></table>
</form>    

	</div>
</div>
</body>
</html>