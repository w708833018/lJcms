<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">	
	<title>管理员登陆 - 龙吉网络E建站系统 - 授权：{$site_name}</title>
    <load href="__BJS__/jquery.min.js" />
    <load href="__PUBLIC__/login.css" />
    <script>
    $(document).ready(function(e) {
        $("#loginform").submit(function(e) {
            if($("#username").val()==""){
				$("#logininfo").html("<font color=red>请输入登录账号！</font>");
				$("#logininfo").show("fast");
				$("#username").focus();
				return false;
				}
			if($("#userpass").val()==""){
				$("#logininfo").html("<font color=red>请输入登录密码！</font>");
				$("#logininfo").show("fast");
				$("#userpass").focus();
				return false;
				}
			
        });
		
		$("#login").click(function(e) {
            $("#loginform").submit();
        });
    });
    </script>
</head>
<body>
	<div class="login">
		<div class="logintitle">
			龙吉网络E建站系统
		</div>
		<div class="loginbox">
			<form name="loginform" id="loginform" action="{:U('dologin')}" method="post">
				<div class="loginboxtag">账号：</div>
				<div class="loginboxinput"><input type="text" name="username" id="username" /></div>
				<div class="loginboxtag">密码：</div>
				<div class="loginboxinput"><input type="password" name="userpass" id="userpass"></div>
				<div class="loginboxbtn">
					<div class="fll rem"><span id="logininfo">请输入授权账号与密码登录系统！</span></div>
					<div class="flr btn" id="login">登入</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$(":input:first").focus();//聚焦此页面的第一个input

	$(function(){
	    $(":input").keyup(function(e) {
	     var key = e.which;
	     if (13 == key) {
	          var index = $(":input").index(this);
	          var newIndex = index + 1;
	          $(":input:eq(" + newIndex + ")").focus();
	      }
	   });
	});//回车聚焦下个input

	$(function(){
	    $(":input:last").keyup(function(e) {
	     var key = e.which;
	     if (13 == key) {
	         $("#loginform").submit();
	      }
	   });
	});//回车提交表单
</script>