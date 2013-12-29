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
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>系统参数配置</h2>
    <div id="m_h_right"></div>
    </div>
<form name="gzform" id="myform" method="post" action="">
<input type="hidden" name="id" value="{$id}" />
<input type="hidden" name="cmd" value="save" />
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
       <tr>
          <td  width="120" class="td_right">网站名称：&nbsp;</td>
          <td class="td_left">&nbsp;
          <input type="text" name="site_name" id="site_name" value="{$site_name}"  validate="required:true;" size="40" maxlength="250">
       </tr>
 
      <tr>
          <td class="td_right">网站网址：&nbsp;</td>
          <td class="td_left">&nbsp;
          <input type="text" name="site_url" id="site_url" value="{:!empty($site_url)?$site_url:myurl()}"  validate="required:true;" size="30">
		</tr>
        
        <tr>
          <td class="td_right">服务邮箱：&nbsp;</td>
          <td class="td_left">&nbsp;
          <input type="text" name="site_email" id="site_email" value="{$site_email}"  validate="required:true;email:true">
		</tr>
        <tr>
          <td class="td_right">网站标题：&nbsp;</td>
          <td class="td_left">&nbsp;
          <input type="text" name="seo_title" id="seo_title" value="{$seo_title}" size="45" validate="required:true;">
		</tr>
        <tr>
          <td class="td_right">网站关键词：&nbsp;</td>
          <td class="td_left">&nbsp;
          <input type="text" name="seo_keywords" id="site_url" value="{$seo_keywords}" size="45"  validate="required:true;">
		</tr>
        <tr>
          <td class="td_right">网站简介：&nbsp;</td>
          <td class="td_left">&nbsp;
          <textarea name="seo_description" cols="56" rows="5" id="seo_description">{$seo_description}</textarea>
		</tr>



      
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
          <input type="hidden" name="cmd" value="save">
          <input type="submit" value="提交" id="submit" onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" class="btn05" name="submit">
          <input type="button" value="返回"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" onclick="location.href='{:U('index')}'" class="btn05" id="backbutton" name="backbutton"></td>
      </tr>
    </tbody></table>
</form>    

	</div>
</div>
</body>
</html>