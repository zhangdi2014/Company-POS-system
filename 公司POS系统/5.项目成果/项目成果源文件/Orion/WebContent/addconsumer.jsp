<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>添加客户</title>
     <script language="JavaScript" src="script/trim.js"></script>
     <script language="JavaScript">
       function check(){
         if(document.all.cname.value.trim()==""){
         	alert("客户名不能为空!!!");
         	return false;
         }
         if(document.all.clinkman.value.trim()==""){
         	alert("联系人不能为空!!!");
         	return false;
         }
         if(document.all.caddress.value.trim()==""){
         	alert("公司地址不能为空!!!");
         	return false;
         }
         if(document.all.ctel.value.trim()==""){
         	alert("公司电话不能为空!!!");
         	return false;
         }
       	 document.all.mf.submit();
       }
     </script>
  </head>
  <body style="background: url(img/f4.jpg) no-repeat;background-size:100% 100%">
 	<jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">客户资料管理</font>
        <font color="#FFFFFF" size="2">--客户添加</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="javascript:history.back()">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1" width="100%"/>
 	
 	<form action="ManageServlet" method="post" id="mf">
	<table width="80%" border="0" cellspacing="1" bgcolor="black" align="center">	
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">客户名称:</td>
	    <td><input size="50" style="height:30px;font-size:16px" name="cname" id="cname"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">联&nbsp;系&nbsp;人</td>
	    <td><input size="50" style="height:30px;font-size:16px" name="clinkman" id="clinkman"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">公司地址</td>
	    <td><input size="50" style="height:30px;font-size:16px" name="caddress" id="caddress"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">公司电话</td>
	    <td><input size="50" style="height:30px;font-size:16px" name="ctel" id="ctel"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">E-mail</td>
	    <td><input size="50" style="height:30px;font-size:16px" name="cemail" id="cemail"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">备&nbsp;&nbsp;&nbsp;&nbsp;注</td>
	    <td><input size="50" style="height:30px;font-size:16px" name="cremark" id="cremark" size="50"/></td>
	  </tr>
	</table>
	<table align="center" height="70px" >	  
	  <tr>
	    <td><img border="0" src="img/xg.gif" id="xg" onclick="JavaScript:check()" 
	          style="cursor:hand"/></td>
	    <td width="20%"></td>
	    <td><img border="0" src="img/cz.gif" id="cz" onclick="JavaScript:document.all.mf.reset()"
          	  style="cursor:hand"/></td>
	  </tr>
	</table>
	<input type="hidden" name="action" value="addConsumer"/>
	</form>
  </body>
</html>