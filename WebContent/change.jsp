<%@ page contentType="text/html; charset=gb2312"%>
<%@ page language="java"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<script language ="javascript">
function on_submit()
 {	
	
	var ss = document.getElementById("upda").selectedIndex;
		if (ss=="5") {if (form2.text.value == "")
    {
     alert("用户密码不能为空，请输入密码！");
     form2.text.focus();
     return false; 
    }}
	
	if (ss=="1") {if (form2.text.value != "男") {if (form2.text.value != "女")
    {
     alert("请输入性别 男/女!");
     form2.text.value="";
     form2.text.focus();
     return false;  
    }}}
	if (ss=="5") {if (form2.text.value.length<5)
    {
     alert("密码最短5位，请重新输入密码！");
     form2.text.value="";
     form2.text.focus();
     return false;
    }
	}
    var strr1=form2.text.value;
    if(ss=="5") { if(escape(strr1).indexOf("%u")>=0){ 
    alert("密码不能包含中文字符！");
    form2.text.value="";
    form2.text.focus();
    return false;
    }       }
    var str=form2.text.value;
    if (ss=="0")  { if(escape(str).indexOf("%u")<0){ 
    alert("请输入真实姓名！");
    form2.text.value="";
    form2.text.focus();
    return false;
    }       }
    
   var data=form2.text.value;
   var patrn=/^[0-9]{4}(-)((0[1-9])|(1[0-2]))(-)(([0-2][1-9])|(3[0-1]))$/; 
   if (ss=="2") { if(!patrn.exec(data)){
    alert("请输入正确的生日(格式：YYYY-MM-DD)！");
    form2.text.focus();
    return false;
   }}
   var maildata=form2.text.value;
   var patrnmail=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
   if (ss=="4")  {if(!patrnmail.exec(maildata)){
    alert("请输入正确的邮箱！");    
    form2.text.focus();
    return false;
   }
   }
   var re = /^[0-9]+.?[0-9]*$/; 
   var nn=form2.text.value;
   if (ss=="3"){ if(!re.exec(nn)){
	    alert("请输入正确的电话号码！");    
	    form2.text.focus();
	    return false;
	   }}
	 }
</script>
<html>
<head>
<title>修改个人信息</title>
<style>
//html{width:100%;height:100%;}
body{background:#fff;font-size:18px;font-family:"Arial", "Tahoma", "微软雅黑", "雅黑";line-height:18px;padding:0px;margin:0px;text-align:center;}
div{padding:18px}
input, button{font-family:"Arial", "Tahoma", ""微软雅黑", "雅黑";border:0;vertical-align:middle;margin:8px;line-height:18px;font-size:18px}
</style>
<style type="text/css">	
            body{
  background-color:#83c887;
  }
			input,select {
				font-size: 120%;
				color: #5a5854;
				background-color: #f2f2f2;
				border: 1px solid #bdbdbd;
				border-radius: 5px;
				padding: 5px 30px 5px 30px;
				background-repeat: no-repeat;
				background-position: 8px 9px;
				//display: block;
				margin-bottom: 10px;}
			input:focus, input:hover {
				background-color: #ffffff;
				border: 1px solid #b1e1e4;}
		
			input#submit {
				color: #444444;
				text-shadow: 0px 1px 1px #ffffff;
				border-bottom: 1px solid #b2b2b2;
				background-color: #b9e4e3;
				background: -webkit-gradient(linear, left top, left bottom, from(#beeae9), to(#a8cfce));
				background: -moz-linear-gradient(top, #beeae9, #a8cfce);
				background: -o-linear-gradient(top, #beeae9, #a8cfce);
				background: -ms-linear-gradient(top, #beeae9, #a8cfce);
				display: inline;
				}
			input#submit:hover {
				color: #111111;
				border: 1px solid #a4a4a4;
				border-top: 1px solid #b2b2b2;
				background-color: #a0dbc4;
				background: -webkit-gradient(linear, left top, left bottom, from(#a8cfce), to(#beeae9));
				background: -moz-linear-gradient(top, #a8cfce, #beeae9);
				background: -o-linear-gradient(top, #a8cfce, #beeae9);
				background: -ms-linear-gradient(top, #a8cfce, #beeae9);
				display: inline;
				}
				input#reset {
				color: #444444;
				text-shadow: 0px 1px 1px #ffffff;
				border-bottom: 1px solid #b2b2b2;
				background-color: #b9e4e3;
				background: -webkit-gradient(linear, left top, left bottom, from(#beeae9), to(#a8cfce));
				background: -moz-linear-gradient(top, #beeae9, #a8cfce);
				background: -o-linear-gradient(top, #beeae9, #a8cfce);
				background: -ms-linear-gradient(top, #beeae9, #a8cfce);
				display: inline;
				}
			input#reset:hover {
				color: #111111;
				border: 1px solid #a4a4a4;
				border-top: 1px solid #b2b2b2;
				background-color: #a0dbc4;
				background: -webkit-gradient(linear, left top, left bottom, from(#a8cfce), to(#beeae9));
				background: -moz-linear-gradient(top, #a8cfce, #beeae9);
				background: -o-linear-gradient(top, #a8cfce, #beeae9);
				background: -ms-linear-gradient(top, #a8cfce, #beeae9);
				display: inline;
				}											
			body {
				background-image: url("images/stdol.png");
				background-repeat: no-repeat;
				background-attachment: fixed;
				color: #665544;
				padding: 0px;}
</style>
</head>
<body>
<br>
<h1 align="center"><strong>修改个人信息</strong></h1>
<hr /><br><br>
<form name="form2" id="form2" method = "post" onSubmit="return on_submit()" action="update.jsp" target="_blank">
<br>			<p align="center">您要将：
			<select name="upda"id="upda">
				<option value="realname">真实姓名</option>
				<option value="sex">性别</option>
				<option value="birthday">生日</option>
				<option value="tel">电话</option>
				<option value="mail">邮箱</option>
				<option value="password">密码</option>
			</select>
			修改为：
			<input type="text" name="text" id="text"maxlength="20"placeholder="请确认修改"required="required">
			<input type="submit"value="修改" name="submit" id="submit" />
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type = "reset" value = "重置"id="reset" />
	        <input type="hidden" name="ne" value="<%=request.getParameter("names")%>" >
			</p>
			
		</form>
</body>
</html>