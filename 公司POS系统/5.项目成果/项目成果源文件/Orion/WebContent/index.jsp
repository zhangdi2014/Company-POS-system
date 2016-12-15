<%@ page contentType="text/html;charset=UTF-8"%>
<%
	if (session.getAttribute("admin") == null) {
		response.sendRedirect("adminlogin.jsp");
	}
%>
<html>
	<head>
		<title>公司POS系统主页</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<frameset rows="22%,*">
		<!-- 头部 -->
		<frame frameborder="0" name="leftFrame" scrolling="NO" noresize src="top.jsp"/>
		<!-- 中间功能区 -->
		<frame frameborder="0" name="mainFrame" noresize src="main.jsp"/>
	</frameset>
	<body>
	</body>
</html>