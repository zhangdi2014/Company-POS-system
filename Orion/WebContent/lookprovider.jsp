<%@ page contentType="text/html;charset=UTF-8"
	import="com.entity.ProviderInfo"
 %>
<% 
	ProviderInfo pi = (ProviderInfo)request.getAttribute("object");
 %>
<html>
  <head>
    <title>查看供应商</title>
  </head>
  <body>
 	<jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">供应商资料管理</font>
        <font color="#FFFFFF" size="2">--供应商查看</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="javascript:history.back()">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1" width="100%"/>
	<table width="80%" border="0" cellspacing="1" bgcolor="black" align="center">	
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">供应商名称:</td>

	    <td><%= pi.getPname() %></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">联&nbsp;系&nbsp;人:</td>
	    <td><%= pi.getPlinkman() %></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">公司地址:</td>
	
	    <td><%= pi.getPaddress() %></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">公司电话:</td>
	
	    <td><%= pi.getPtel() %></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">E-mail:</td>

	    <td><%= pi.getPemail() %></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">备&nbsp;&nbsp;&nbsp;&nbsp;注:</td>

	    <td><%= pi.getPremark() %></td>
	  </tr>
	</table>	
  </body>
</html>