<%@ page contentType="text/html;charset=gbk" 
	import="com.db.DButil"
%>
<html>
  <head>
    <title>ʾ��</title>
    <link rel=stylesheet href="css/style.css" type="text/css">
  </head>
  <body style="background: url(img/f4.jpg) no-repeat;background-size:100% 100%">
    <jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
    <center><br/><br/><br/><br/><br/>
    <table width="80%" height="60%">
      <tr align="center" height="150">
        <td><div class="block" >
      	  <a href="ManageServlet?action=search&key=&type=goodsinfo" target="mainFrame"><img src="img/spzl.gif" /></a><p/>
      	  <a href="ManageServlet?action=search&key=&type=goodsinfo" target="mainFrame"><font><b>��Ʒ����</b></font></a>      	        
      	</div></td>
      	<td><div class="block">
      	  <a href="ManageServlet?action=search&key=&type=goodsclassinfo" target="mainFrame"><img src="img/splb.gif" /></a><p/>
      	  <a href="ManageServlet?action=search&key=&type=goodsclassinfo" target="mainFrame"><font><b>��Ʒ���</b></font></a>
      	</div></td>
        <td><div class="block">
      	  <a href="ManageServlet?action=search&key=&type=consumerinfo" target="mainFrame"><img src="img/khzl.gif" /></a><p/>
      	  <a href="ManageServlet?action=search&key=&type=consumerinfo" target="mainFrame"><font><b>�ͻ�����</b></font></a>
      	</div></td>
      	<td><div class="block">
      	  <a href="ManageServlet?action=search&key=&type=providerinfo" target="mainFrame"><img src="img/gyszl.gif" /></a><p/>
      	  <a href="ManageServlet?action=search&key=&type=providerinfo" target="mainFrame"><font><b>��Ӧ������</b></font></a>
      </tr>
      <tr align="center" height="150">
      	<td><div class="block">
      	  <a href="ManageServlet?action=search&key=&type=stockinfo" target="mainFrame"><img src="img/cgxx.gif" /></a><p/>
      	  <a href="ManageServlet?action=search&key=&type=stockinfo" target="mainFrame"><font><b>�ɹ���Ϣ</b></font></a>
      	</div></td>
      	<td><div class="block">
      	  <a href="ManageServlet?action=search&key=&type=providerback" target="mainFrame"><img src="img/cgth.gif" /></a><p/>
      	  <a href="ManageServlet?action=search&key=&type=providerback" target="mainFrame"><font><b>�ɹ��˻�</b></font></a>
      	  </div></td>
      	<td><div class="block">
      	  <a href="ManageServlet?action=search&key=&type=sellinfo" target="mainFrame"><img src="img/xsxx.gif" /></a><p/>
      	  <a href="ManageServlet?action=search&key=&type=sellinfo" target="mainFrame"><font><b>������Ϣ</b></font></a>
      	</div></td>
      	<td><div class="block">
      	  <a href="ManageServlet?action=search&key=&type=consumerback" target="mainFrame"><img src="img/xsth.gif" /></a><p/>
      	  <a href="ManageServlet?action=search&key=&type=consumerback" target="mainFrame"><font><b>�����˻�</b></font></a>
      	</div></td>      	
      </tr>
      <tr align="center" height="150">
      	<td><div class="block">
      	  <a href="statistic.jsp"><img src="img/kctj.gif" /></a><p/>
      	  <a href="statistic.jsp"><font><b>���ͳ��</b></font></a>
      	</div></td>
      	<td><div class="block">
      	  <a href="ManageServlet?action=search&key=&type=admininfo" target="mainFrame"><img src="img/xtwh.gif" /></a><p/>
      	  <a href="ManageServlet?action=search&key=&type=admininfo" target="mainFrame"><font><b>ϵͳά��</b></font></a>
      	</div></td>
      </tr>
    </table>
    </center>
  </body>
</html>