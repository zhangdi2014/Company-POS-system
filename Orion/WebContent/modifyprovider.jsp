<%@ page contentType="text/html;charset=UTF-8"
	import="com.entity.ProviderInfo"
 %>
<% 
	ProviderInfo pi = (ProviderInfo)request.getAttribute("object");
 %>
<html>
  <head>
    <title>查看供应商</title>
     <script language="JavaScript" src="script/trim.js"></script>
     <script language="JavaScript">
       function check(){
         if(document.all.plinkman.value.trim()==""){
         	alert("联系人不能为空!!!");
         	return;
         }
         if(document.all.paddress.value.trim()==""){
         	alert("公司地址不能为空!!!");
         	return;
         }
         if(document.all.ptel.value.trim()==""){
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
        <font color="#FFFFFF" size="5">供应商资料管理</font>
        <font color="#FFFFFF" size="2">--供应商修改</font>
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
	    <td align="center">供应商名称:</td>
	
	    <td><%= pi.getPname() %></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">联&nbsp;系&nbsp;人:</td>
	 
	    <td><input name="plinkman" id="plinkman" style="height:30px;font-size:16px" value="<%= pi.getPlinkman() %>"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">公司地址:</td>
	
	    <td><input name="paddress" id="paddress" style="height:30px;font-size:16px" value="<%= pi.getPaddress() %>"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">公司电话:</td>
	    
	
	    <td><input name="ptel" id="ptel" style="height:30px;font-size:16px"
	    	 value="<%= pi.getPtel() %>"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">E-mail:</td>
	
	    <td><input name="pemail" id="pemail" style="height:30px;font-size:16px"
	    	 value="<%= pi.getPemail() %>"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">备&nbsp;&nbsp;&nbsp;&nbsp;注:</td>
	
	    <td><input name="premark" id="premark" size="50" style="height:30px;font-size:16px"
	    	 value="<%= pi.getPremark() %>"/></td>
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
	<input type="hidden" name="action" value="modifyProvider"/>
	<input type="hidden" name="pid" value="<%= pi.getPid() %>"/>

	<input type="hidden" name="pname" value="<%= pi.getPname() %>"/>
	</form>
  </body>
</html>