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
	String dbName = "stu";
	//表名 
	String tableName = "userinfo";
	//联结字符串 
	String url = "jdbc:mysql://localhost:3307/" + dbName + "?user=" + userName + "&password=" + userPasswd;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection(url);
	boolean flag = false;
	  String name = null;
	  String id=null;
	  String nameee=null;
	String sql = "SELECT * FROM userinfo WHERE name = ? AND password = ?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt = conn.prepareStatement(sql);
   String un1=request.getParameter("username");   
   String un= new String(un1.getBytes("ISO-8859-1"), "gb2312");
	String pass1=request.getParameter("password");
	String pass= new String(pass1.getBytes("ISO-8859-1"), "gb2312");
   pstmt.setString(1,un);
   pstmt.setString(2,pass);
   ResultSet  rs = pstmt.executeQuery();
   if(rs.next()){
    name = rs.getString(1); 
    id=rs.getString(10);
    flag = true;
   }
   
  

%>
<%
  if(flag){
	  
	  String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
      String logt=rs.getString(8);
      rs.close();
	  pstmt.close();
	  Statement stmt=conn.createStatement();
	  String upda="update userinfo set logintime='"+datetime+"' where name='"+un+"'";
	  
	  stmt.executeUpdate(upda);
	  
	  stmt.close();
	  
	  conn.close();
%>
 
  <jsp:forward page = "successful.jsp">
      <jsp:param name = "name" value = "<%=name%>"/>
      <jsp:param name = "cur" value = "<%=id%>"/>
      <jsp:param name = "logt" value = "<%=logt%>"/>
   </jsp:forward>
<%
}else{
	rs.close();
	  pstmt.close();
	  conn.close();
%>
   <jsp:forward page = "failed.html"/>
<%
}
%>
</body>
</html>