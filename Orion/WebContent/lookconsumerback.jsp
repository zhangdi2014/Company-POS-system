<%@ page contentType="text/html;charset=UTF-8"
	import="com.entity.ConsumerBack,com.entity.ConsumerBackDetail,java.util.*,com.db.DButil,
		org.springframework.web.context.*,org.springframework.web.context.support.*,
		com.entity.ConsumerInfo,com.entity.GoodsInfo"
 %>
<% 
	ConsumerBack cb = (ConsumerBack)request.getAttribute("cb");
	List<ConsumerBackDetail> list = (List<ConsumerBackDetail>)request.getAttribute("list");
	//获取WebApplicationContext
	WebApplicationContext wac=
	   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	DButil db = (DButil)wac.getBean("DButil");
	ConsumerInfo ci = (ConsumerInfo)db.getObject("ConsumerInfo",cb.getCid());
 %>
<html>
  <head>
    <title>退货查看</title>  
  </head>
  <body style="background: url(img/f4.jpg) no-repeat;background-size:100% 100%">
 	<jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">客户退货管理</font>
        <font color="#FFFFFF" size="2">--退货查看</font>
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
	    <th>客户名称</th>
	    <th>销售表号</th>
	  	<th>退货时间</th>	
	  </tr>
	  <tr bgcolor="white" align="center" height="40px">
	     <td><%= cb.getCbid() %></td>
	    
	     <td><%= ci.getCname() %></td>
	     <td><%= cb.getEid() %></td>
	     <td><%= (cb.getCbdate().getYear()+1900)+"-"+
	     		(cb.getCbdate().getMonth()+1)+"-"+(cb.getCbdate().getDate()) %></td>
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
	    <th>商品售价</th>
	    <th>商品总价</th>
	  </tr>
	  <% 
	  	int i = 0;
	  	for(ConsumerBackDetail cbd:list){
	  	System.out.println(cbd.getCbdprice());
		GoodsInfo gi = (GoodsInfo)db.getObject("GoodsInfo",cbd.getGid());
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
	  	<td><%= cbd.getCbdamount() %></td>
	  	<td><%= cbd.getCbdprice() %></td>
	  	<td><%= cbd.getCbdtotalprice() %></td>
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