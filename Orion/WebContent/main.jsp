<%@ page contentType="text/html;charset=gbk" 
	import="com.db.DButil"
%>
<html>
  <head>
    <title>ʾ��</title>
    <link rel=stylesheet href="css/main.css" type="text/css" media="screen">
  </head>
  <body>
    <jsp:useBean id="userBean" class="com.bean.UserBean" scope="session"/>
    <div class="container">
	<ul class="navigation">
		<li>
			<a href="ManageServlet?action=search&key=&type=goodsinfo" target="mainFrame" class="to top">
				<i class="fa fa-home"><img src="img/spzl.gif" /></i>
				<span>��Ʒ����</span>
			</a>
		</li>
		<li>
			<a href="ManageServlet?action=search&key=&type=goodsclassinfo" target="mainFrame" class="to bottom">
				<i class="fa fa-qrcode"><img src="img/splb.gif" /></i>
				<span>��Ʒ���</span>
			</a>
		</li>
		<li>
			<a href="ManageServlet?action=search&key=&type=consumerinfo" target="mainFrame" class="to right">
				<i class="fa fa-flash"><img src="img/khzl.gif" /></i>
				<span>�ͻ�����</span>
			</a>
		</li>
		<li>
			<a href="ManageServlet?action=search&key=&type=providerinfo" target="mainFrame" class="to left">
				<i class="fa fa-pencil"><img src="img/gyszl.gif" /></i>
				<span>��Ӧ������</span>
			</a>
		</li>
		<li>
			<a href="ManageServlet?action=search&key=&type=stockinfo" target="mainFrame" class="to bottom">
				<i class="fa fa-heart"><img src="img/cgxx.gif" /></i>
				<span>�ɹ���Ϣ</span>
			</a>
		</li>
		<li>
			<a href="ManageServlet?action=search&key=&type=providerback" target="mainFrame" class="to top">
				<i class="fa fa-home"><img src="img/cgth.gif" /></i>
				<span>�ɹ��˻�</span>
			</a>
		</li>
		<li>
			<a href="ManageServlet?action=search&key=&type=sellinfo" target="mainFrame" class="to right">
				<i class="fa fa-qrcode"><img src="img/xsxx.gif" /></i>
				<span>������Ϣ</span>
			</a>
		</li>
		<li>
			<a href="ManageServlet?action=search&key=&type=consumerback" target="mainFrame" class="to left">
				<i class="fa fa-flash"><img src="img/xsth.gif" /></i>
				<span>�����˻�</span>
			</a>
		</li>
		<li>
			<a href="ManageServlet?action=search&key=&type=sta" target="mainFrame" class="to top" >
				<i class="fa fa-pencil"><img src="img/kctj.gif" /></i>
				<span>���ͳ��</span>
			</a>
		</li>
		<li>
			<a href="ManageServlet?action=search&key=&type=admininfo" target="mainFrame" class="to bottom">
				<i class="fa fa-heart"><img src="img/xtwh.gif" /></i>
				<span>ϵͳά��</span>
			</a>
		</li>
	</ul>
</div>
  </body>
</html>