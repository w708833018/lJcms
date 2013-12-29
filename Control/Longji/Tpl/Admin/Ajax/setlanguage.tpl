
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#DDDDDD" class="nbtd">
				<tr>
				  <td height="28" align="left" bgcolor="#FFFFFF">&nbsp;请从以下语言包中选择一门语言：</td>
  </tr>
                <volist name="langdata" id="r">
				
				<tr> 
				  <td height="28" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;
                  <input type="radio" name="l" value="{:U('Admin/Index/index','l='.$r[mark])}" id="l_{$r.mark}" {if $langname==$r['mark']} checked="checked"{/if}> <label for="l_{$r.mark}">{$r.name}[{$r.mark}]</label></td>
				</tr>
                </volist>
				
</table>
