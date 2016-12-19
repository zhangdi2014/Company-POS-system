<%@ page contentType="text/html;charset=UTF-8"
	import="com.entity.StockInfo,com.entity.StockDetail,java.util.*,com.db.DButil,
		org.springframework.web.context.*,org.springframework.web.context.support.*,
		com.entity.ProviderInfo,com.entity.GoodsInfo"
 %>
<% 
	StockInfo si = (StockInfo)request.getAttribute("si");
	List<StockDetail> list = (List<StockDetail>)request.getAttribute("list");
	//获取WebApplicationContext
	WebApplicationContext wac=
	   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	DButil db = (DButil)wac.getBean("DButil");
	ProviderInfo pi = (ProviderInfo)db.getObject("ProviderInfo",si.getPid());
 %>
<html>
  <head>
    <title>采购明细</title>
    <script language="JavaScript" src="script/trim.js"></script>
    <script>
      function check(){
      	if(document.all.gname.value.trim()==""){
      		alert("商品名称不能为空,请添加商品!!!");
      		return false;
      	}
      	var reg = /^[1-9][0-9]*$/;
      	if(!reg.test(document.all.sdamount.value.trim())){
      	  	alert("数量格式不对,请重新输入!!!");
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
        <font color="#FFFFFF" size="5">采购信息管理</font>
        <font color="#FFFFFF" size="2">--明细添加</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="ManageServlet?action=changePage&page=<%= userBean.getNowPage() %>&pagename=/stockmanage.jsp">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1"/>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	<caption style="color:white;font-size:22px">采购信息</caption>
	  <tr bgcolor="#D1F1FE" align="center" height="40px">
	    <th>表单号</th>
	    <th>供应商</th>
	    <th>采购日期</th>
	  	<th>总价</th>
	  	<th>采购人</th>
	  </tr>
	  <tr bgcolor="white" align="center" height="40px">
		<td><%= si.getSid() %></td>
		<td><%= pi.getPname() %></td>
	     <td><%= (si.getSdate().getYear()+1900)+"-"+
	     		(si.getSdate().getMonth()+1)+"-"+(si.getSdate().getDate()) %></td>
		<td><%= si.getStotalprice() %></td>
		<td><%= new String(si.getSbuyer()) %></td>
	  </tr>
	</table>
	<form method="post" action="ManageServlet" id="mf">
	<br/>
	<font color="white" size="3">请在下表添加采购商品</font>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	<caption style="color:white;font-size:22px">采购明细</caption>
	  <tr bgcolor="#D1F1FE" align="center" height="40px">
	    <th>商品名称</th>
	    <th>商品数量</th>
	    <th>添加</th>
	  </tr>
	  <% 
	  	int i = 0;
	  	for(StockDetail sd:list){
		GoodsInfo gi = (GoodsInfo)db.getObject("GoodsInfo",sd.getGid());
		if(i%2==0){
			i++;
			out.println("<tr bgcolor='white' align='center' style='height:40px'>");
		}
		else{
			i++;
			out.println("<tr bgcolor='#EBF5FD' align='center' style='height:40px'>");
		}
	   %>
	  	<td><%= gi.getGname() %></td>
	  	<td><%= sd.getSdamount() %></td>
	  	<td>--</td>
	  </tr> 
	  <% 
	  	}
	   %>
	  <tr bgcolor="white" align="center" height="40px">
	    <td>
      	  <select name="gname" id="gname" style="height:30px;font-size:16px">
      	  <% 
			List<String> gname = db.getGoods();
			for(String name:gname){
				//name = new String(name.getBytes("ISO-8859-1"),"gbk");
      	    %>
      	    	<option value="<%= name %>"><%= name %></option>
      	    <% 
      	    	}
      	     %>
      	  </select>
	    </td>
	    <td><input name="sdamount" id="sdamount" style="height:30px;font-size:16px"/></td>
	    <td><img border="0" src="img/tj.gif" id="tj" onclick="JavaScript:check()"
          	  style="cursor:hand"/></td>
	  </tr>
	  <input type="hidden" name="action" value="addStockDetail"/>
	  <input type="hidden" name="sid" value="<%= si.getSid() %>"/>
	</table>
	</form>
  </body>
</html>