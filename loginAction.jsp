<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
// 폼(loginbox.jsp)에서 전송된 name 속성("userid", "password")과 일치하도록 수정
String user_id = request.getParameter("userid");
String user_pw = request.getParameter("password");

// loginAction.jsp에서는 이름, 전화번호, 이메일을 폼으로 받지 않습니다.
// 세션에 저장할 이름, 전화번호, 이메일은 하드코딩된 값 또는 DB에서 조회한 값으로 처리해야 합니다.

// 임시로 하드코딩된 사용자 정보 사용 (현재 로직 유지)
String registeredName = "홍길동";
String registeredPhone = "010-1234-5678";
String registeredEmail = "abcde@yuhan.ac.kr";

if (user_id != null && user_pw != null && user_id.equals("admin") && user_pw.equals("1234")) {
	session.setAttribute("userID", user_id);
	session.setAttribute("userPW", user_pw);
	session.setAttribute("userNAME", registeredName);
	session.setAttribute("userPHONE", registeredPhone);
	session.setAttribute("userEMAIL", registeredEmail);
	out.println("<script>alert('홍길동님 환영합니다.'); location.href='index.jsp';</script>");
} else {
	out.println("<script>alert('로그인 실패. 아이디와 비밀번호를 확인해주세요.'); history.back();</script>");
}
%>