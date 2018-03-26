<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page language="java" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*"%> 
<html>
<head>
<title></title>
</head>
<body>
<%


//驱动程序名 
	String driverName = "com.mysql.jdbc.Driver";
	//数据库用户名 
	String userName = "root";
	//密码 
	String userPasswd = "sduonline";
	//数据库名 
	String dbName = "ext";
	//表名 
	String tableName = "lessons";
	//联结字符串 
	String url = "jdbc:mysql://localhost:3307/" + dbName + "?user=" + userName + "&password=" + userPasswd;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection(url);
	String sql = "SELECT * FROM lessons";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt = conn.prepareStatement(sql);
   ResultSet  rs = pstmt.executeQuery();
   String ss="";
   String s="";
   if(rs.next()){
	  
	   s+=rs.getString(2);
	   ss+=rs.getString(3);
   }
   rs.close();
	  pstmt.close();
	  %>
	  <%
	  ////////////////////////////
	  out.print("<p>"+"教室总数："+s+" "+"</p>");
	  out.print("<P>"+"相应教室为："+ss);

	  %>
	  



<%
	  conn.close();
%>
</body>
</html>