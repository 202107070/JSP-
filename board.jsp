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
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="container">
		<div class="banner-ad"></div>
		<%@ include file="left-sidebar.jsp"%>

		<div class="main">
			<h2>게시판</h2>
			<form method="post">
				글쓰기:
				<textarea name="post" cols="50" rows="10"></textarea>
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

		<%@ include file="right-sidebar.jsp"%>

		<div class="banner-ad"></div>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>