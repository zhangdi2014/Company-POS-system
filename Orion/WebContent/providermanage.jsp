<%@ page contentType="text/html;charset=UTF-8"
 	import="com.entity.ProviderInfo,com.bean.UserBean,java.util.*"
 %>
<% 
	List<ProviderInfo> list = (List<ProviderInfo>)request.getAttribute("goodslist");
 %>
<html>
  <head>
    <title>供应商资料管理</title>
    <link rel=stylesheet href="css/general.css" type="text/css">
    <script language="JavaScript" src="script/trim.js"></script>
    <script language="JavaScript">
      function check(){
      	var key = document.all.key.value.trim();
      	if(key==""){
			alert("关键字为空,请重新输入!!!");
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
  	<jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
	<table width="100%" height="44" bgcolor="#206AB3">
      <tr align="center"><td><font color="#FFFFFF" size="5">供应商资料管理</font></td></tr>
	</table>
	<table>
	<form action="ManageServlet" method="post" id="smf">
	  <tr>
		<td>
		<table height="42" style="background:url(img/add_sear.jpg) no-repeat">
		  <tr>
		    <td>
		      &nbsp;<img src="img/log.gif" border="0" style="cursor:hand" onclick="document.all.key.focus()"/>
		    </td>
		    <td>
		      <input name="key" id="key" value="请输入要搜索的供应商名称" style="border:0"
		      		 size="28"	onfocus="document.all.key.value=''"/>		    
		    </td>
		    <td width="85" align="right">
		    <img src="img/sear.jpg" id="mg" border="0"
		      style="cursor:hand"
		      onclick="JavaScript:check()"
		      onmousedown="document.all.mg.src='img/sear1.jpg'"
		      onmouseup="document.all.mg.src='img/sear.jpg'"/>
		    </td>
	    	<td align="center" width="90"><a href="addprovider.jsp" target="mainFrame"><font color="white" size="2">添加供应商</font></a></td>
		  </tr>
		</table>
	    </td>
		<td>
	      <input type="hidden" name="action" value="search" />
	      <input type="hidden" name="type" value="providerinfo"/>
	    </td>	   
	  </tr>
	</form>
	</table>
	<hr size="1" width="100%" color="black"/> 
	<% 
		if(list.isEmpty()){
			out.println("<br/><br/><br/><center><h2>没有搜索到你要的供应商!!!</h2></center>");
		}
		else{
	 %>
	<table width="100%" border="0" cellspacing="1" bgcolor="black">
	  <tr bgcolor="#D1F1FE" align="center" height="40px">
	    <th>供应商名称</th>
	    <th>联系人</th>
	    <th>电话</th>
	    <th>查看</th>
	  	<th>修改</th>
	  	<th>删除</th>
	  </tr>
	  <% 
	  	int i = 0;
		for(ProviderInfo pi:list){
			if(i%2==0){
				i++;
				out.println("<tr bgcolor='white' align='center' style='height:40px'>");
			}
			else{
				i++;
				out.println("<tr bgcolor='#EBF5FD' align='center' style='height:40px'>");
			}
	   %>
	
	     <td><%= pi.getPname() %></td>
	     <td><%= pi.getPlinkman() %></td>
	     <td><%= pi.getPtel() %></td> 
	     <td width="100"><a href="ManageServlet?action=lookProvider&type=look&pid=<%= pi.getPid() %>"><img border="0" src="img/look.gif"/>查看</a></td>
	     <td width="100"><a href="ManageServlet?action=lookProvider&type=modify&pid=<%= pi.getPid() %>"><img border="0" src="img/mod.gif" height="16" width="16"/>修改</a></td>
	     <td width="100"><a href="JavaScript:delete_sure('ManageServlet?action=deleteProvider&pid=<%= pi.getPid() %>')"><img border="0" src="img/del.gif"/>删除</a></td>
	   </tr>
	   <% 
	   	}
	    %>	  
    </table>
	<table width="100%" align="center">
	<form method="post" action="ManageServlet" id="mf">
	  <tr>
	    <td align="left">
	      <font size="2" color="white">共<%= userBean.getTotalPage() %>页&nbsp;&nbsp;当前页:<%= userBean.getNowPage() %></font>
	    </td>
	    <td align="right">
	      <% 
	      	if(userBean.getNowPage()>1){
	       %>
	      <a href="ManageServlet?action=changePage&pagename=/providermanage.jsp&page=<%= userBean.getNowPage()-1 %>" target="mainFrame"><input type="button" name="prev" value="上页"></a>
	      <% 
	      	}
	      	if(userBean.getNowPage()<userBean.getTotalPage()){
	       %>	       
	      <a href="ManageServlet?action=changePage&pagename=/providermanage.jsp&page=<%= userBean.getNowPage()+1 %>" target="mainFrame"><input type="button" name="prev" value="下页"></a>
	      <% 
	      	}
	      	else{
	      		out.println("<input type='button' name='next' value='下页' style='visibility:hidden'/>");
	      	}
	       %>
	      <font size="2" color="white">第<input name="page" id="page" size="2" value="<%= userBean.getNowPage() %>" onfocus="document.all.page.value=''"/>页</font>
	      <input type="hidden" name="action" value="changePage" />
	      <input type="hidden" name="pagename" value="/providermanage.jsp"/>
	    </td>
	    <td width="10">
	      <img src="img/go.gif" border="0" style="cursor:hand" onclick="JavaScript:checkPage(<%= userBean.getTotalPage() %>)">
	    </td>
	  </tr>	
	</form>
	</table>  
	<% 
		}
	 %>  
  </body>
</html>