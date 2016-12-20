<!-- 查看商品 -->
<%@ page contentType="text/html;charset=UTF-8" 
	import="com.bean.UserBean,org.springframework.web.context.*,
	org.springframework.web.context.support.*,com.db.DButil,java.util.*,
	com.entity.GoodsInfo,com.entity.GoodsClassInfo"
%>
<html>
  <head>
    <title>查看商品</title>
     <script language="JavaScript" src="script/trim.js"></script>
  </head>
  <body>
 	<jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">商品资料管理</font>
        <font color="#FFFFFF" size="2">--商品查看</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="javascript:history.back()">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1"/>
	<% 
		GoodsInfo gi = (GoodsInfo)request.getAttribute("object");
	 %>
	<form action="ManageServlet" method="post" id="mf">
	<table width="80%" border="0" cellspacing="1" bgcolor="black" align="center">	
	  <tr bgcolor="white">
	    <td align="center">商品名称:</td>
	    <td><%= gi.getGname() %></td>
	  </tr>
	  <tr bgcolor="white">
	  	<td align="center">计量单位:</td>
	  	<td><%= gi.getGunit() %></td>
	  </tr>
	  <tr bgcolor="white">
	  	<td align="center">进&nbsp;&nbsp;&nbsp;&nbsp;价:</td>
	  	<td><%= gi.getGpin() %></td>
	  </tr>
	  <tr bgcolor="white">
	  	<td align="center">售&nbsp;&nbsp;&nbsp;&nbsp;价:</td>
	  	<td><%= gi.getGpout() %></td>
	  </tr>
	  <tr bgcolor="white">
	  	<td align="center">商品数量:</td>
	  	<td><%= gi.getGamount() %></td>
	  </tr>	
	</table>
	</form>
  </body>
</html>