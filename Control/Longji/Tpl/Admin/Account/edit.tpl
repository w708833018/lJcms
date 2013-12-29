<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.validate.js"></script>
<load href="__CSS__/Jquery.form.css" />
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>{$actions}账号</h2>
    <div id="m_h_right"></div>
    </div>
<form name="myform" id="myform" action="" method="post">
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
 <tr>
  <td  width="120" class="td_right">账号：</td>
  <td class="td_left">{if $id}{$username}{else}<input type="text" name="username" id="username" value="" size="15"  validate="required:true" />{/if}	
    </td>
  </tr>


<tr>
  <td class="td_right">登录密码：</td>
  <td class="td_left"><input type="password" name="userpass" id="userpass" value="" size="15" maxlength="20" {if !$id}validate="required:true"{/if} />	
  </td>
  </tr>
  <tr>
  <td class="td_right">确认密码：</td>
  <td class="td_left"><input type="password" name="userpassc" id="userpassc" value="" size="15" maxlength="20" validate="{if !$id}required:true,{/if}equalTo:'#userpass'" />	
  </td>
  </tr>

<tr>
  <td class="td_right">用户类型：</td>
  <td class="td_left"><select name="group" validate="required:true">
  <option value="1" {if $group==1}selected{/if}>内容审核员</option>
  <option value="9" {if $group==9}selected{/if}>系统管理员</option>
  </select>
  </td>
  </tr>



     
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
	      <input type="hidden" value="{$id}" name="id">
          <input type="hidden" name="cmd" value="save">
          <input type="submit" value="提交" id="submit" onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" class="btn05" name="submit">
          <input type="reset" class="btn05"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" value="清除" name="reset_button">
          <input type="button" value="返回"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" onclick="location.href='{:U('index')}'" class="btn05" id="backbutton" name="backbutton"></td>
      </tr>
    </tbody></table>
</form>    

	</div>
</div>

</body>
</html>
