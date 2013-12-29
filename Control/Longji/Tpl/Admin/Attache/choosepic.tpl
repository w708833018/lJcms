<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-Type" content="text/html;charset=utf-8">
<load href="__BJS__/jquery.js" />
<load href="__CSS__/picset.css" />

</head>
<body>
<div class="picset">

		<div class="row breadrow">
			路径：<php>print_r($paths1)</php>
		</div>

		<div class="row picandfolderrow folderrow">
			<volist name="folder" id="rs">
			<div class="item">
				<a href="javascript:myupload('选择图片','{:U('','type=alllist')}','',1,'{$rs['filename']}')" title="{$rs.name}">
					<div class="pic"></div>
					<div class="pictext">{$rs.name|str_cut=###,8}</div>
				</a>
			</div>
            </volist>
			

		</div>

		<div class="row picandfolderrow picsetrow">
			<volist name="list" id="rs">
			<div class="item">
				<a href="javascript:setval('{$rs.filename}')" title="{$rs.name}">
					<div class="pic"><img src="{$rs.filename|thumb=###,240,240,0}" alt=""></div>
					<div class="pictext">{$rs.name|str_cut=###,8}</div>
				</a>
			</div>
            </volist>
			

		</div>

		<div class="row pagechangrow">
			<div class="pagechange">
				{$pages}
			</div>
		</div>
	</div>

<input type="hidden" name="choosepic" id="upurl" value="" />
<script type="text/javascript">
function setval(str){
	$("#upurl").val(str);
	}
</script>
</body>
</html>