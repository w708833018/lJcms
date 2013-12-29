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
function ck(){
	if($("#docheck").attr("checked")){
		for(i=1;i<=2;i++){
			$("#seo_"+i).show("fast");
			}
		}else{
			for(i=1;i<=2;i++){
			$("#seo_"+i).hide("fast");
			}
			}
	}
$(document).ready(function(e) {
    {if $moduletypes!='guestbook'}ck();{/if}
});
</script>
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>{$actions} [{$moduletitle}] 内容</h2>
    <div id="m_h_right"></div>
    </div>
<form name="modform" id="myform" action="{:U('insert')}" method="post">    
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      
      
      <tr>
        <td width="120" class="td_right"><font color="red">*</font>标题：</td>
        <td class="td_left"><input type="text" name="title" id="title" value="{$title}" size="35" maxlength="150" validate="required:true"/>
         {if $moduletypes!='guestbook'}<input type="checkbox" name="docheck" id="docheck" value="1" onclick="ck();" /><label for="docheck">设置该页面的优化信息</label>{/if}
        </td>
      </tr>
      {if $moduletypes!='guestbook'}
      <tr id="seo_1">
        <td class="td_right">SEO关键字：</td>
        <td class="td_left"><input type="text" name="keyword" id="keyword" value="{$keyword}"  size="35" maxlength="100">
        (提示：每个页面关键字不建议超过10个，每个关键字之间用 , 隔开。)
        </td>
      </tr>
      
      <tr id="seo_2">
        <td class="td_right">SEO描述：<br />
        (提示：简单描<br />述该栏目主要<br />介绍的信息。)
        </td>
        <td class="td_left"><textarea name="description" id="description"  class="inpt_1" cols="58" rows="6">{$description}</textarea>
        </td>
      </tr>
      {/if}
      <volist name="Fields" id="r">
      {if $r[status]>=1 && $r[status]>=1}
      <tr>
        <td class="td_right">{if $r['required']}<font color="red">*</font>{/if}{$r.name}：</td>
        <td class="td_left">{$r|getform=###,$$r['field'],$form}</td>
      </tr>
      {/if}
      </volist>
      {if $moduletypes!='guestbook'}
      <tr>
        <td class="td_right">形象图</td>
        <td class="td_left"><input type="text" id="image" name="image"  value="{$image}" /> <button type="button" class="btn02" onclick="myupload('上传栏目形象图','{:U('Attache/index')}','image');">上传图片</button></td>
      </tr>
      {/if}
       <tr>
        <td class="td_right">发布时间：</td>
        <td class="td_left"><input type="text"   class="Wdate input-text  "  validate=" required:true"   name="createtime" type="text" id="createtime" size="25" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'
		})" value="{$createtime}" /></td>
      </tr>
      
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
          <input type="button" value="返回"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" onclick="location.href='{:U('index')}'" class="btn05" id="backbutton" name="backbutton"></td>
      </tr>
    </tbody></table>
</form>    

	</div>
</div>
</body>
</html>