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
	<h2>修改密码</h2>
    <div id="m_h_right"></div>
    </div>
<form name="modform" id="myform" action="" method="post">
<input type="hidden" name="cmd" value="save" /> 
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
 <tr>
  <td  width="120" class="td_right">用户名：</td>
  <td class="td_left"><b>{:cookie("username")}</b>	
    </td>
  </tr>
  <tr>
  <td class="td_right">旧密码：</td>
  <td class="td_left"><input type="password" name="oldpass" id="oldpass" value="" size="15"  validate="required:true" />	
    </td>
  </tr>
  
   <tr>
  <td class="td_right">新密码：</td>
  <td class="td_left"><input type="password" name="newpass" id="newpass" value="" size="15" validate="required:true" />	
    </td>
  </tr>
  
   <tr>
  <td class="td_right">确认密码：</td>
  <td class="td_left"><input type="password" name="newpassc" id="newpassc" value="" size="15"  validate="required:true,equalTo:'#newpass'" title="密码确认失败" />	
    </td>
  </tr>


      
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
          <input type="submit" value="提交" id="submit" onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" class="btn05" name="submit">
          <input type="reset" class="btn05"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" value="清除" name="reset_button">
         </td>
      </tr>
    </tbody></table>
</form>    

	</div>
</div>

</body>
</html>
