<%@ page language="java" contentType="text/html; charset=gb2312"%>
<% request.setCharacterEncoding("GB2312");
request.setCharacterEncoding("GB2312"); %>

<%@ page language="java" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*"%> 
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
<meta charset="gb2312">

<title></title>
</head>
<body>
<table width="800"border="1"align="center">
<tr>
  <td>课程名</td>
  <td>任课教师</td>
  <td>教学地点</td>
  <td>课程时间</td>
  
  </tr>
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
   String sss="";
   int ct=0;
   String t="";
   String ss="";
   if(rs.next()){
	  
	   sss+=rs.getString(2);
	   sss+=" ";
	   sss+=rs.getString(3);
	   sss+=" ";
   }
   while(rs.next()){
	   %>
	    <tr>
	      <td><%=trans(rs.getString("name")) %></td>
	      <td><%=trans(rs.getString("teacher")) %></td>
	      <td><%=trans(rs.getString("class")) %></td>
	      <td><%=trans(rs.getString("time")) %></td>
	      </tr>
	      <%
    
   }
   String s=sss+ct+" "+ss;
   //out.print(s);
%>




<%
	rs.close();
	  pstmt.close();
	  conn.close();
%>
</body>
</html>