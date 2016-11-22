<%@ page contentType="text/html;charset=gbk"  %>
<html>
  <head>
    <title>树形列表</title>
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
    	  if((LastLeftID!="")&&(emid!=LastLeftID)) //关闭上一个Menu
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
    	 GetMenuID(); //*这两个function的顺序要注意一下，不然在Firefox里GetMenuID()不起效果
    	 menuFix();
    </script>
  </head>
  <body style="background: url(img/f4.jpg) no-repeat;background-size:340px 800px">
    <jsp:useBean id="userBean" class="com.orion.UserBean" scope="session"/>
    <div id="PARENT">
<ul id="nav">
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">基本信息</a>
  <ul id="ChildMenu1" class="collapsed">
    <li><a href="ManageServlet?action=search&key=&type=goodsinfo" target="mainFrame">商品资料</a></li>
    <li><a href="ManageServlet?action=search&key=&type=goodsclassinfo" target="mainFrame">商品类别</a></li>
    <li><a href="ManageServlet?action=search&key=&type=consumerinfo" target="mainFrame">客户资料</a></li>
    <li><a href="ManageServlet?action=search&key=&type=providerinfo" target="mainFrame">供应商资料</a></li>
  </ul>
</li>
<li><a href="#Menu=ChildMenu2" onclick="DoMenu('ChildMenu2')">业务处理</a>
  <ul id="ChildMenu2" class="collapsed">
    <li><a href="#Menu=ChildMenu5" onclick="DoMenu('ChildMenu5')">商品采购</a>
      <ul id="ChildMenu5" class="collapsed">
        <li><a href="ManageServlet?action=search&key=&type=stockinfo" target="mainFrame">采购信息</a></li>
        <li><a href="ManageServlet?action=search&key=&type=providerback" target="mainFrame">采购退货</a></li>
      </ul>
    </li>
    <li><a href="#Menu=ChildMenu6" onclick="DoMenu('ChildMenu6')">商品销售</a>
      <ul id="ChildMenu6" class="collapsed">
        <li><a href="ManageServlet?action=search&key=&type=sellinfo" target="mainFrame">销售信息</a></li>
        <li><a href="ManageServlet?action=search&key=&type=consumerback" target="mainFrame">销售退货</a></li>
      </ul>
    </li>
  </ul>
</li>
<li><a href="#Menu=ChildMenu3" onclick="DoMenu('ChildMenu3')">业务统计</a>
  <ul id="ChildMenu3" class="collapsed">
    <li><a href="statistic.jsp" target="mainFrame">库存统计</a></li>
  </ul>
</li>
<li><a href="#Menu=ChildMenu4" onclick="DoMenu('ChildMenu4')">系统管理</a>
  <ul id="ChildMenu4" class="collapsed">
    <li><a href="ManageServlet?action=search&key=&type=admininfo" target="mainFrame">系统维护</a></li>
  </ul>
</li>
</ul>
</div>
  </body>
</html>