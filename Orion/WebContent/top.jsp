     <!-- 头部设置 -->
<%@ page contentType="text/html;charset=UTF-8" import="com.bean.UserBean"%>
<html>
	<head>
		<title>top</title>
		<link rel=stylesheet href="css/style.css" type="text/css">
	</head>
	<body style="background: url(img/f4.jpg) no-repeat;background-size:100% 105px">
		<jsp:useBean id="userBean" class="com.bean.UserBean" scope="session" />
		<center>
			<br />
			<h1 style="color: #DFC77F">
				<i>公司POS系统</i>
			</h1>
		</center>
             
             <div style="position:absolute; top: 65px;float:right;right:10px">
             
			<table>
				<tr>
					<td>
						<!-- 首页 -->
						<a href="index.jsp" target="bottom"> 
						<img border="0" src="img/sy.gif" id="sy"/> </a>
					</td>
					<td>
						<!-- 登录 -->
						<a href="adminlogin.jsp" target="bottom"> 
						<img border="0" src="img/dl.gif" id="dl" /> </a>
					</td>
					<td>
						<!-- 修改密码 -->
						<a href="changepwd.jsp" target="bottom"> 
						<img border="0" src="img/xgmm.gif" id="xgmm" /> </a>
					</td>
					<td>
						<!-- 注销 -->
						<a href="ManageServlet?action=logout" target="bottom"> 
						<img border="0" src="img/zx.gif" id="zx"/> </a>
					</td>
				</tr>
			</table>
		</div>
		
	</body>
</html>