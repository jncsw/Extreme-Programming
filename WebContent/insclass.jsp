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
//���������� 
	String driverName = "com.mysql.jdbc.Driver";
	//���ݿ��û��� 
	String userName = "root";
	//���� 
	String userPasswd = "sduonline";
	//���ݿ��� 
	String dbName = "ext";
	//���� 
	String tableName = "lessons";
	//�����ַ��� 
	String url = "jdbc:mysql://localhost:3307/" + dbName + "?user=" + userName + "&password=" + userPasswd;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection(url);
	String sql = "SELECT * FROM lessons WHERE name = '"+"111"+"'";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt = conn.prepareStatement(sql);
   ResultSet  rs = pstmt.executeQuery();
   if(rs.next()){
      out.println(rs.getString(2));
      out.println(rs.getString(3));
   }
   pstmt.close();
	  conn.close();
  

%>

 
</body>
</html>