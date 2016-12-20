<!-- 登录页的设置 -->
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>后台登录</title>
		<meta name="author" content="DeathGhost" />
		<link rel="stylesheet" type="text/css" href="css/adminlogin.css" tppabs="css/adminlogin.css" />
		<style>
		body{height:100%;background:black;overflow:hidden;}
		canvas{z-index:-1;position:absolute;}
		</style>
		<script src="script/jquery.js"></script>
		<script src="script/verificationNumbers.js" tppabs="script/verificationNumbers.js"></script>
		<script src="script/Particleground.js" tppabs="script/Particleground.js"></script>
		<script>
		$(document).ready(function() {
		  //粒子背景特效
		  $('body').particleground({
		    dotColor: '#5cbdaa',
		    lineColor: '#5cbdaa'
		  });
		  //验证码
		  createCode();
		  //测试提交，对接程序删除即可
		  $(".submit_btn").click(function(){
			  location.href="javascrpt:;"/*tpa=http://***index.html*/;
			  });
		});
		</script>
		<script language="JavaScript">
		function dl(name,pwd){
			if (name==""){
				alert('用户名为空,请重新输入');
		        return false;}
			if (pwd==""){
			 alert('密码为空,请重新输入');
			 return false;}
			 var inputCode = document.getElementById("J_codetext").value.toUpperCase();
			 var codeToUp=code.toUpperCase();
			    if(inputCode.length <=0) {
			      document.getElementById("J_codetext").setAttribute("placeholder","输入验证码");
			      alert('验证码为空,请重新输入');
			      createCode();
			      return false;
			    }
			    else if(inputCode != codeToUp ){
			      document.getElementById("J_codetext").value="";
			      document.getElementById("J_codetext").setAttribute("placeholder","验证码错误");
			      alert('验证码错误,请重新输入');
			      createCode();
			      return false;
			    }
			    else if(inputCode == codeToUp ){
	
			      document.getElementById("J_codetext").value="";
			      document.getElementById("J_codetext").setAttribute("placeholder","验证码正确");
			      createCode();
			      document.all.mf.submit();
			    }

			
			}
		
		  //回车时，默认是登陆
	 function on_return(){
		 if(window.event.keyCode == 13){
		  if (document.all('lg')!=null){
		   document.all('lg').click();
		   }
		 }
		 }        
</script>










	</head>
	<body onkeydown="on_return()">
		<dl class="admin_login">
		 <dt>
		  <strong>公司pos系统</strong>
		  <em>company Pos System</em>
		 </dt>
		 <form action="ManageServlet" method="post" id="mf">
			 <dd class="user_icon">
			  <input type="text" id="uname" name="uname" placeholder="账号" class="login_txtbx" value="zrk"/>
			 </dd>
			 <dd class="pwd_icon">
			  <input type="password" id="upwd" name="upwd" placeholder="密码" class="login_txtbx" value="123"/>
			 </dd>
			 <dd class="val_icon">
			  <div class="checkcode">
			    <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
			    <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
			  </div>
			  <input type="button" value="看不清，换一张" class="ver_btn" onClick="validate()"/>
			 </dd>
			 <dd>
			  <input type="button" value="立即登录"  id="lg" onclick="javascript:return dl(uname.value,upwd.value)" style="width:100%;height:42px;border:none;font-size:16px;background:#048f74;color:#f8f8f8;"/>







			 </dd>
			 <input type="hidden" name="action" value="login" />
		 </form>
		
		</dl>
	</body>
</html>