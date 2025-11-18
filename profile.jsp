<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yuven</title>
</head>
<body>
	<%
	String user_id = (String) session.getAttribute("userID");
	String user_pw = (String) session.getAttribute("userPW");

	out.println("아이디: " + user_id + "<br>");
	out.println("비밀번호: " + user_pw + "<br>");
	%>

	<a href="index.jsp">yuven</a>
</body>
</html>
