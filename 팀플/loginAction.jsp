<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("userid");
    String pw = request.getParameter("password");

    if("test".equals(id) && "1234".equals(pw)) {
        session.setAttribute("user", id);
        out.println("<script>alert('로그인 성공!'); location.href='index.jsp';</script>");
    } else {
        out.println("<script>alert('로그인 실패. 다시 시도하세요.'); history.back();</script>");
    }
%>
