<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    List<String> posts = (List<String>) application.getAttribute("posts");
    if(posts == null) {
        posts = new ArrayList<>();
        application.setAttribute("posts", posts);
    }

    String newPost = request.getParameter("post");
    if(newPost != null && !newPost.trim().equals("")) {
        posts.add(newPost);
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
</head>
<body>
    <h2>게시판</h2>
    <form method="post">
        글쓰기: <input type="text" name="post">
        <input type="submit" value="등록">
    </form>
    <hr>
    <ul>
    <%
        for(String p : posts) {
    %>
        <li><%=p%></li>
    <%
        }
    %>
    </ul>
</body>
</html>
