<%@ page contentType="text/html; charset=UTF-8" %>
<html>
  <head>
	<title>修改密码</title>
	<link rel=stylesheet href="css/style.css" type="text/css">
	<script language="JavaScript" src="script/trim.js"></script>
	<script language="JavaScript">
		function check(){
		  if(document.all.aname.value.trim()==""){
		    alert("用户名不能为空!!!");
		    return false;
		  }
		  if(document.all.apwd.value.trim()==""){
		    alert("请输入旧密码!!!");
		    return false;
		  }
		  if(document.all.fpwd.value.trim()==""){
		    alert("新密码不能为空!!!");
		    return false;
		  }
		  if(document.all.fpwd.value.trim()!=document.all.spwd.value.trim()){
		    alert("两次密码输入不一致!!!");
		    return false;
		  }
		  document.all.mf.submit();
		}
	</script>
  </head>
  <body style="background: url(img/f4.jpg) no-repeat;background-size:100% 100%">
  	<div class="out">
  	<!-- <center><br/><br/><br/><br/><br/><h2>修改密码</h2></center> -->
    <div class="login_style">
      <center>
	  <form action="ManageServlet" method="post" id="mf" target="bottom">
	    <table>
	      <tr>
	        <td><b>用户名:</b></td>
	        <td><input name="aname" id="aname"/></td>
	      </tr>
	      <tr>
	        <td><b>密&nbsp;码:</b></td>
	        <td><input type="password" id="apwd" name="apwd" /></td>
	      </tr>
	      <tr>
	        <td><b>新密码:</b></td>
	        <td><input type="password" name="fpwd" id="fpwd"/></td>
	      </tr>
	      <tr>
	        <td><b>确认新密码:</b></td>
	        <td><input type="password" name="spwd" id="spwd"/></td>
	      </tr>
	      <tr heigtht="100%">
	      <tr>
	        <td height="20px"></td>
	      </tr>
		  <tr >
		    <td colspan="4" align="center">
		    <img border="0" src="img/sm.gif" id="xg" onclick="JavaScript:check()"
	          	  style="cursor:hand"/>
	        
		    <img border="0" src="img/cz.gif" id="cz" onclick="JavaScript:document.all.mf.reset()"
	          	  style="cursor:hand"/></td>
		  </tr>
	    </table>
	    <input type="hidden" name="action" value="changepwd"/>
	  </form>
	  </center>
	</div>
	</div>
  </body>
</html>