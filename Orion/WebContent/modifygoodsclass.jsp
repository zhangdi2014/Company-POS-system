<%@ page contentType="text/html;charset=UTF-8" 
	import="com.entity.GoodsClassInfo"
%>
 <html>
   <head>
     <title>查看/修改类别</title>
     <script language="JavaScript" src="script/trim.js"></script>
     <script language="JavaScript">
       function check(){
       	 var gcname = document.all.gcname.value.trim();
       	 if(gcname==""){
       	 	alert("类别名称不能为空!!!");
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
        <font color="#FFFFFF" size="5">商品类别管理</font>
        <font color="#FFFFFF" size="2">--类别修改</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="javascript:history.back()">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<% 
		GoodsClassInfo gci = (GoodsClassInfo)request.getAttribute("object");
	 %>
	<hr color="black" size="1"/>
	<form action="ManageServlet" method="post" id="mf">
	<table width="80%" border="0" cellspacing="1" bgcolor="black" align="center">	
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">类别名称:</td>
	    
	    <td><input size="20" style="height:30px;font-size:16px" name="gcname" id="gcname" value="<%= gci.getGcname() %>"/></td>
	  </tr>	
	</table>
	<br/><br/>
	<table align="center" width="70%">
	  <tr>
	    <td align="right"><img border="0" src="img/xg.gif" id="xg" onclick="JavaScript:check()"
          	  style="cursor:hand"/></td>
          	  <td width="5%"></td>
	    <td align="left"><img border="0" src="img/cz.gif" id="cz" onclick="JavaScript:document.all.mf.reset()"
          	  style="cursor:hand"/></td>
	  </tr>
	</table>
	<input type="hidden" name="action" value="modifyGoodsClass"/>
	<input type="hidden" name="gcid" value="<%= gci.getGcid() %>"/>
	</form>
   </body>
 </html>