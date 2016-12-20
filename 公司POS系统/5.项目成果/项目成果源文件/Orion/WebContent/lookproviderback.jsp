<%@ page contentType="text/html;charset=UTF-8"
	import="com.entity.ProviderBack,com.entity.ProviderBackDetail,java.util.*,com.db.DButil,
		org.springframework.web.context.*,org.springframework.web.context.support.*,
		com.entity.ProviderInfo,com.entity.GoodsInfo"
 %>
<% 
	ProviderBack pb = (ProviderBack)request.getAttribute("pb");
	List<ProviderBackDetail> list = (List<ProviderBackDetail>)request.getAttribute("list");
	//获取WebApplicationContext
	WebApplicationContext wac=
	   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	DButil db = (DButil)wac.getBean("DButil");
	ProviderInfo pi = (ProviderInfo)db.getObject("ProviderInfo",pb.getPid());
 %>
<html>
  <head>
    <title>明细查看</title>   
  </head>
  <body>
 	<jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">采购退货管理</font>
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
	<caption style="color:white;font-size:22px">退货信息</caption>
	  <tr bgcolor="#D1F1FE" align="center" height="40px">
	    <th>表单号</th>
	    <th>供应商</th>
	    <th>采购表号</th>
	  	<th>退货时间</th>	
	  </tr>
	  <tr bgcolor="white" align="center" height="40px">
	     <td><%= pb.getPbid() %></td>
	
	     <td><%= pi.getPname() %></td>
	     <td><%= pb.getSid() %></td>
	     <td><%= (pb.getPbdate().getYear()+1900)+"-"+
	     		(pb.getPbdate().getMonth()+1)+"-"+(pb.getPbdate().getDate()) %></td>
	  </tr>
	</table>
	<% 
		if(!list.isEmpty()){
	 %>
	 <br/>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	<caption style="color:white;font-size:22px">退货明细</caption>
	  <tr bgcolor="#D1F1FE" align="center" height="40px">
	    <th>商品名称</th>
	    <th>商品数量</th>
	    <th>商品进价</th>
	    <th>商品总价</th>
	  </tr>
	  <% 
	  	int i = 0;
	  	for(ProviderBackDetail pbd:list){
		GoodsInfo gi = (GoodsInfo)db.getObject("GoodsInfo",pbd.getGid());
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
	  	<td><%= pbd.getPbdamount() %></td>
	  	<td><%= pbd.getPbdprice() %></td>
	  	<td><%= pbd.getPbdtotalprice() %></td>
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