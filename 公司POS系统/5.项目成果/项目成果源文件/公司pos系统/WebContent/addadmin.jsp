<!-- 系统管理 -->
<%@ page contentType="text/html;charset=UTF-8" import="com.bean.UserBean,com.entity.AdminInfo,java.util.*"%>
<html>
  <head>
    <title>管理员添加</title>
    <script language="JavaScript" src="script/trim.js"></script>
    <script language="JavaScript">
      function check(){
      	if(document.all.aname.value.trim()==""){
      	  alert("管理员名称不能为空!!!");
      	  return false;
      	}
      	if(document.all.apwd.value.trim()==""){
      	  alert("密码不能为空!!!");
      	  return false;
      	}
      	if(document.all.apwd.value.trim()!=document.all.fpwd.value.trim()){
      	  alert("两次密码输入不一致!!!");
      	  return false;
      	}
      	document.all.mf.submit();
      }
    </script>
  </head>
  <body>
 	<jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">管理员管理</font>
        <font color="#FFFFFF" size="2">--管理员添加</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="javascript:history.back()">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1"/>
	<form action="ManageServlet" method="post" id="mf">
	<table width="80%" border="0" cellspacing="1" bgcolor="black" align="center">	
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">管理员名称:</td>
	    <td><input size="50" style="height:30px;font-size:16px" name="aname" id="aname"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">管理员密码:</td>
	    <td><input size="50" style="height:30px;font-size:16px" type="password" name="apwd" id="apwd"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">确认密码:</td>
	    <td><input size="50" style="height:30px;font-size:16px" type="password" name="fpwd" id="fpwd"/></td>
	  </tr>
	</table>
	<table align="center" height="70px" >	  
	  <tr>
	    <td><img border="0" src="img/xg.gif" id="xg" onclick="JavaScript:check()" style="cursor:hand"/></td>
	    <td width="20%"></td>
	    <td><img border="0" src="img/cz.gif" id="cz" onclick="JavaScript:document.all.mf.reset()"style="cursor:hand"/></td>
	  </tr>
	</table>
	<input type="hidden" name="action" value="addAdmin"/>
	</form>
  </body>
</html>