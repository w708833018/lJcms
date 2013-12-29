<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-Type" content="text/html;charset=utf-8">
<load href="__BJS__/jquery.js" />
<load href="__BJS__/ajaxfileupload.js" />
<style type="text/css">
body{
	padding:0;
	margin:0;
		}
.fu_list_zzjs {
 width:450px;
 background:#ebebeb;
 font-size:12px;
}
.fu_list_zzjs td {
 padding:5px;
 line-height:20px;
 background-color:#fff;
}
.fu_list_zzjs table {
 width:100%;
 border:1px solid #ebebeb;
}
.fu_list_zzjs thead td {
 background-color:#f4f4f4;
}
.fu_list_zzjs b {
 font-size:14px;
}
/*file容器样式*/
a.files {
 width:90px;
 height:30px;
 overflow:hidden;
 display:block;
 border:1px solid #BEBEBE;
 background:url('__PUBLIC__/images/upload_btn.gif') left top no-repeat;
 text-decoration:none;
}
a.files:hover {
 background-color:#FFFFEE;
 background-position:0 -30px;
}
/*file设为透明，并覆盖整个触发面*/
a.files input {
 margin-left:-350px;
 font-size:30px;
 cursor:pointer;
 filter:alpha(opacity=0);
 opacity:0;
}
/*取消点击时的虚线框*/
a.files, a.files input {
 outline:none;/*ff*/
 hide-focus:expression(this.hideFocus=true);/*ie*/
}
</style>
</head>
<body>

  <table border="0" cellspacing="1" class="fu_list_zzjs">
    
    <tbody>
      <tr>
        <td align="right" width="100" style="line-height:35px;">添加文件：</td>
        <td><input id="img" type="file" name="img" class="input" onchange="return ajaxFileUpload();"><input type="hidden" name="upurl" id="upurl" value="" /></td>
      </tr>
       <tr>
        <td align="right" width="100" style="line-height:35px;">限制参数：</td>
        <td>允许文件类型：{$ext},限制大小：{$maxsize|byte_format=###}</td>
      </tr>
      <tr style="display:none;" id="pictd">
        <td colspan="2"><table border="0" cellspacing="0">
              <tr>
                <td height="30" align="center" valign="middle" id="showurl">
                
                </td>
              </tr>
          </table></td>
      </tr>
    </tbody>
  </table>

<script type="text/javascript">
       function ajaxFileUpload()
               {
				   $("#pictd").show();
				   $("#showurl").html("<img src='__PUBLIC__/images/loadings.gif' />");
                  $.ajaxFileUpload
                     (
                       {
                            url:"{:U('upload','ext='.$ext.'&maxsize='.$maxsize)}", //你处理上传文件的服务端
                            secureuri:false,
                            fileElementId:'img',
                            dataType: 'json',
                            success: function (data, status)
							{
								if(typeof(data.error) != 'undefined')
								{
									if(data.error != '')
									{
				   						$("#showurl").html("<b>出错啦：</b><font color=red>"+data.error+"</font>");
									}else
									{
										$("#upurl").val(data.url);
										$("#showurl").html("上传成功，请点击确定继续。");
										
									}
								}
							},
							error: function (data, status, e)
							{
								alert(e);
							}
                        }
                     )
					 return false;
                 } 
     </script>
</body>
</html>