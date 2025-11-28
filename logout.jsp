<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    // 세션 무효화 (모든 세션 데이터 삭제)
    session.invalidate(); 
    
    // 메인 페이지(index.jsp)로 리다이렉트
    out.println("<script>alert('로그아웃 되었습니다.'); location.href='index.jsp';</script>");
%>