<%@ page contentType="text/html;charset=UTF-8"
	import="com.orion.UserBean,com.orion.GoodsInfo,com.orion.GoodsClassInfo,
			java.util.*,org.springframework.web.context.support.*,
			com.orion.DButil,org.springframework.web.context.*"
 %>
<% 
	List<GoodsInfo> list = (List<GoodsInfo>)request.getAttribute("goodslist");
 %>
<html>
  <head>
    <title>库存统计</title>
    <link rel=stylesheet href="css/general.css" type="text/css">
    <script language="JavaScript" src="script/trim.js"></script>
    <script language="JavaScript">
      function check(){
      	var key = document.all.key.value.trim();
      	var reg = /^\d+$/;
      	if(key==""){
			alert("关键字为空,请重新输入!!!");
			return;
      	}
      	if(!reg.test(key)){
      		alert("请输入数字!!!");
      		return;
      	}
      	document.all.smf.submit();
      }
      function checkPage(temp){
      	var page = document.all.page.value.trim();
  		var reg = /^[1-9][0-9]*$/;
		if((reg.test(page.trim()))&&(page<=temp)){
			document.all.mf.submit();
		}
		else{
			alert("输入不合法,请重新输入!!!");
			return;
		}
      }    
    </script>    
  </head>
  <body style="background: url(img/f4.jpg) no-repeat;background-size:100% 100%">
  	<jsp:useBean id="userBean" class="com.orion.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td><font color="#FFFFFF" size="5">库存统计</font></td></tr>
	</table>	
	<table>
	<form action="ManageServlet" method="post" id="smf">
	  <tr>
	    <td>
		<table height="42" style="background:url(img/sl_sear.jpg) no-repeat">
		  <tr>
		    <td>
		      &nbsp;<img src="img/log.gif" border="0" style="cursor:hand" onclick="document.all.key.focus()"/>
		    </td>
		    <td>
		   <input name="key" id="key" value="请输入要搜索的商品库存数量" style="border:0"
		      		 size="28"	onfocus="document.all.key.value=''"/>		    
		    </td>
		    <td width="86" align="right">
		    <img src="img/sear.jpg" id="mg" border="0"
		      style="cursor:hand"
		      onclick="JavaScript:check()"
		      onmousedown="document.all.mg.src='img/sear1.jpg'"
		      onmouseup="document.all.mg.src='img/sear.jpg'"/>
		    </td>
		    <td width="80" align="right">
 		      <input type="radio" name="myradio" value="more" checked="true"/><font size="2" color="white">大于等于</font>
 		    </td>
	     	<td width="90">
	     	  <input type="radio" name="myradio" value="less"/><font size="2" color="white">小于等于</font>
		    </td>
		  </tr>
		</table>
	    </td>
		<td>
	      <input type="hidden" name="action" value="search" />
	      <input type="hidden" name="type" value="sta"/>
	    </td>	   
	  </tr>
	</form>	
	</table>
	<hr size="1" width="100%" color="black"/>
	<% 
		if(list!=null&&!list.isEmpty()){
	 %>	
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	  <tr bgcolor="#D1F1FE" align="center" height="40px">
	    <th>商品名称</th>
	    <th>类别</th>
	    <th>进价</th>
	  	<th>售价</th>
	  	<th>单位</th>
	  	<th>数量</th>
	  </tr>
	<%
		//获取WebApplicationContext
		WebApplicationContext wac=
		   WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		DButil db = (DButil)wac.getBean("DButil");
		int i = 0;
		for(GoodsInfo gi:list){
		String gname = gi.getGname();
		String gcid = gi.getGcid();
		GoodsClassInfo gci = (GoodsClassInfo)db.getObject("GoodsClassInfo",gcid);
		int gamount = gi.getGamount();
		String gunit = gi.getGunit();
		double gpin = gi.getGpin();
		double gpout = gi.getGpout();
		if(i%2==0){
			i++;
			out.println("<tr bgcolor='white' align='center' style='height:40px'>");
		}
		else{
			i++;
			out.println("<tr bgcolor='#EBF5FD' align='center' style='height:40px'>");
		}
	 %>
	 <!--
	 <td><%= new String(gname.getBytes("ISO-8859-1"),"gbk") %></td>
	 <td><%= new String((gci.getGcname()).getBytes("ISO-8859-1"),"gbk") %></td> 
	 -->
	    <td><%= gname %></td>
	    <td><%= gci.getGcname() %></td>
	    <td>￥<%= gpin %></td>
	    <td>￥<%= gpout %></td>
	    <!--
	    <td><%= new String(gunit.getBytes("ISO-8859-1"),"gbk") %></td>
	    -->
	    <td><%= gunit %></td>
	    <td><%= gamount %></td>
	  </tr>
	<%
		}
	 %>
	</table>
	<br/><br/>
	<table width="100%">
	<form method="post" action="ManageServlet" id="mf">
	  <tr>
	    <td align="left">
	      <font size="2" color="white">共<%= userBean.getTotalPage() %>页&nbsp;&nbsp;当前页:<%= userBean.getNowPage() %></font>
	    </td>
	    <td align="right">
	      <% 
	      	if(userBean.getNowPage()>1){
	       %>
	      <a href="ManageServlet?action=changePage&pagename=/statistic.jsp&page=<%= userBean.getNowPage()-1 %>" target="mainFrame"><input type="button" name="prev" value="上页"></a>
	      <% 
	      	}
	      	if(userBean.getNowPage()<userBean.getTotalPage()){
	       %>	       
	      <a href="ManageServlet?action=changePage&pagename=/statistic.jsp&page=<%= userBean.getNowPage()+1 %>" target="mainFrame"><input type="button" name="next" value="下页"></a>
	      <% 
	      	}
	      	else{
	      		out.println("<img src='img/next.gif' style='visibility:hidden'/>");
	      	}
	       %>
	      <font size="2" color="white">第<input name="page" id="page" size="2" value="<%= userBean.getNowPage() %>" onfocus="document.all.page.value=''"/>页</font>
	      <input type="hidden" name="action" value="changePage" />
	      <input type="hidden" name="pagename" value="/statistic.jsp"/>
	    </td>
	    <td width="10">
	      <img src="img/go.gif" border="0" style="cursor:hand" onclick="JavaScript:checkPage(<%= userBean.getTotalPage() %>)">
	    </td>
	  </tr>	
	</form>
	</table>	
	<% 
		}
		else{
			out.println("<br/><br/><br/><br/><center><h2>没有搜索到符合要求的商品!!!</h2></center>");
		}
	 %>	
  </body>
</html>