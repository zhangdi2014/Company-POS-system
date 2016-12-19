<%@ page contentType="text/html;charset=UTF-8" 
	import="org.springframework.web.context.*,com.entity.ConsumerInfo,
	org.springframework.web.context.support.*,com.db.DButil,
	java.util.*,com.bean.UserBean"
%>
<html>
  <head>
    <title>客户退货添加</title>
    <script language="JavaScript" src="script/trim.js"></script>
    <script>
      function check(){
      	if(document.all.eid.value.trim()==""){
      		alert("销售ID不能为空!!!");
      		return false;
      	}
      	document.all.mf.submit();
      }
    </script>
  </head>
  <body>
   <body style="background: url(img/f4.jpg) no-repeat;background-size:100% 100%">
 	<jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">客户退货管理</font>
        <font color="#FFFFFF" size="2">--退货添加</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="javascript:history.back()">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1"/>
    <br/><br/><br/><br/><br/>
    <form action="ManageServlet" method="post" id="mf">
    <center style="color:white;font-size:22px">
      <font color="black">请选择要退货的表单号:</font>
  	  <select name="eid" id="eid" style="height:30px">
  	  <% 
		//获取WebApplicationContext
		WebApplicationContext wac=
		   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		DButil db = (DButil)wac.getBean("DButil");
		String hql = "select ei.eid from SellInfo as ei";
		List<String> eid = (List<String>)db.getInfo(hql);
		for(String name:eid){
			//name = new String(name.getBytes("ISO-8859-1"),"gbk");
  	    %>
  	    	<option value="<%= name %>"><%= name %></option>
  	    <% 
  	    	}
  	     %>
  	  </select>
    <br/><br/><img border="0" src="img/xg.gif" id="xg" onclick="JavaScript:check()"
          	  style="cursor:hand"/>
          	  &nbsp;&nbsp;&nbsp;
	    <img border="0" src="img/cz.gif" id="cz" onclick="JavaScript:document.all.mf.reset()"
          	  style="cursor:hand"/>
    <input type="hidden" name="action" value="addConsumerBack"/>
    </center>
    </form>
  </body>
</html>