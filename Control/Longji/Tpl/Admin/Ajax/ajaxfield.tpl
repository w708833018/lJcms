<div class="addtable">
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#DDDDDD" class="nbtd">
<switch name="fieldtypes" >
<case value="file">
<tr> 
				  <td width="150" bgcolor="#FFFFFF" class="td_right">文本框长度：</td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[size]" value="{$size}" size="10" class="inpt_1"></td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">默认值：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[default]" value="{$default}" size="40" class="inpt_1"></td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">允许上传的文件大小：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[upload_maxsize]" value="{$upload_maxsize}" size="5" class="inpt_1">MB </td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">允许上传的文件类型：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[upload_allowext]" value="<?php if($upload_allowext){echo $upload_allowext;}else{ echo 'zip,rar,doc,ppt';} ?>" size="40" class="inpt_1"></td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">是否从已上传中选择：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="radio" name="setup[more]" value="1" <?php if($more==1) echo 'checked';?>> 是 <input type="radio" name="setup[more]" value="0" <?php if($more==0) echo 'checked';?>> 否</td>
				</tr>
</case>
<case value="number">
			<tr>
			  <td width="150" bgcolor="#FFFFFF" class="td_right">文本框长度：</td>
			  <td bgcolor="#FFFFFF" class="td_left"><input type="text" class="inpt_1" size="5" name="setup[size]" value="{$size}" /></td>
			</tr>
			<tr> 
			  <td bgcolor="#FFFFFF" class="td_right">是否包括负数：</td>
			  <td bgcolor="#FFFFFF" class="td_left"><input type="checkbox" id="" name = "setup[numbertype]" value="1" checked />不包括负数</td>
			</tr>
			<tr> 
			  <td bgcolor="#FFFFFF" class="td_right">小数位数：</td>
			  <td bgcolor="#FFFFFF" class="td_left">
			  <select name="setup[decimaldigits]" class="inpt_1">
			  <option value="0"<?php if($decimaldigits==0) echo ' selected';?>>0</option>
			  <option value="1"<?php if($decimaldigits==1) echo ' selected';?>>1</option>
			  <option value="2"<?php if($decimaldigits==2) echo ' selected';?>>2</option>
			  <option value="3"<?php if($decimaldigits==3) echo ' selected';?>>3</option>
			  <option value="4"<?php if($decimaldigits==4) echo ' selected';?>>4</option>
			  <option value="5"<?php if($decimaldigits==5) echo ' selected';?>>5</option>
			  </select>
			</td>
			</tr>
			<tr> 
			  <td bgcolor="#FFFFFF" class="td_right">默认值：</td>
			  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[default]" value="{$default}" size="40" class="inpt_1"></td>
			</tr>
        </case>
<case value="files">
<tr> 
				  <td width="150" bgcolor="#FFFFFF"  class="td_right">默认值：</td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[default]" value="{$default}" size="40" class="inpt_1"></td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">最多允许上传的文件个数：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[upload_maxnum]" value="{$upload_maxnum}" size="5" class="inpt_1"></td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">允许上传的文件大小：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[upload_maxsize]" value="{$upload_maxsize}" size="5" class="inpt_1">MB </td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">允许上传的文件类型：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[upload_allowext]" value="<?php if($upload_allowext){echo $upload_allowext;}else{ echo 'zip,rar,doc,ppt';} ?>" size="40" class="inpt_1"></td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">是否从已上传中选择：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="radio" name="setup[more]" value="1" <?php if($more==1) echo 'checked';?>> 是 <input type="radio" name="setup[more]" value="0" <?php if($more!=1) echo 'checked';?>> 否</td>
				</tr>
</case>
<case value="editor">
	<tr>
		  <td width="150" bgcolor="#FFFFFF"  class="td_right">默认值：</td>
		  <td bgcolor="#FFFFFF" class="td_left"><textarea name="setup[default]" rows="3" cols="40" id="default"  class="inpt_1" >{$default}</textarea></td>
		</tr>
		<tr>
		  <td bgcolor="#FFFFFF"  class="td_right">编辑器默认高度：</td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[height]" value="{$height}" size="4" class="inpt_1" ></td>
		</tr>

		
		<tr>
		  <td bgcolor="#FFFFFF"  class="td_right">是否保存远程图片：</td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="radio" name="setup[enablesaveimage]" value="1" {if $enablesaveimage==1} checked{/if}> 是 <input type="radio" name="setup[enablesaveimage]" value="0" {if $enablesaveimage==0} checked{/if}> 否</td>
		</tr>
		<tr>
		  <td bgcolor="#FFFFFF"  class="td_right">是否允许图片上传：</td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="radio" name="setup[flashupload]" value="1" {if $flashupload==1 || $action_name=='add'} checked{/if}> 是 <input type="radio" name="setup[flashupload]" value="0" {if $flashupload==0} checked{/if}> 否</td>
		</tr>
		<tr>
		  <td bgcolor="#FFFFFF"  class="td_right">允许上传的图片类型：<br>例: <font color="red">jpg,jpeg,gif</font></td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[alowuploadexts]" value="{$alowuploadexts}" size="55" class="inpt_1"></td>
		</tr>
</case>
<case value="text">
<tr>
			  <td width="150" bgcolor="#FFFFFF" class="td_right">文本框长度：</td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="text" class="inpt_1" size="5" name="setup[size]" value="{$size}" /></td>
			</tr>
			<tr>
			  <td bgcolor="#FFFFFF" class="td_right">默认值：</td>
			  <td bgcolor="#FFFFFF" class="td_left"> <input type="text" class="inpt_1" size="50"  name="setup[default]" value="{$default}" /></td>
			</tr>
			<tr>
			  <td bgcolor="#FFFFFF" class="td_right">是否为密码框：</td>
			  <td bgcolor="#FFFFFF" class="td_left"><input type="radio" name="setup[ispassword]" value="1" {if $ispassword==1} checked{/if}> 是 <input type="radio" name="setup[ispassword]" value="0" {if $ispassword==0} checked{/if}> 否</td>
			</tr><input type="hidden" id="varchar" name="setup[fieldtype]" value="varchar"/>
</case>

<case value="textarea">

<tr>
				  <td width="150" bgcolor="#FFFFFF" class="td_right">字段类型：</td>
				  <td bgcolor="#FFFFFF" class="td_left">
				  <select name="setup[fieldtype]" class="inpt_1" >
				  <option value="mediumtext" <?php if($fieldtype=='mediumtext') echo 'selected';?>>MEDIUMTEXT</option>
				  <option value="text" <?php if($fieldtype=='text') echo 'selected';?>>TEXT</option>
				  </select>
                  </td>
			</tr>
			<tr>
			  <td bgcolor="#FFFFFF"  class="td_right">文本域行数：</td>
			  <td bgcolor="#FFFFFF" class="td_left"><input type="text"  class="inpt_1" size="5" name="setup[rows]" value="{$rows}" /></td>
			</tr>
			<tr>
			  <td bgcolor="#FFFFFF" class="td_right">文本域列数：</td>
			  <td bgcolor="#FFFFFF" class="td_left"><input type="text"  class="inpt_1" size="5" name="setup[cols]" value="{$cols}" /></td>
			</tr>
			<tr>
			  <td bgcolor="#FFFFFF" class="td_right">默认值：</td>
			  <td bgcolor="#FFFFFF" class="td_left"><textarea  name="setup[default]" rows="3" cols="40" class="inpt_1">{$default}</textarea></td>
			</tr>
            
            
</case>
<case value="checkbox|radio">
<tr>
			  <td width="150" bgcolor="#FFFFFF" class="td_right">选项列表:<br>例: <font color="red">选项名称|值</font></td>
		  <td bgcolor="#FFFFFF" class="td_left"><textarea  name="setup[options]" rows="5" cols="40" class="inpt_1"><if condition="strlen($options) neq 5">{$options}</if></textarea></td>
			</tr>
			<tr>
				  <td bgcolor="#FFFFFF" class="td_right">字段类型：</td>
				  <td bgcolor="#FFFFFF" class="td_left">
				  <select name="setup[fieldtype]" onchange="javascript:numbertype(this.value);"  class="inpt_1">
				  <option value="varchar" <?php if($fieldtype=='varchar') echo 'selected';?>>字符 VARCHAR</option>
				  <option value="tinyint" <?php if($fieldtype=='tinyint') echo 'selected';?>>整数 TINYINT(3)</option>
				  <option value="smallint" <?php if($fieldtype=='smallint') echo 'selected';?>>整数 SMALLINT(5)</option>
				  <option value="mediumint" <?php if($fieldtype=='mediumint') echo 'selected';?>>整数 MEDIUMINT(8)</option>
				  <option value="int" <?php if($fieldtype=='int') echo 'selected';?>>整数 INT(10)</option>
				  </select> <span id="numbertype" style="display:none;"  > <input type="checkbox" id="" name = "setup[numbertype]" value="1" checked />不包括负数</span>
                  </td>
			</tr>
            <tr>
			  <td bgcolor="#FFFFFF" class="td_right">宽度：</td>
			  <td bgcolor="#FFFFFF" class="td_left"> <input type="text" class="inpt_1" size="10"  name="setup[labelwidth]" value="{$labelwidth}" /></td>
			</tr>
			<tr>
			  <td bgcolor="#FFFFFF" class="td_right">默认值：</td>
			  <td bgcolor="#FFFFFF" class="td_left"> <input type="text" class="inpt_1" size="5"  name="setup[default]" value="{$default}" /></td>
			</tr>

</case>
<case value="datetime">
<tr>
		  <td bgcolor="#FFFFFF" class="td_right">默认值：</td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="text" class="inpt_1" size="30"  name="setup[default]" value="{$default}" /></td>
		</tr>
		<tr>
		  <td bgcolor="#FFFFFF" class="td_right">时间格式：</td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[dateformat]" value="{$dateformat}" size="30" class="inpt_1" > 例:Y-m-d H:i:s</td>
		</tr>

</case>
<case value="select">
	<tr>
			  <td width="150" bgcolor="#FFFFFF" class="td_right">选项列表：<br>例: <font color="red">选项名称|值</font></td>
		  <td bgcolor="#FFFFFF" class="td_left"><textarea  name="setup[options]" rows="5" cols="40" class="inpt_1"><if condition="strlen($options) neq 5">{$options}</if></textarea></td>
			</tr>
			
			<tr>
				  <td bgcolor="#FFFFFF" class="td_right">字段类型：</td>
				  <td bgcolor="#FFFFFF" class="td_left">
				  <select name="setup[fieldtype]" onchange="javascript:numbertype(this.value);" class="inpt_1">
				  <option value="varchar" <?php if($fieldtype=='varchar') echo 'selected';?>>字符 VARCHAR</option>
				  <option value="tinyint" <?php if($fieldtype=='tinyint') echo 'selected';?>>整数 TINYINT(3)</option>
				  <option value="smallint" <?php if($fieldtype=='smallint') echo 'selected';?>>整数 SMALLINT(5)</option>
				  <option value="mediumint" <?php if($fieldtype=='mediumint') echo 'selected';?>>整数 MEDIUMINT(8)</option>
				  <option value="int" <?php if($fieldtype=='int') echo 'selected';?>>整数 INT(10)</option>
				  </select> <span id="numbertype" style="display:none;"  > <input type="checkbox" id="" name = "setup[numbertype]" value="1" checked />不包括负数</span>
                  </td>
			</tr>
			
			<tr>
			  <td bgcolor="#FFFFFF" class="td_right">默认值：</td>
			  <td bgcolor="#FFFFFF" class="td_left"> <input type="text" class="inpt_1" size="5"  name="setup[default]" value="{$default}" /></td>
			</tr>
</case>

<case value="image">
<tr> 
				  <td width="150" bgcolor="#FFFFFF" class="td_right">文本框长度</td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[size]" value="{$size}" size="10" class="inpt_1"></td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">默认值</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[default]" value="{$default}" size="40" class="inpt_1"></td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">允许上传的文件大小</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[upload_maxsize]" value="{$upload_maxsize}" size="5" class="inpt_1">MB </td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">允许上传的文件类型</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[upload_allowext]" value="<?php if($upload_allowext){echo $upload_allowext;}else{ echo 'jpg,jpeg,gif,png';} ?>" size="40" class="inpt_1"></td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">是否添加水印</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="radio" name="setup[watermark]" value="1" <?php if($watermark==1) echo 'checked';?>> 是 <input type="radio" name="setup[watermark]" value="0" <?php if($watermark==0) echo 'checked';?>> 否</td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">是否从已上传中选择</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="radio" name="setup[more]" value="1" <?php if($more==1) echo 'checked';?>> 是 <input type="radio" name="setup[more]" value="0" <?php if($more==0) echo 'checked';?>> 否</td>
				</tr>	
</case>

<case value="images">
<tr> 
				  <td width="150" bgcolor="#FFFFFF" class="td_right">默认值：</td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[default]" value="{$default}" size="40" class="inpt_1"></td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">最多允许上传几张图片：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[upload_maxnum]" value="{$upload_maxnum}" size="5" class="inpt_1"></td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">允许上传的图片大小：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[upload_maxsize]" value="{$upload_maxsize}" size="5" class="inpt_1">MB </td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">允许上传的图片类型：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[upload_allowext]" value="<?php if($upload_allowext){echo $upload_allowext;}else{ echo 'jpg,jpeg,gif,png';} ?>" size="40" class="inpt_1"></td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">是否在图片上添加水印：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="radio" name="setup[watermark]" value="1" <?php if($watermark==1) echo 'checked';?>> 是 <input type="radio" name="setup[watermark]" value="0" <?php if($watermark==0) echo 'checked';?>> 否</td>
				</tr>
				<tr> 
				  <td bgcolor="#FFFFFF" class="td_right">是否从已上传中选择：</td>
				  <td bgcolor="#FFFFFF" class="td_left"><input type="radio" name="setup[more]" value="1" <?php if($more==1) echo 'checked';?>> 是 <input type="radio" name="setup[more]" value="0" <?php if($more==0) echo 'checked';?>> 否</td>
				</tr>
</case>

<case value="11">
<tr>
		  <td bgcolor="#FFFFFF">默认值：</td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="text" class="inpt_1" size="30"  name="setup[default]" value="{$default}" /></td>
		</tr>
		<tr>
		  <td bgcolor="#FFFFFF">时间格式：</td>
		  <td bgcolor="#FFFFFF" class="td_left"><input type="text" name="setup[dateformat]" value="{$dateformat}" size="30" class="inpt_1" > 例:Y-m-d H:i:s</td>
		</tr>
</case>
</switch>
</table>
</div>
<script>
		function numbertype(fieldtype){
		 
			if(fieldtype=='varchar'){ 
				$('#numbertype').hide();
			}else{
				$('#numbertype').show();
			}
		}
		<if condition="!empty($fieldtype) && $fieldtype!='varchar'">$('#numbertype').show();</if>
		</script>