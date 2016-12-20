<%@ page contentType="text/html;charset=UTF-8"
	import="com.bean.UserBean,org.springframework.web.context.*,
	org.springframework.web.context.support.*,com.db.DButil,java.util.*"
 %>
<html>
  <head>
    <title>采购信息添加</title>
    <script language="JavaScript" src="script/trim.js"></script>
    <script language="JavaScript">
      function check(){
        var reg = /^\d+(\.\d+)?$/;
        var stp = document.all.stp.value.trim();
      	if(!reg.test(stp)){
      	  alert("采购总价格式不对,请重新输入!!!");
      	  return false;
      	}
      	if(document.all.sbuyer.value.trim()==""){
      	  alert("采购人不能为空!!!");
      	  return false;
      	}
      	if(document.all.pname.value.trim()==""){
      	  alert("供应商不能为空,请添加供应商!!!");
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
        <font color="#FFFFFF" size="5">采购信息管理</font>
        <font color="#FFFFFF" size="2">--采购添加</font>
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
	    <td align="center">供&nbsp;应&nbsp;商:</td>
	    <td>
      	  <select name="pname" id="pname" style="height:30px;font-size:16px">
      	  <% 
			//获取WebApplicationContext
			WebApplicationContext wac=
			   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			DButil db = (DButil)wac.getBean("DButil");
			List<String> pname = db.getProvider();
			for(String name:pname){
      	    %>
      	    	<option value="<%= name %>"><%= name %></option>
      	    <% 
      	    	}
      	     %>
      	  </select>
	    </td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center" style="font-size:16px">采购总价:</td>
	    <td><input  style="height:30px;font-size:16px" name="stp" id="stp"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">采&nbsp;购&nbsp;人:</td>
	    <td><input style="height:30px;font-size:16px" name="sbuyer" id="sbuyer"/></td>
	  </tr>
	</table>
	<br/><br/>
	<table align="center">
	  <tr>
	    <td align="right">
	    <img border="0" src="img/xg.gif" id="xg" onclick="JavaScript:check()"
          	  style="cursor:hand"/>
	    </td>
	    <td width="20%"></td>
	    <td align="left">
	    <img border="0" src="img/cz.gif" id="cz" onclick="JavaScript:document.all.mf.reset()"
          	  style="cursor:hand"/>
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="action" value="addStock"/>
	</form>
  </body>
</html>