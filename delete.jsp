<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yuven</title>
</head>
<body>
	<script>
		alert("정말로 탈퇴하시겠습니까?");
	</script>
	<%
	if (session.getAttribute("userID") != null) {
		session.invalidate();
		
		out.println("<script>alert('지금까지 우리 yuven을 이용해 주셔서 감사합니다.');");
		out.println("location.href = 'index.jsp';</script>");

	} else {
		// 4. 로그인된 정보가 없으면 경고창 출력 후 index.jsp로 이동
		out.println("<script>alert('회원이 아닙니다.');");
		out.println("location.href = 'index.jsp';</script>");

	}
	%>
</body>
</html>
