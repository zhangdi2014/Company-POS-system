<%@ page contentType="text/html;charset=UTF-8"
	import="com.entity.ConsumerInfo"
 %>
<% 
	ConsumerInfo ci = (ConsumerInfo)request.getAttribute("object");
 %>
<html>
  <head>
    <title>修改客户</title>
     <script language="JavaScript" src="script/trim.js"></script>
     <script language="JavaScript">
       function check(){
         if(document.all.clinkman.value.trim()==""){
         	alert("联系人不能为空!!!");
         	return;
         }
         if(document.all.caddress.value.trim()==""){
         	alert("公司地址不能为空!!!");
         	return;
         }
         if(document.all.ctel.value.trim()==""){
         	alert("公司电话不能为空!!!");
         	return;
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
        <font color="#FFFFFF" size="2">--客户修改</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="javascript:history.back()">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1" width="100%"/>	
	<form method="post" action="ManageServlet" id="mf">
	<table width="80%" border="0" cellspacing="1" bgcolor="black" align="center">	
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">客户名称:</td>
	    <!--
	    	    <td><%= new String(ci.getCname().getBytes("ISO-8859-1"),"gbk") %></td>
	    -->
	    <td><%= ci.getCname() %></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">联&nbsp;系&nbsp;人:</td>
	   <!--
	    <td><input name="clinkman" id="clinkman" 
	    	 value="<%= new String(ci.getClinkman().getBytes("ISO-8859-1"),"gbk") %>"/></td>
	    -->
	    <td><input name="clinkman" id="clinkman" style="height:30px;font-size:16px"
	    	 value="<%= ci.getClinkman() %>"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">公司地址:</td>
	    	    <!--
	     <td><input name="caddress" id="caddress"
	    	 value="<%= new String(ci.getCaddress().getBytes("ISO-8859-1"),"gbk") %>"/></td>
	    -->
	    <td><input name="caddress" id="caddress" style="height:30px;font-size:16px"
	    	 value="<%= ci.getCaddress() %>"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">公司电话:</td>
	    	    <!--
	 <td><input name="ctel" id="ctel"
	    	 value="<%= new String(ci.getCtel().getBytes("ISO-8859-1"),"gbk") %>"/></td>   
	    -->
	    <td><input name="ctel" id="ctel" style="height:30px;font-size:16px"
	    	 value="<%= ci.getCtel() %>"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">E-mail:</td>
	    	    <!--
	    <td><input name="cemail" id="cemail"
	    	 value="<%= new String(ci.getCemail().getBytes("ISO-8859-1"),"gbk") %>"/></td>
	    -->
	    <td><input name="cemail" id="cemail" style="height:30px;font-size:16px"
	    	 value="<%= ci.getCemail() %>"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">备&nbsp;&nbsp;&nbsp;&nbsp;注:</td>
	    	    <!--
	    <td><input name="cremark" id="cremark" size="50"
	    	 value="<%= new String(ci.getCremark().getBytes("ISO-8859-1"),"gbk") %>"/></td>
	    -->
	    <td><input name="cremark" id="cremark" size="50" style="height:30px;font-size:16px"
	    	 value="<%= ci.getCremark() %>"/></td>
	  </tr>
	</table>
	<table align="center" height="70px">
	  <tr>
	    <td><img border="0" src="img/xg.gif" id="xg" onclick="JavaScript:check()"
          	  style="cursor:hand"/></td>
          	  <td width="20%"></td>
	    <td><img border="0" src="img/cz.gif" id="cz" onclick="JavaScript:document.all.mf.reset()"
          	  style="cursor:hand"></td>
	  </tr>
	</table>
	<input type="hidden" name="action" value="modifyConsumer"/>
	<input type="hidden" name="cid" value="<%= ci.getCid() %>"/>
	<input type="hidden" name="cname" value="<%= new String(ci.getCname().getBytes("ISO-8859-1"),"gbk") %>"/>
	</form>
  </body>
</html>