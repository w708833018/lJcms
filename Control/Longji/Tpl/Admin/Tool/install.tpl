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
</script>
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>发布配置</h2>
    <div id="m_h_right"></div>
    </div>
<form name="modform" id="myform" action="" method="post">    
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
  <td width="180" class="td_right">授权码：</td>
  <td class="td_left">&nbsp;<input type="text" name="bd[SAFE_CODE]" id="safe_code" value="{$safe_code}" size="35" maxlength="30"></td>
  </tr>
  
  <tr>
      <td width="180" class="td_right">页面静态存储目录：</td>
      <td class="td_left">&nbsp;<input type="text" name="bd[HTML_ROOT]" id="html_root" value="{$html_root}" size="15" maxlength="30"> <font color="#FF0000"> * 必须以 / 开头</font></td>
  </tr>
  
  
   <tr>
      <td width="180" class="td_right">数据备份目录：</td>
      <td class="td_left">&nbsp;<input type="text" name="bd[BACK_PATH]" id="back_path" value="{$back_path}" size="35" maxlength="30">
      &nbsp;系统将自动在 {$Think.RUNTIME_PATH} 目录下创建新文件夹备份数据。
      </td>
  </tr>
  
  <tr>
      <td width="180" class="td_right">静态页面后缀：</td>
      <td class="td_left">&nbsp;<input type="text" name="bd[HTML_EXT]" id="html_ext" value="{$html_ext}" size="10" maxlength="30">
      如 <font color="#FF0000">.html</font>
      </td>
  </tr>
  
  
  
        <tr>
  <td width="180" class="td_right">模型菜单配置：</td>
  <td class="td_left">
  &nbsp;内容：<input type="text" name="bd[MENU_CONTENT]" id="menu_content" value="{$menu_content}" size="3" maxlength="3">
  &nbsp;留言：<input type="text" name="bd[MENU_GUESTBOOK]" id="menu_guestbook" value="{$menu_guestbook}" size="3" maxlength="3">
  </td>
  </tr>
  
       
  </tr>
  
  <tr>
  <td width="180" class="td_right">默认分页条数：</td>
  <td class="td_left">
  &nbsp;前台页面分页：<input type="text" name="bd[PAGE_LISTROWS]" id="page_listrows" value="{$page_listrows}" size="3" maxlength="3">
  &nbsp;后台页面分页：<input type="text" name="bd[PAGE_ROWS]" id="page_rows" value="{$page_rows}" size="3" maxlength="3">
  </td>
  </tr>
  
       
  </tr>
  
  
    
  <tr>
  <td class="td_right">默认语言：</td>
  <td class="td_left">&nbsp;<select name="bd[DEFAULT_LANG]" id="default_lang" value="{$default_lang}">
   <volist name="langdata" id="r">
  <option value="{$r.mark}" {if $default_lang==$r['mark']} selected="selected"{/if}>{$r.name}[{$r.mark}]</option>
  </volist>
  </select>
  </td>
  </tr>
<tr>
  <td class="td_right">生成静态：</td>
  <td class="td_left">&nbsp;<input type="radio" name="bd[IS_HTML]" id="status_1" value="1" <if condition="$is_html"> checked</if>><label for="status_1">启用</label>
  &nbsp;
  <input type="radio" name="bd[IS_HTML]" id="status_0" value="0" <if condition="!$is_html"> checked</if>><label for="status_0">禁用</label></td>
  </tr>


      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
          <input type="hidden" name="cmd" value="save">
          <input type="submit" value="提交" id="submit" onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" class="btn05" name="submit">
          <input type="reset" class="btn05"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" value="清除" name="reset_button"></td>
      </tr>
    </tbody></table>
</form>    

	</div>
</div>
</body>
</html>