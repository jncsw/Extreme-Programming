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
	//String tableName = "userinfo";
	//联结字符串 
	String url = "jdbc:mysql://localhost:3307/" + dbName + "?user=" + userName + "&password=" + userPasswd;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection(url);	
	String name1=request.getParameter("username");
	String name= new String(name1.getBytes("ISO-8859-1"), "gb2312");
	String pass1=request.getParameter("pass");
	String pass= new String(pass1.getBytes("ISO-8859-1"), "gb2312");
	String real=request.getParameter("real");
	String rn= new String(real.getBytes("ISO-8859-1"), "gb2312");
	String sex=request.getParameter("Radio");
	String sexx= new String(sex.getBytes("ISO-8859-1"), "gb2312");
	String date=request.getParameter("date");
	String tel=request.getParameter("tel");
	String mail1=request.getParameter("mail");
	String mail= new String(mail1.getBytes("ISO-8859-1"), "gb2312");
	String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

	Statement stmt=conn.createStatement();
	String str="select * from userinfo where name='"+name+"'";
	 ResultSet rs=stmt.executeQuery(str);
	
	 if(rs.next()){
		 rs.close();
		 stmt.close();
	%>
	<script language="javascript">
	 alert("此用户已经被占用，请重新注册");
	 history.back();
	</script>
<%
     } else {
		 rs.close();
		 stmt.close();
	
	  String sql="insert into userinfo values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,pass);
		pstmt.setString(3,rn);
		pstmt.setString(4,sexx);
		pstmt.setString(5,date);
		pstmt.setString(6,tel);
		pstmt.setString(7,mail);
		pstmt.setString(8,datetime);
		pstmt.setString(9,datetime);
		pstmt.setString(10,null);
		pstmt.executeUpdate();
		pstmt.close();		
		 
		
		String sql1="insert into praise values(?,?,?,?)";
		PreparedStatement pstmt1=conn.prepareStatement(sql1);
		pstmt1.setString(1,null);
		pstmt1.setString(2,name);
		pstmt1.setString(3,"0");
		pstmt1.setString(4,"");
		pstmt1.executeUpdate();
        pstmt1.close();
        conn.close();
		
  
  %>

   <jsp:forward page = "regsucc.html"/>
 <%
   };
   %>

</body>
</html>


