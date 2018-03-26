<%@ page language="java" contentType="text/html; charset=gb2312"%>
<% request.setCharacterEncoding("GB2312");
request.setCharacterEncoding("GB2312"); %>

<%@ page language="java" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*"%> 
<html>
<head>
<meta charset="gb2312">

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
	   ct++;
    for(int i=1;i<=4;i++){
    	t=rs.getString(i); 
    	if (t!=null){
    	    ss+=t+" ";
    }}
    
   }
   String s=sss+ct+" "+ss;
   //out.print(s);
%>

<%
/////////////////////////////////////////////////////////
String op=request.getParameter("ch");
String sea="";
if(op.equals("chk")){
String classs=request.getParameter("lesson");
//new String(name1.getBytes("ISO-8859-1"), "gb2312");
String class1=new String(classs.getBytes("ISO-8859-1"), "gb2312");
if (class1.equals(""))class1="NULL";
//out.print(class1+"&nbsp&nbsp&nbsp&nbsp&nbsp");
String teacher1=request.getParameter("teacher");
String teacher=new String(teacher1.getBytes("ISO-8859-1"), "gb2312");
if (teacher.equals(""))teacher="NULL";
String place=request.getParameter("place");
if (place.equals(""))place="-1";
String t2=request.getParameter("time");
String t1=request.getParameter("week");
sea="subject "+class1+" "+teacher+" "+place+" "+t1+t2;
}
if(op.equals("kjs")){
	String t2=request.getParameter("time");
	String t1=request.getParameter("week");
	sea="timetoroom "+t1+t2;
}
if(op.equals("js")){
	String temp=request.getParameter("sel");
	sea="roomtotime "+temp;
}
//out.print(sea);
%>



<%

final int N=10001;
final String M="NULL";
final int mod=5;
String[] name=new String[N];
String[] tea=new String[N];
int[] loc=new int[N];
int[] time=new int[N];
int[] all=new int[N];
int[] tmp=new int[N];
String[] outday={"0","星期一","星期二","星期三","星期四","星期五","星期六","星期日"};
String[] outcla={"0","第一至二节","第三至四节","第五至六节","第七至八节","第九节"};
int n,m;	
	int i,j,k,p,p3,p4;
	String p1,p2;
	Scanner scan=new Scanner(s);
	m=scan.nextInt();
	for(i=1;i<=m;i++){p=scan.nextInt();all[p]=1;}
	n=scan.nextInt();
	for(i=1;i<=n;i++){p1=scan.next();p2=scan.next();p3=scan.nextInt();p4=scan.nextInt();name[i]=p1;tea[i]=p2;loc

[i]=p3;time[i]=p4;}
	scan.close();
	String search1=sea;
	String search= new String(search1.getBytes("ISO-8859-1"), "gb2312");
	scan=new Scanner(search);
	String str;
	while(scan.hasNext())
	{
		str=scan.next();
		if(str.equals("subject"))
		{
			p1=scan.next();p2=scan.next();p3=scan.nextInt();p4=scan.nextInt();
			k=0;
			for(i=1;i<=n;i++)
			if(p1.equals(M)||(name[i]).equals(p1)) 
			if(p2.equals(M)||(tea[i]).equals(p2))
		    if(p3==-1||loc[i]==p3)
		    if(p4/10==8||time[i]/10==p4/10)
		    if(p4%10==6||time[i]%10==p4%10)
		    out.print("NO."+(++k)+" "+name[i]+" "+tea[i]+" "+loc[i]+" "+outday[time[i]/10]+outcla[time[i]%10]+"<br/>");
			if(k==0)out.println("Not Found<br/>");
			out.print("<br/>");
		}
		else if(str.equals("timetoroom"))
		{
			for(i=1;i<N;i++)tmp[i]=all[i];
			p4=scan.nextInt();
			for(i=1;i<=n;i++)if(time[i]==p4)tmp[loc[i]]=0;
			j=0;for(i=1;i<N;i++)if(tmp[i]==1){out.print(i+" ");j++;if(j%mod==0)out.print("<br/>");}
			out.print("<br/>");
			if(j==0)out.print("Not Found<br/>");
		}
		else if(str.equals("roomtotime"))
		{
			p3=scan.nextInt();
			for(i=1;i<=7;i++)for(j=1;j<=5;j++)tmp[i*10+j]=1;
			for(i=1;i<=n;i++)if(loc[i]==p3)tmp[time[i]]=0;
			k=0;for(i=1;i<=7;i++){p4=0;for(j=1;j<=5;j++)if(tmp[i*10+j]==1){p4=1;out.print((i*10+j)+" ");k++;}if(p4==1)out.print("<br/>");}
			if(k==0)out.print("Not Found<br/>");
		}
		else if(str.equals("addinf"))
		{
			p1=scan.next();p2=scan.next();p3=scan.nextInt();p4=scan.nextInt();
			out.print("addinf "+p1+" "+p2+" "+p3+" "+p4+"<br/>");
		}
		
	}
	scan.close();


%>
<%
	rs.close();
	  pstmt.close();
	  conn.close();
%>
</body>
</html>