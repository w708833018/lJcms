<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>{:L('message_title')}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
body{
    font-size: 12px;
    background-color: #F6F9FD;
    font-family:'Microsoft YaHei',Arial;
}
.alert {
	color: #FF9900;
	font-size: 14px;
	margin-bottom: 25px;
}

.success {
	color:##933;
	font-size: 14px;
	margin-bottom: 25px;
}
.box {
	border: #FF9900 1px solid;
	width: 460px;
	margin: 180px auto;
	background-color: #FEFBE2;
	text-align: center;
	padding: 30px;
}
.alertmsg {
	margin-top: 25px;
}
a{ text-decoration:none;}
body,td,th {
	font-family: "Microsoft YaHei", Arial;
}
a:link {
	color: #990000;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #990000;
}
a:hover {
	text-decoration: none;
	color: #990000;
}
a:active {
	text-decoration: none;
	color: #990000;
}
</style>

</head>
<body style="text-align:center; height:100%; width:98%;">
<div class="box">
	<present name="message">
   	<h2 class="sucess"><?php echo($message); ?></h2>
   	<else/>
   	<h2 class="alert">{$error|htmlspecialchars|nl2br}</h2>
	</present>
  <div class="alertmsg">
  页面将在 <span id="wait"><?php echo($waitSecond); ?></span> 秒自动 <a id="href" href="<?php echo($jumpUrl); ?>">跳转</a>，如果不能自动跳转，请<a id="href" href="<?php echo($jumpUrl); ?>">点击</a>。 
  </div>
</div>
<script type="text/javascript">
(function(){
var wait = document.getElementById('wait'),href = document.getElementById('href').href;
var interval = setInterval(function(){
	var time = --wait.innerHTML;
	if(time <= 0) {
		location.href = href;
		clearInterval(interval);
	};
}, 1000);
})();
</script>
</body>
</html>