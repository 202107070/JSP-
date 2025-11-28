<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
String id = request.getParameter("userid");
String pw = request.getParameter("password");

String registeredName = "홍길동";
String registeredPhone = "010-1234-5678";
String registeredEmail = "abcde@yuhan.ac.kr";

if (id != null && pw != null && id.equals("admin") && pw.equals("1234")) {
	session.setAttribute("userID", id);
	session.setAttribute("userPW", pw);
	session.setAttribute("userNAME", registeredName);     
	session.setAttribute("userPHONE", registeredPhone);    
	session.setAttribute("userEMAIL", registeredEmail);
	out.println("<script>alert('홍길동님 환영합니다.'); location.href='index.jsp';</script>");
} else {
	out.println("<script>alert('로그인 실패. 아이디와 비밀번호를 확인해주세요.'); history.back();</script>");
}
%>