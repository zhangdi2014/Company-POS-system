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
    <title>采购查看</title>
  </head>
  <body>
 	<jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">采购信息管理</font>
        <font color="#FFFFFF" size="2">--明细查看</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="JavaScript:history.back()">
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
	    <td><%= (si.getSdate().getYear()+1900)+"-"+(si.getSdate().getMonth()+1)+"-"+(si.getSdate().getDate()) %></td>
		<td><%= si.getStotalprice() %></td>
		<td><%= si.getSbuyer() %></td>
	  </tr>
	</table>
	<% 
		if(!list.isEmpty()){
	 %>
	 <br/>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	<caption style="color:white;font-size:22px">采购明细</caption>
	  <tr bgcolor="#D1F1FE" align="center" height="40px">
	    <th>商品名称</th>
	    <th>商品数量</th>
	    <th>商品单价</th>
	    <th>商品总价</th>
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
	  	<td><%= sd.getSdprice() %></td>
	  	<td><%= sd.getSdtotalprice() %></td>
	  </tr> 
	  <% 
	  	}
	   %>
	</table>
	<% 
		}
	 %>
  </body>
</html>