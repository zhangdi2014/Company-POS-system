<%@ page contentType="text/html;charset=UTF-8"
	import="com.bean.UserBean,org.springframework.web.context.*,
	org.springframework.web.context.support.*,com.db.DButil,java.util.*"
 %>
 <html>
   <head>
     <title>添加商品</title>
     <script language="JavaScript" src="script/trim.js"></script>
     <script language="JavaScript">
       function check(){
       	 var gname = document.all.gname.value.trim();		//得到要添加商品的名字
       	 var gunit = document.all.gunit.value.trim();		//得到商品单位
       	 var gpin = document.all.gpin.value.trim();			//得到商品进价
       	 var gpout = document.all.gpout.value.trim();		//得到商品售价
       	 var gamount = document.all.gamount.value.trim();	//得到商品数量
       	 if(gname==""){										//商品名称为空
       	 	alert("商品名称不可以为空!!!");		
       	 	return false;
       	 }
       	 if(gunit==""){										//商品单位为空
       	 	alert("商品单位不可以为空!!!");
       	 	return false;
       	 }
       	 var reg = /^\d+(\.\d+)?$/;							//定义正则式
       	 if(!reg.test(gpin)){								//当进价格式不对时
       	 	alert("商品进价格式不对!!!");
       	 	return false;
       	 }
       	 if(!reg.test(gpout)){								//当售价格式不对时
       	 	alert("商品售价格式不对!!!");
       	 	return false;
       	 }
       	 var reg1 = /^[0-9]*$/;								//定义正则式,只匹配整数
       	 if(!reg1.test(gamount)){							//库存格式错误
       	 	alert("商品数量格式不对!!!");
       	 	return false;
       	 }
       	 if(document.all.gcname.value.trim()==""){
       	 	alert("商品类别不能为空,请添加类别!!!");
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
        <font color="#FFFFFF" size="5">商品资料管理</font>
        <font color="#FFFFFF" size="2">--商品添加</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="javascript:history.back()">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1"/>
	<form action="ManageServlet" method="post" id="mf">
	<table width="80%" border="0" cellspacing="2" bgcolor="black" align="center">	
	  <tr bgcolor="#ebf5fd" height="40px">
	    <td align="center">商品名称:</td>
	    <td><input size="50" style="height:30px;font-size:16px" name="gname" id="gname"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	  	<td align="center">商品类别:</td>
	  	<td >
      	  <select name="gcname" id="gcname" style="height:30px;width:100px;font-size:16px">
      	  <% 
			//获取WebApplicationContext
			WebApplicationContext wac=
			   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			DButil db = (DButil)wac.getBean("DButil");
			List<String> gcname = db.getGoodsClass();
			for(String name:gcname){
      	    %>
      	    	<option value="<%= name %>"><%= name %></option>
      	    <% 
      	    	}
      	     %>
      	  </select>
	  	</td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	  	<td align="center">计量单位:</td>
	  	<td><input size="50" style="height:30px;font-size:16px" name="gunit" id="gunit" /></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	  	<td align="center">进&nbsp;&nbsp;价:</td>
	  	<td><input size="50" style="height:30px;font-size:16px" name="gpin" id="gpin"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	  	<td align="center">售&nbsp;&nbsp;价:</td>
	  	<td><input size="50" style="height:30px;font-size:16px" name="gpout" id="gpout"/></td>
	  </tr>
	  <tr bgcolor="#ebf5fd" height="40px">
	  	<td align="center">商品数量:</td>
	  	<td><input size="50" style="height:30px;font-size:16px" name="gamount" id="gamount"/></td>
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
	<input type="hidden" name="action" value="addGoods"/>
	</form>
   </body>
 </html>