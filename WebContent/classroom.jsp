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
	  out.print("<p>"+"����������"+s+" "+"</p>");
	  out.print("<P>"+"��Ӧ����Ϊ��"+ss);

	  %>
	  



<%
	  conn.close();
%>
</body>
</html>