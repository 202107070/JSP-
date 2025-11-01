<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
// **메인 페이지에서 전달된 조회 요청 처리** 
String viewIndexStr = request.getParameter("view");
if (viewIndexStr != null) {
	try {
		int viewIndex = Integer.parseInt(viewIndexStr);

		// views Map 가져오기 
		Map<Integer, Integer> views = (Map<Integer, Integer>) session.getAttribute("views");
		if (views == null) {
	views = new HashMap<>();
	session.setAttribute("views", views);
		}

		// 해당 글의 조회수 증가 
		int currentViews = views.getOrDefault(viewIndex, 0);
		views.put(viewIndex, currentViews + 1);

		// 실제 게시글 보기 페이지로 이동 (여기서는 간단히 목록 페이지 유지) 
		// out.println("<script>alert('" + viewIndex + "번 글 조회수 1 증가');</script>");
	} catch (NumberFormatException e) {
		// 예외 처리 
	}
}
%>
<%
List<String> posts = (List<String>) application.getAttribute("posts");
if (posts == null) {
	posts = new ArrayList<>();
	application.setAttribute("posts", posts);
}

String newPost = request.getParameter("post");
if (newPost != null && !newPost.trim().equals("")) {
	posts.add(newPost);
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>yuven</title>
<style>
body {
	margin: 0;
	font-family: "Segoe UI", sans-serif;
	background: #f4f4f4;
	color: #333;
}

header {
	background: #2c3e50;
	color: #fff;
	padding: 20px 0;
	text-align: center;
}

nav {
	margin-top: 10px;
}

nav a {
	color: #ddd;
	margin: 0 15px;
	text-decoration: none;
	font-weight: bold;
}

nav a:hover {
	color: #fff;
}

.container {
	display: grid;
	grid-template-columns: 250px 1fr 250px;
	gap: 20px;
	width: 1200px;
	margin: 20px auto;
}

.left-sidebar, .right-sidebar {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.section {
	background: #fff;
	padding: 15px;
	border-radius: 6px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.section h2 {
	font-size: 16px;
	margin-bottom: 10px;
	border-bottom: 2px solid #3498db;
	padding-bottom: 5px;
}

.login-box input {
	width: 100%;
	padding: 8px;
	margin: 8px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.login-box button {
	width: 100%;
	padding: 10px;
	border: none;
	background: #3498db;
	color: white;
	font-weight: bold;
	border-radius: 4px;
	cursor: pointer;
}

.login-box button:hover {
	background: #2980b9;
}

footer {
	background: #2c3e50;
	color: #aaa;
	text-align: center;
	padding: 15px;
	margin-top: 30px;
	font-size: 13px;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="container">
		<%@ include file="left-sidebar.jsp" %>

		<div class="main">
			<h2>게시판</h2>
			<form method="post">
				글쓰기: <textarea name="post" cols="50" rows="10"></textarea>
				 <input type="submit" value="등록">
			</form>
			<hr>
			<ul>
				<%
				for (String p : posts) {
				%>
				<li><%=p%></li>
				<%
				}
				%>
			</ul>
		</div>
		
		<%@ include file="right-sidebar.jsp" %>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>