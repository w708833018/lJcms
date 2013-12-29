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
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>{$actions}菜单</h2>
    <div id="m_h_right"></div>
    </div>
<form name="modform" id="myform" action="" method="post">    
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
        <td width="100" class="td_right">父目录：</td>
        <td class="td_left"><select name="parent" id="parent" class="input1">
        	<option value="0">--设置为一级目录--</option>
            <volist name="list" id="r">
            	<if condition="$r[id] neq $id">
            	<option value="{$r.id}" <if condition="$r[id] eq $parent"> selected</if>>{$r.title}</option>
                </if>
                <volist name="r[child]" id="r1">
                	<if condition="$r1[id] neq $id">
            		<option value="{$r1.id}" <if condition="$r1[id] eq $parent"> selected</if>>&nbsp;&nbsp;&nbsp;|--&nbsp;{$r1.title}</option>
                    </if>
            	</volist>
            </volist>
        </select></td>
      </tr>
      <tr>
        <td class="td_right">菜单名称：</td>
        <td class="td_left"><input name="title" type="text" class="input1" value="{$title}" size="30" maxlength="30" validate="required:true, minlength:1, maxlength:40" /></td>
      </tr>
      
       <tr>
        <td class="td_right">模型名称(m)：</td>
        <td class="td_left"><input name="module" type="text" class="input1" id="module" value="{$module}" size="15" maxlength="15" validate="required:true, minlength:1, maxlength:40" /></td>
      </tr>
      
       <tr>
        <td class="td_right">动作名称(a)：</td>
        <td class="td_left"><input name="action" type="text" class="input1" id="action" value="{$action}" size="15" maxlength="15" validate="required:true, minlength:1, maxlength:40" /></td>
      </tr>
      
       <tr>
        <td class="td_right">附加连接：</td>
        <td class="td_left"><input name="url" type="text" class="input1" id="url" value="{$url}" size="25" maxlength="35"/></td>
      </tr>
      
      <tr>
        <td class="td_right">排序：</td>
        <td class="td_left"><input name="listorder" type="text" class="input1" id="listorder" value="{$listorder}" size="3" maxlength="3" validate="number:true" /></td>
      </tr>
      
      <tr>
        <td class="td_right">状态：</td>
        <td class="td_left"><input type="radio" name="status" id="status_1" value="1" <if condition="$status egt 1">checked="checked"</if>  />
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
</body>
</html>