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
String numb="";
String ops=request.getParameter("ch");
if(ops.equals("1")){
	numb=request.getParameter("insnum");
}else numb=request.getParameter("decnum");

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
   int ct=0;
   String t="";
   String s="";
   if(rs.next()){
	  
	   s+=rs.getString(2);
	   ss+=rs.getString(3);
   }
   rs.close();
	  pstmt.close();
	  String st=s+" "+ss+" "+numb+" "+ops;
	  %>
	  <%
	  ////////////////////////////
	  
	  
	 final int N=10001;
	 int[] all=new int[N];
	 int m; 
		int i,p,flag;
		Scanner scan=new Scanner(st);
		
		m=scan.nextInt();
		for(i=1;i<=m;i++){p=scan.nextInt();all[p]=1;}
		p=scan.nextInt();flag=scan.nextInt();
		if(flag==1&&all[p]==0){all[p]=1;m++;}
		else if(flag==0&&all[p]==1){all[p]=0;m--;}
		String p1=""+m;
		String p2="";
		for(i=1;i<N&&all[i]==0;i++);p2+=i;
		for(i++;i<N;i++)if(all[i]==1)p2+=" "+i;
		
		scan.close();

	  %>
	  
<%	  Statement stmt=conn.createStatement();
   String sql1="update lessons set teacher=\""+p1+"\" where name=\"111\"";
   
   String sql2="update lessons set class=\""+p2+"\" where name=\"111\"";
   //out.print(sql1+" "+sql2);
   stmt.executeUpdate(sql1);
   stmt.executeUpdate(sql2);
   out.print("Finish!");
%>


<%
		stmt.close();
	  conn.close();
%>
</body>
</html>