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
	<h2>{$actions}区块</h2>
    <div id="m_h_right"></div>
    </div>
<form name="modform" id="myform" action="" method="post">
<input type="hidden" name="id" value="{$id}" />
<input type="hidden" name="cmd" value="save" /> 
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
 <tr>
  <td  width="120" class="td_right">区块标题：</td>
  <td class="td_left"><input type="text" name="name" id="name" value="{$name}" size="35" />	
    </td>
  </tr>


<tr>
  <td class="td_right">区块代码：</td>
  <td class="td_left"><input type="text" name="pos" id="pos" value="{$pos}" size="35" maxlength="100" validate="english:true,required:ture" />	
  </td>
  </tr>

<tr>
  <td class="td_right">区块内容：</td>
  <td class="td_left"><textarea name="content" id="content1" class="inpt_1" cols="58" rows="6">{$content}</textarea></td>
  </tr>



     
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
	      <input type="hidden" value="{$id}" name="id">
          <input type="hidden" name="cmd" value="save">
          <input type="submit" value="提交" id="submit" onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" class="btn05" name="submit">
          <input type="reset" class="btn05"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" value="清除" name="reset_button">
          <input type="button" value="返回"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" onclick="location.href='{:U('index','mid='.$mid)}'" class="btn05" id="backbutton" name="backbutton"></td>
      </tr>
    </tbody></table>
</form>    

	</div>
</div>

</body>
</html>
