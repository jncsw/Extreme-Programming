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
	//String tableName = "userinfo";
	//联结字符串 
	String url = "jdbc:mysql://localhost:3307/" + dbName + "?user=" + userName + "&password=" + userPasswd;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection(url);	
	Statement stmt=conn.createStatement();
	String class1=request.getParameter("lesson");
	if (class1=="")class1="NULL";
	String teacher=request.getParameter("teacher");
	if (teacher=="")teacher="NULL";
	String place=request.getParameter("place");
	if (place=="")place="-1";
	String t2=request.getParameter("time");
	String t1=request.getParameter("week");
	String ti=t1+t2;
	  String sql="replace into lessons values(?,?,?,?)";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,class1);
		pstmt.setString(2,teacher);
		pstmt.setString(3,place);
		pstmt.setString(4,ti);
		//out.print(class1+" "+teacher+" "+place+" "+ti);
		pstmt.executeUpdate();
		pstmt.close();		
		        conn.close();
  %>
  <p>Success！</p>
</body>
</html>
