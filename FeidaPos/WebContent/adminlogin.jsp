<!-- 登录页的设置 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<title>登录主页</title>
		<link rel=stylesheet href="css/style.css" type="text/css">
		<script language="JavaScript" src="script/trim.js"></script>
		<script language="JavaScript">
		function dl(name,pwd,checkcode){
			if (name==""){
				alert('用户名为空,请重新输入');
		        return false;}
			if (pwd==""){
			 alert('密码为空,请重新输入');
			 return false;}
			if(checkcode==""){
				alert("验证码为空,请重新输入!!!");//弹出对话框
				return false;
			}
			document.all.mf.submit();
			}

	   </script>
</head>
	<body style="background: url(img/f4.jpg) no-repeat;background-size:1700px 1000px">
		<div class="out" >
			<div class="login_style" align="center">
				<center>
					<form action="LoginC1" method="post" id="mf" target="bottom">
						<table>
							<tr>
								<td>
									<b>用户名:</b>
								</td>
								<td>
									<input type="text" id="uname" name="uname" value="zrk" />
								</td>
							</tr>
							<tr>
								<td>
									<b>密码:</b>
								</td>
								<td>
									<input type="password" id="upwd" name="upwd" value="12345" />
								</td>
							</tr>
							<tr>
								<td>
									<b>验证码</b>:
								</td>
								<td>
									<input type="text"  id="checkcode" name="checkcode"/>
									<img src="/FeidaPos/CreatCode"/>
								</td>
							</tr>
							
							<tr>
								<td colspan="2" align="center">
									
								  <img src="img/ddl.gif" id="lg" onclick="javascript:return dl(uname.value,upwd.value,checkcode.value)" style="cursor: hand"/>
								  <img src="img/cz.gif" id="cz" onclick="JavaScript:document.all.mf.reset()" style="cursor: hand"/>
									
		                        </td>
				            </tr>
						</table>
						<input type="hidden" name="action" value="login" />
					</form>
				</center>
			</div>
		</div>
	</body>
</html>