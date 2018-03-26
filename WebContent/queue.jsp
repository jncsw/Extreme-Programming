<%@ page contentType="text/html; charset=gb2312"%>
<%@ page language="java"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%! String trans(String str)
{
	String result=null;
	byte temp[];
	try
	{
		temp=str.getBytes("gb2312");
		result=new String(temp);		
	}
	catch(UnsupportedEncodingException e)
	{
		System.out.println(e.toString());
		
	}return result;
}

%>

<html>
<head>
<title>查询个人信息</title>

<style>

//html{width:100%;height:100%;}
body{background:#fff;font-size:18px;font-family:"Arial", "Tahoma", "微软雅黑", "雅黑";line-height:18px;padding:0px;margin:0px;text-align:center;}
div{padding:18px}
input, button{font-family:"Arial", "Tahoma", "微软雅黑", "雅黑";border:0;vertical-align:middle;margin:8px;line-height:18px;font-size:18px}

</style>
<style type="text/css">	
body{
  background-color:#83c887;
  }
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
		
		</style>
		<style type="text/css">
body {
				font-family: Arial, Verdana, sans-serif;
				color: #111111;}
			table {
				width: 600px;}
			th, td {
				padding: 7px 10px 10px 10px;}
			th {
				text-transform: uppercase;
				letter-spacing: 0.1em;
				font-size: 90%;
				border-bottom: 2px solid #111111;
				border-top: 1px solid #999;
				text-align: left;}
			tr.even {
				background-color: #efefef;}
			tr:hover {
				background-color: #c3e6e5;}
			</style>
</head>
<body>
<br>
<h1 align="center"><strong>个人信息</strong></h1>
<br><br><hr>
<table width="800"border="1"align="center">
<tr>
  <td>用户名</td>
  <td>真实姓名</td>
  <td>性别</td>
  <td>生日</td>
  <td>电话</td>
  <td>邮箱</td>
  <td>最后登录日期</td>
  <td>注册时间</td>
  </tr>
  

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
	Connection conn = DriverManager.getConnection(url);
	String nam=request.getParameter("names");	
	String sql = "select * from userinfo where name = '"+nam+"' ";
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(sql);
	
	   if(rs.next()){
	    %>
	    <tr>
	      <td><%=trans(rs.getString("name")) %></td>
	      <td><%=trans(rs.getString("realname")) %></td>
	      <td><%=trans(rs.getString("sex")) %></td>
	      <td><%=trans(rs.getString("birthday")) %></td>
	      <td><%=trans(rs.getString("tel")) %></td>
	      <td><%=trans(rs.getString("mail")) %></td>
	      <td><%=trans(rs.getString("logintime")) %></td>
	      <td><%=trans(rs.getString("regtime")) %></td>
	      </tr>
	      <%
	      
	 
	   }
	
	rs.close();
	stmt.close();
	conn.close();
%>
</table>
</body>
</html>
