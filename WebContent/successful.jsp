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
<title>��¼�ɹ�</title>
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
<h1 align="center"><strong>��¼�ɹ�</strong></h1>

<br>
<br>
<p>��ϲ����½�ɹ�����ӭ�㣬<%=request.getParameter("name")%>��</p> 
<p>�ϴε�¼ʱ�䣺<%=request.getParameter("logt")%></p>
<p>����ԣ�</p>

  
<ul>

			<li ><a href="queue.jsp?names=<%=request.getParameter("name")%>" target="_blank">��ѯ��������</a></li>
			
			<%
			if(na.equals("admin"))
			{
			   
				out.print("<li><a href='adqueue.jsp'target='_blank'>��ѯ�û���Ϣ</a></li>");
				out.print("<li><a href='adminadmin.html'target='_blank'>�γ̹���ϵͳ</a></li>");
			
			}
			
			%>
			<li><a href="change.jsp?names=<%=request.getParameter("name")%>" target="_blank">�޸ĸ�����Ϣ</a></li>
			<li><a href="index1.html">��ѯ�γ�</a></li>
			<li><a href="index2.html">��ѯ�ս���</a></li>
			<li><a href="index3.html">��ѯ���ҿ���ʱ��</a></li>
			<li><a href="index.html">�˳���¼</a></li>
		</ul>


<%} %>
</body>

</html>