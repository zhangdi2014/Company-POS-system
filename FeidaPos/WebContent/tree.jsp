<%@ page contentType="text/html;charset=gbk"  %>
<html>
  <head>
    <title>�����б�</title>
    <link rel=stylesheet href="css/tree.css" type="text/css">
    <script language="JavaScript">    
      function menuFix() {
    	  var obj = document.getElementById("nav").getElementsByTagName("li");
    	  
    	  for (var i=0; i<obj.length; i++) {
    	   obj[i].onmouseover=function() {
    	    this.className+=(this.className.length>0? " ": "") + "sfhover";
    	   }
    	   obj[i].onMouseDown=function() {
    	    this.className+=(this.className.length>0? " ": "") + "sfhover";
    	   }
    	   obj[i].onMouseUp=function() {
    	    this.className+=(this.className.length>0? " ": "") + "sfhover";
    	   }
    	   obj[i].onmouseout=function() {
    	    this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
    	   }
    	  }
    	 }
    	 function DoMenu(emid)
    	 {
    	  var obj = document.getElementById(emid); 
    	  obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
    	  if((LastLeftID!="")&&(emid!=LastLeftID)) //�ر���һ��Menu
    	  {
    	   document.getElementById(LastLeftID).className = "collapsed";
    	  }
    	  LastLeftID = emid;
    	 }
    	 function GetMenuID()
    	 {
    	  var MenuID="";
    	  var _paramStr = new String(window.location.href);
    	  var _sharpPos = _paramStr.indexOf("#");
    	  
    	  if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
    	  {
    	   _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
    	  }
    	  else
    	  {
    	   _paramStr = "";
    	  }
    	  
    	  if (_paramStr.length > 0)
    	  {
    	   var _paramArr = _paramStr.split("&");
    	   if (_paramArr.length>0)
    	   {
    	    var _paramKeyVal = _paramArr[0].split("=");
    	    if (_paramKeyVal.length>0)
    	    {
    	     MenuID = _paramKeyVal[1];
    	    }
    	   }
    	  }
    	  
    	  if(MenuID!="")
    	  {
    	   DoMenu(MenuID)
    	  }
    	 }
    	 GetMenuID(); //*������function��˳��Ҫע��һ�£���Ȼ��Firefox��GetMenuID()����Ч��
    	 menuFix();
    </script>
  </head>
  <body style="background: url(img/f4.jpg) no-repeat;background-size:100% 100%">
    <jsp:useBean id="userBean" class="com.orion.UserBean" scope="session"/>
    <div id="PARENT">
<ul id="nav">
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">������Ϣ</a>
  <ul id="ChildMenu1" class="collapsed">
    <li><a href="ManageServlet?action=search&key=&type=goodsinfo" target="mainFrame">��Ʒ����</a></li>
    <li><a href="ManageServlet?action=search&key=&type=goodsclassinfo" target="mainFrame">��Ʒ���</a></li>
    <li><a href="ManageServlet?action=search&key=&type=consumerinfo" target="mainFrame">�ͻ�����</a></li>
    <li><a href="ManageServlet?action=search&key=&type=providerinfo" target="mainFrame">��Ӧ������</a></li>
  </ul>
</li>
<li><a href="#Menu=ChildMenu2" onclick="DoMenu('ChildMenu2')">ҵ����</a>
  <ul id="ChildMenu2" class="collapsed">
    <li><a href="#Menu=ChildMenu5" onclick="DoMenu('ChildMenu5')">��Ʒ�ɹ�</a>
      <ul id="ChildMenu5" class="collapsed">
        <li><a href="ManageServlet?action=search&key=&type=stockinfo" target="mainFrame">�ɹ���Ϣ</a></li>
        <li><a href="ManageServlet?action=search&key=&type=providerback" target="mainFrame">�ɹ��˻�</a></li>
      </ul>
    </li>
    <li><a href="#Menu=ChildMenu6" onclick="DoMenu('ChildMenu6')">��Ʒ����</a>
      <ul id="ChildMenu6" class="collapsed">
        <li><a href="ManageServlet?action=search&key=&type=sellinfo" target="mainFrame">������Ϣ</a></li>
        <li><a href="ManageServlet?action=search&key=&type=consumerback" target="mainFrame">�����˻�</a></li>
      </ul>
    </li>
  </ul>
</li>
<li><a href="#Menu=ChildMenu3" onclick="DoMenu('ChildMenu3')">ҵ��ͳ��</a>
  <ul id="ChildMenu3" class="collapsed">
    <li><a href="statistic.jsp" target="mainFrame">���ͳ��</a></li>
  </ul>
</li>
<li><a href="#Menu=ChildMenu4" onclick="DoMenu('ChildMenu4')">ϵͳ����</a>
  <ul id="ChildMenu4" class="collapsed">
    <li><a href="ManageServlet?action=search&key=&type=admininfo" target="mainFrame">ϵͳά��</a></li>
  </ul>
</li>
</ul>
</div>
  </body>
</html>