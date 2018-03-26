<%@ page contentType="text/html; charset=gb2312"%>
<%@ page language="java"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<html>
<head>

<style>

//html{width:100%;height:100%;}
body{background:#fff;font-size:18px;font-family:"Arial", "Tahoma", "微软雅黑", "雅黑";line-height:18px;padding:0px;margin:0px;text-align:center;}
div{padding:18px}
input, button{font-family:"Arial", "Tahoma", "微软雅黑", "雅黑";border:0;vertical-align:middle;margin:8px;line-height:18px;font-size:18px}

</style>
<style type="text/css">	
			input {
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
		body{
  background-color:#83c887;
  }
		</style>
<title>
更新数据
</title>
</head>
<body>
<br>
<h1 align="center"><strong>更新数据</strong></h1>
<hr /><br><br>

<%
	//驱动程序名 
	String driverName = "com.mysql.jdbc.Driver";
	//数据库用户名 
	String userName = "root";
	//密码 
	String userPasswd = "sduonline";
	//数据库名 
	String dbName = "stu";
	//表名 
	String tableName = "userinfo";
	//联结字符串 
	String url = "jdbc:mysql://localhost:3307/" + dbName + "?user=" + userName + "&password=" + userPasswd;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection(url);
	String ss=request.getParameter("upda");
	String valuu=request.getParameter("text");
	String valu= new String(valuu.getBytes("ISO-8859-1"), "gb2312");
	String n=request.getParameter("ne");
	Statement stmt=connection.createStatement();
	String sql1="update userinfo set "+ss+"='"+valu+"' where name='"+n+"'";
	//out.print(sql1);
	stmt.executeUpdate(sql1);
	out.print("<h2 align='center'>修改成功！</h2>");
	
	
	
	stmt.close();
    connection.close();
    
%>


</body>
</html>

