<!-- 头部设置 -->
<%@ page contentType="text/html;charset=UTF-8" import="com.bean.UserBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="script/top.js"></script>
<script src="script/jquery.js"></script>
		
<title>头部导航栏设置</title>
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel=stylesheet href="css/top.css" type="text/css" media="screen">
<link rel="stylesheet" type="text/css" href="css/adminlogin.css" tppabs="css/adminlogin.css" />
<style>
	body{height:100%;background:gray;}
	canvas{z-index:-1;position:absolute;}
</style>
<script src="script/jquery.js"></script>
<script src="script/verificationNumbers.js" tppabs="script/verificationNumbers.js"></script>
<script src="script/Particleground.js" tppabs="script/Particleground.js"></script>
<script>
		$(document).ready(function() {
		  //粒子背景特效
		  $('body').particleground({
		    dotColor: '#5cbdaa',
		    lineColor: '#5cbdaa'
		  });
		});
</script>
</head>
<body>
 <!--头部开始 -->
<div class="head ">
  <div class="cont">
    <div class="head-left"><a href="#"><img src="img/logo.jpg" alt="" /></a></div>
    <div class="nav"> 
      <!--导航条-->
      <ul class="nav-main">
        <li><a href="main.jsp" target="mainFrame" class="sy">首页</a></li>
        <li id="li-1">基本信息<span></span></li>
        <li id="li-2">业务处理<span></span></li>
        <li id="li-3">业务统计<span></span></li>
        <li id="li-4">系统管理<span></span></li>
      </ul>
      <!--隐藏盒子-->
      <div id="box-1" class="hidden-box hidden-loc-box01" >
        <ul>
          <li><a href="ManageServlet?action=search&key=&type=goodsinfo" target="mainFrame" class="ej">商品资料</a></li>
          <li><a href="ManageServlet?action=search&key=&type=goodsclassinfo" target="mainFrame" class="ej">商品类别</a></li>
          <li><a href="ManageServlet?action=search&key=&type=consumerinfo" target="mainFrame" class="ej">客户资料</a></li>
          <li><a href="ManageServlet?action=search&key=&type=providerinfo" target="mainFrame" class="ej">供应商资料</a></li>
        </ul>
      </div>
      <div id="box-2" class="hidden-box hidden-loc-box02">
        <ul>
          <li><a href="ManageServlet?action=search&key=&type=stockinfo" target="mainFrame" class="ej">采购信息</a></li>
          <li><a href="ManageServlet?action=search&key=&type=providerback" target="mainFrame" class="ej">采购退货</a></li>
          <li><a href="ManageServlet?action=search&key=&type=sellinfo" target="mainFrame" class="ej">销售信息</a></li>
          <li><a href="ManageServlet?action=search&key=&type=consumerback" target="mainFrame" class="ej">销售退货</a></li>
        </ul>
      </div>
      <div id="box-3" class="hidden-box hidden-loc-box03" style="width:150px">
        <ul>
          <li><a href="statistic.jsp" target="mainFrame" class="ej">库存统计</a></li>
        </ul>
      </div>
      <div id="box-4" class="hidden-box hidden-loc-box04" style="width:180px">
        <ul>
          <li><a href="ManageServlet?action=search&key=&type=admininfo" target="mainFrame" class="ej">系统维护</a></li>
          <li><a href="ManageServlet?action=logout" target="_parent" class="ej">注销</a></li>
        </ul>
      </div>
    </div>
    <script type="text/javascript" src="script/main.js"></script> 
  </div>
</div>
<!--头部结束 --> 
</body>
</html>
