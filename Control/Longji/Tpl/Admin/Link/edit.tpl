<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
<title></title>
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.validate.js"></script>
<load href="__CSS__/Jquery.form.css" />
<script type="text/javascript" src="__BJS__/artDialog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="__BJS__/editor.js"></script>
<script>
function show_log(states){
	if(states){
		$("#showlog").show("fast");
		}else{
			$("#showlog").hide("fast");
			}
	}

</script>
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>{$actions}链接</h2>
    <div id="m_h_right"></div>
    </div>
<form name="myform" id="myform" action="" method="post"> 
<input type="hidden" name="id" value="{$id}" />
<input type="hidden" name="cmd" value="save" />   
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      
      
<tr>
  <td  width="180" class="td_right">链接标题：&nbsp;</td>
  <td class="td_left">&nbsp;
    <input type="text" name="name" id="name" value="{$name}" class="inpt_1" size="35" validate="required:true" />	
   </td>
  </tr>


<tr>
  <td class="td_right">链接地址：&nbsp;</td>
  <td class="td_left">&nbsp;
    <input type="text" name="siteurl" id="siteurl" value="{$siteurl}" class="inpt_1" size="35" maxlength="100" validate="required:true,url:true" />	
  </td>
  </tr>

<tr>
  <td class="td_right">链接类型：&nbsp;</td>
  <td  class="td_left">&nbsp;
  
    <input type="radio" name="linktype" id="linktype_0" value="0" <if condition="empty($linktype)"> checked</if>  onclick="show_log(0);" />
    <label for="linktype_0">文字链接</label>
    
    
    <input type="radio" name="linktype" id="linktype_1" value="1"  <if condition="$linktype"> checked</if> onclick="show_log(1);" />
    <label for="linktype_1">图形链接</label>
    
    
    
    	
  </td>
  </tr>
  
  <tr id="showlog" style="display:none;">
  <td class="td_right">LOGO地址：&nbsp;</td>
  <td class="td_left">&nbsp;
  	<input type="text" name="logo" id="logo_img" value="{$logo}" size="35" maxlength="100" />
    <button class="btn01" type="button" onclick="myupload('上传链接logo','{:U('Attache/index')}','logo_img')">上传</button>
  </td>
  </tr>
  
  <tr>
  <td class="td_right">站点描述：&nbsp;</td>
  <td class="td_left">&nbsp;
    <input type="text" name="siteinfo" id="siteinfo" value="{$siteinfo}" size="35" maxlength="100" />	
  </td>
  </tr>

     
      <tr>
        <td class="td_right">排序：&nbsp;</td>
        <td class="td_left">&nbsp;
        <input name="listorder" type="text" class="input1" id="listorder" value="{$listorder}" size="3" maxlength="3" validate="number:true" /></td>
      </tr>
      
      <tr>
        <td class="td_right">状态：&nbsp;</td>
        <td class="td_left">&nbsp;
        <input type="radio" name="status" id="status_1" value="1" <if condition="$status egt 1">checked="checked"</if>  />
          <label for="status_1">正常</label>
          <input type="radio" name="status" id="status_0" value="0" <if condition="$status elt 0">checked="checked"</if>  />
          <label for="status_0">隐藏</label></td>
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
<script>
show_log({$linktype});
</script>
</body>
</html>