<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page language="java" %>
<script language="javascript" type="text/javascript">
var request = new XMLHttpRequest();
</script>


<style type="text/css">
  body{
  background-color:#83c887;
  }
  
			ul {
				list-style-image: url("images/star1.png");}
			li {
				margin: 10px 0px 0px 0px;}
				body {
				background-image: url("images/head.png");
				background-repeat: no-repeat;
				background-position: center top;
				color: #665544;
				padding: 80px;}
		</style>	

<html>
<head>
<base target="_blank">
<title>登录成功</title>
</head>
<body>
<% 
  
  String na=request.getParameter("name");
  if (na==null){
	  %>
		<script language="javascript">
		top.location='index.html'; 
		</script>
	<%
	  
  }else{
	  
  
%>
<h1 align="center"><strong>登录成功</strong></h1>

<br>
<br>
<p>恭喜，登陆成功，欢迎你，<%=request.getParameter("name")%>！</p> 
<p>上次登录时间：<%=request.getParameter("logt")%></p>
<p>你可以：</p>

  
<ul>

			<li ><a href="queue.jsp?names=<%=request.getParameter("name")%>" target="_blank">查询个人资料</a></li>
			
			<%
			if(na.equals("admin"))
			{
			   
				out.print("<li><a href='adqueue.jsp'target='_blank'>查询用户信息</a></li>");
				out.print("<li><a href='adminadmin.html'target='_blank'>课程管理系统</a></li>");
			
			}
			
			%>
			<li><a href="change.jsp?names=<%=request.getParameter("name")%>" target="_blank">修改个人信息</a></li>
			<li><a href="index1.html">查询课程</a></li>
			<li><a href="index2.html">查询空教室</a></li>
			<li><a href="index3.html">查询教室空闲时间</a></li>
			<li><a href="index.html">退出登录</a></li>
		</ul>


<%} %>
</body>

</html>