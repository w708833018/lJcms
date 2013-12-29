<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<!-- info -->
	<title>{$seo_title}</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<!-- css -->
	<link href="__CSS__/reset.css" rel="stylesheet">
	<link href="__IMAGES__/favicon.png" rel="icon" type="image">
	<!-- js -->
	<!--[if lt IE 9]><script src="__JS__/IE9.js" type="text/javascript"></script><![endif]-->
	<script src="__JS__/jquery.js" type="text/javascript"></script>
	<script src="__JS__/jkcustom.js" type="text/javascript"></script>
</head>
<body>
<div class="thebigwrap">

<!-- logo和导航横栏 -->
<div class="thewrap logowrap">
<div class="thebox logobox">
	<div class="logoblock">
		<img src="__IMAGES__/index_logo.png" alt="">
	</div>
	<div class="navblock">
		<div class="nav">
			<ul>
				<li><a href="{:homeurl($l)}">HOME</a></li>
				<LJ:subcat catid="0" id="r" key="k">
				<li id="li_{$k}"><a href="{$r.url}">{$r.catname}</a></li>
				</LJ:subcat>
			</ul>
		</div>
	</div>
</div><!-- logobox end  -->
</div><!-- logowrap end  -->