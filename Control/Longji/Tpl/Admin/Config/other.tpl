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
	<h2>其它系统参数配置</h2>
    <div id="m_h_right"></div>
    </div>
<form name="gzform" id="myform" method="post" action="">
<input type="hidden" name="id" value="{$id}" />
<input type="hidden" name="cmd" value="save" />
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
       <tr>
          <td  width="120" class="td_right">邮件地址：&nbsp;</td>
          <td class="td_left">&nbsp;
          <input type="text" name="mail_smtp" id="mail_smtp" value="{$mail_smtp}"  validate="required:true;" size="30" maxlength="250">
       </tr>
 
      <tr>
          <td class="td_right">发件人信箱：&nbsp;</td>
          <td class="td_left">&nbsp;
          <input type="text" name="mail_user" id="mail_user" value="{$mail_user}"  validate="required:true;" size="30">
		</tr>
        
        <tr>
          <td class="td_right">邮箱密码：&nbsp;</td>
          <td class="td_left">&nbsp;
          <input type="password" name="mail_pass" id="mail_pass" value="{$mail_pass}" size="30" validate="required:true;">
		</tr>
        <tr>
          <td class="td_right">发件人名称：&nbsp;</td>
          <td class="td_left">&nbsp;
          <input type="text" name="mail_name" id="mail_name" value="{$mail_name}" size="30"  validate="required:true;">
		</tr>
       


      
        <tr>
          <td colspan="2" class="td_left">&nbsp;留言反馈系统</td>
          </tr>
          
         <tr>
          <td class="td_right">留言转发邮箱：&nbsp;</td>
          <td class="td_left">&nbsp;
          <input type="text" name="feedback_email" id="feedback_email" value="{$feedback_email}" size="30"  validate="email:true;">
		</tr>
        
        <tr>
          <td class="td_right">开启留言反馈：&nbsp;</td>
          <td class="td_left">&nbsp;
          <input type="radio" value="1" name="feedback_msg" id="feedback_msg_1" {if $feedback_msg} checked="checked"{/if}><label for="feedback_msg_1">开启</label>
          <input type="radio" value="0" name="feedback_msg" id="feedback_msg_0" {if !$feedback_msg} checked="checked"{/if}><label for="feedback_msg_0">关闭</label>
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