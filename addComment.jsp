<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.mygame.board.CommentDAO" %>

<%
    // URL 파라미터에서 게시글 ID를 받습니다. (id=web1 또는 id=web2)
    String articleId = request.getParameter("id");
    
    if (articleId == null || articleId.isEmpty()) {
        response.sendRedirect("menu.jsp"); // ID 없으면 메인으로
        return;
    }

    // 댓글 폼에서 POST 요청이 왔을 때 처리
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String content = request.getParameter("comment");
        String author = "익명 사용자"; 
        
        if (content != null && !content.trim().isEmpty()) {
            // ✅ DAO에 게시글 ID를 넘겨서 저장
            CommentDAO.saveComment(articleId, content, author);
        }
        
        // ✅ 원래 게시글 ID를 포함하여 해당 페이지로 돌아가도록 수정
        response.sendRedirect(articleId + ".jsp"); 
        return;
    }
    // POST 요청이 아니면 메인으로 리다이렉트
    response.sendRedirect("menu.jsp");
%>