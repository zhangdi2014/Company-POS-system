<%@ page contentType="text/html;charset=UTF-8"
	import="com.entity.SellInfo,com.entity.SellDetail,java.util.*,com.db.DButil,
		org.springframework.web.context.*,org.springframework.web.context.support.*,
		com.entity.ConsumerInfo,com.entity.GoodsInfo"
 %>
<% 
	SellInfo ei = (SellInfo)request.getAttribute("ei");
	List<SellDetail> list = (List<SellDetail>)request.getAttribute("list");
	//获取WebApplicationContext
	WebApplicationContext wac=
	   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	DButil db = (DButil)wac.getBean("DButil");
	ConsumerInfo ci = (ConsumerInfo)db.getObject("ConsumerInfo",ei.getCid());
	String day = (ei.getEdate().getYear()+1900)+"-"+(ei.getEdate().getMonth()+1)
							+"-"+(ei.getEdate().getDate());
 %>
<html>
  <head>
    <title>销售修改</title>
    <link rel=stylesheet href="css/general.css" type="text/css">
    <script language="JavaScript" src="script/trim.js"></script>
    <script language="JavaScript">
      function checkInfo(){
      	var date = document.all.edate.value.trim();
      	reg = /^\d{4}-((0?[1-9])|(1[0-2]))-((0?[1-9])|([1-2][0-9])|(3[0-1]))$/
      	if(!reg.test(date)){
      		alert("日期格式不对,应为yyyy-mm-dd");
      		return;
      	}
      	if(document.all.eseller.value.trim()==""){
      		alert("采购人不能为空!!!");
      		return;
      	}    	
      	document.all.mf.submit();
      }
      function checkDetail(myform,amount){
      	reg = /^[1-9][0-9]*$/
      	if(!reg.test(amount.trim())){
      		alert("商品数量格式不对!!!");
      		return;
      	}
      	myform.submit();
      }
    </script>
  </head>
  <body style="background: url(img/f4.jpg) no-repeat;background-size:100% 100%">
 	<jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td>
        <font color="#FFFFFF" size="5">销售信息管理</font>
        <font color="#FFFFFF" size="2">--销售修改</font>
      </td></tr>
	</table>
	<table>
	  <tr><td><a href="ManageServlet?action=changePage&page=<%= userBean.getNowPage() %>&pagename=/sellmanage.jsp">
	    <img border="0" src="img/back.jpg"/></a>
	  </td></tr>
	</table>
	<hr color="black" size="1"/>
	<form method="post" action="ManageServlet" id="mf">
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	<caption style="color:white;font-size:22px">销售信息</caption>
	  <tr bgcolor="#D1F1FE" align="center" height="40px">
	    <th>表&nbsp;单&nbsp;号</th>
	    <th>客户名称</th>
	    <th>销售日期</th>
	  	<th>销售总价</th>
	  	<th>销&nbsp;售&nbsp;人</th>
	  </tr>
	  <tr bgcolor="white" align="center" height="40px">
		<td><%= ei.getEid() %></td>
		<td>
      	  <select name="cname">
      	  <% 
			List<String> cname = db.getConsumer();
			for(String name:cname){
				//name = new String(name.getBytes("ISO-8859-1"),"gbk");
  	   			String flag = "";
  	   			if(name.equals(new String(ci.getCname().getBytes("ISO-8859-1"),"gbk"))){
  	   				flag = "selected";
  	   			}
      	    %>
      	    	<option value="<%= name %>" <%= flag %>><%= name %></option>
      	    <% 
      	    	}
      	     %>
      	  </select>
		</td>
	     <td><input name="edate" id="edate" value="<%= day %>"/></td>
		<td><%= ei.getEtotalprice() %></td>
		<!--
		<td><input name="eseller" id="eseller" value="<%= new String(ei.getEseller().getBytes("ISO-8859-1"),"gbk") %>" /></td>
		-->
		<td><input name="eseller" id="eseller" value="<%= ei.getEseller()%>" /></td>
	  </tr>
	</table>
	<br/><br/>
	<table align="center">
	  <tr>
	    <td><img border="0" src="img/xg.gif" id="xg" onclick="JavaScript:checkInfo()"
          	  style="cursor:hand"/></td>
        <td width="20%"></td>
	    <td><img border="0" src="img/cz.gif" id="cz" onclick="JavaScript:document.all.mf.reset()"
          	  style="cursor:hand"/></td>
	  </tr>
	  <input type="hidden" name="action" value="modifySell"/>
	  <input type="hidden" name="eid" value="<%= ei.getEid() %>"/>
	</table>
	</form>
	<% 
		if(!list.isEmpty()){
	 %>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	<caption style="color:white;font-size:22px">销售明细</caption>
	  <tr bgcolor="#D1F1FE" align="center" height="40px">
	    <th>商品名称</th>
	    <th>商品数量</th>
	    <th>商品单价</th>
	    <th>商品总价</th>
	    <th>修&nbsp;&nbsp;改</th>
	    <th>删&nbsp;&nbsp;除</th>
	  </tr>
	  <% 
	  	int i = 0;
	  	for(SellDetail ed:list){
		GoodsInfo gi = (GoodsInfo)db.getObject("GoodsInfo",ed.getGid());
		if(i%2==0){
			i++;
			out.println("<tr bgcolor='white' align='center' style='height:40px'>");
		}
		else{
			i++;
			out.println("<tr bgcolor='#EBF5FD' align='center' style='height:40px'>");
		}
	   %>
	   	<form id="mfd<%= i %>" method="post" action="ManageServlet">
	   	<input type="hidden" name="action" value="modifySellDetail"/>
	   	<input type="hidden" name="edid" value="<%= ed.getEdid() %>"/>
	  	<td><%= new String(gi.getGname().getBytes("ISO-8859-1"),"gbk") %></td>
	  	<td><input name="edamount" id="amount<%= i %>" value="<%= ed.getEdamount() %>"/></td>
	  	<td><%= ed.getEdprice() %></td>
	  	<td><%= ed.getEdtotalprice() %></td>
	  	<td width="100"><a href="JavaScript:checkDetail(document.all.mfd<%= i %>,document.all.amount<%= i %>.value)"><img border="0" src="img/mod.gif" height="16" width="16"/>修改</a></td>
	  	<td width="100"><a href="JavaScript:delete_sure('ManageServlet?action=deleteSellDetail&edid=<%= ed.getEdid() %>&eid=<%= ed.getEid() %>')"><img border="0" src="img/del.gif"/>删除</a></td>
	 	</form>
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