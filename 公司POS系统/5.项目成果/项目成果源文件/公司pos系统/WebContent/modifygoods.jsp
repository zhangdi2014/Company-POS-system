<!-- 修改商品 -->
<%@ page contentType="text/html;charset=UTF-8" 
	import="com.bean.UserBean,org.springframework.web.context.*,
	org.springframework.web.context.support.*,com.db.DButil,java.util.*,
	com.entity.GoodsInfo,com.entity.GoodsClassInfo"
%>
<html>
  <head>
    <title>修改商品</title>
     <script language="JavaScript" src="script/trim.js"></script>
     <script language="JavaScript">
       function check(){
       	 var gunit = document.all.gunit.value.trim();		//得到商品单位
       	 var gpin = document.all.gpin.value.trim();			//得到商品进价
       	 var gpout = document.all.gpout.value.trim();		//得到商品售价
       	 var gamount = document.all.gamount.value.trim();	//得到商品数量
       	 if(gunit==""){										//商品单位为空
       	 	alert("商品单位不可以为空!!!");
       	 	return;
       	 }
       	 var reg = /^([1-9][0-9]*(\.?[0-9]+)?)|(0\.[0-9]+)$/;//定义正则式
       	 if(!reg.test(gpin)){								//当进价格式不对时
       	 	alert("商品进价格式不对!!!");
       	 	return;
       	 }
       	 if(!reg.test(gpout)){								//当售价格式不对时
       	 	alert("商品售价格式不对!!!");
       	 	return;
       	 }
       	 var reg1 = /^[0-9]*$/;								//定义正则式,只匹配整数(除0外)
       	 if(!reg1.test(gamount)){							//库存格式错误
       	 	alert("商品数量格式不对!!!");
       	 	return;
       	 }
       	 document.all.mf.submit();
       }
     </script>
  </head>
  <body>
 	<jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">商品资料管理</font>
        <font color="#FFFFFF" size="2">--商品修改</font>
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
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">商品名称:</td>
	   
	    <td><%= gi.getGname() %></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	  	<td align="center">商品类别:</td>
	  	<td>
      	  <select name="gcname" style="height:30px;width:100px;font-size:16px">
      	  <% 
			//获取WebApplicationContext
			WebApplicationContext wac=
			   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			DButil db = (DButil)wac.getBean("DButil");
			List<String> gcname = db.getGoodsClass();
			GoodsClassInfo gci = (GoodsClassInfo)db.getObject("GoodsClassInfo",gi.getGcid());
			for(String name:gcname){
				//name = new String(name.getBytes("ISO-8859-1"),"gbk");
  	   			String flag = "";
  	   			//if(name.equals(new String(gci.getGcname().getBytes("ISO-8859-1"),"gbk"))){
  	   			if(name.equals(gci.getGcname())){
  	   				flag = "selected";
  	   			}
      	    %>
      	    	<option value="<%= name %>" <%= flag %>><%= name %></option>
      	    <% 
      	    	}
      	     %>
      	  </select>
	  	</td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	  	<td align="center">计量单位:</td>
	  	<td><input name="gunit" style="height:30px" id="gunit" value="<%= gi.getGunit() %>"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	  	<td align="center">进&nbsp;&nbsp;价:</td>
	  	<td><input name="gpin" style="height:30px" id="gpin" value="<%= gi.getGpin() %>"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	  	<td align="center">售&nbsp;&nbsp;价:</td>
	  	<td><input name="gpout" style="height:30px" id="gpout" value="<%= gi.getGpout() %>"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	  	<td align="center">商品数量:</td>
	  	<td><input name="gamount" style="height:30px" id="gamount" value="<%= gi.getGamount() %>"/></td>
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
	<input type="hidden" name="action" value="modifyGoods"/>
	<input type="hidden" name="gid" value="<%= gi.getGid() %>"/>
	<!--
	<input type="hidden" name="gname" value="<%= new String(gi.getGname().getBytes("ISO-8859-1"),"gbk") %>"/>
	-->
	<input type="hidden" name="gname" value="<%= gi.getGname() %>"/>
	</form>
  </body>
</html>