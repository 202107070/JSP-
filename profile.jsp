<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yuven</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700&display=swap"
	rel="stylesheet">

<style>
:root {
	--bg: #f7f7f7;
	--panel: #ffffff;
	--muted: #666;
	--text: #111;
	--brand: #3cc3ff;
	--line: #ddd; /* [cite: 5] */
	--danger: #ff6b6b;
}

* {
	box-sizing: border-box;
}

html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	font-family: Pretendard, system-ui, -apple-system, Segoe UI, Roboto,
		Helvetica, Arial, sans-serif; /* [cite: 6] */
	background: var(--bg);
	color: var(--text);
}

a {
	color: var(--brand); /*  */
	text-decoration: none;
}

.wrap {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100%;
	padding: 20px;
}

.card {
	background: var(--panel);
	border: 1px solid var(--line);
	border-radius: 20px; /* [cite: 8] */
	padding: 40px;
	max-width: 400px;
	width: 100%;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
}

.logo {
	text-align: center;
	font-size: 28px; /* [cite: 9] */
	font-weight: 800;
	margin-bottom: 20px;
	color: var(--brand);
}

h1 {
	margin: 0 0 20px; /* [cite: 10] */
	text-align: center;
	font-size: 22px;
}

.profile-info {
	margin-top: 20px;
	line-height: 2.0; /* 줄 간격 설정 */
	font-size: 16px;
}

.back-button {
	display: block;
	width: 100%;
	text-align: center;
	margin-top: 30px;
	padding: 12px;
	border-radius: 12px;
	background: var(--brand);
	border: none;
	font-weight: 600; /* [cite: 12] */
	font-size: 16px;
	color: #000;
	cursor: pointer;
	transition: 0.2s;
}

.back-button:hover {
	filter: brightness(1.1);
}
</style>
</head>
<body>
	<%
	String user_id = (String) session.getAttribute("userID");
	String user_pw = (String) session.getAttribute("userPW");
	String user_name = (String) session.getAttribute("userNAME");
	String user_phone = (String) session.getAttribute("userPHONE");
	String user_email = (String) session.getAttribute("userEMAIL");
	%>
	<div class="wrap">
		<div class="card">
			<div class="logo">yuven</div>
			<h1>내 정보</h1>

			<%
			if (user_id != null) {
			%>
			<div class="profile-info">
				<strong>아이디:</strong>
				<%=user_id%><br> <strong>비밀번호:</strong>
				<%=user_pw%><br> <strong>이름:</strong>
				<%=user_name%><br> <strong>연락처:</strong>
				<%=user_phone%><br> <strong>이메일:</strong>
				<%=user_email%><br>
			</div>
			<%
			} else {
			%>
			<script>
				alert('로그인 후 이용해 주세요.');
				location.href = 'index.jsp';
			</script>
			<%
			}
			%>

			<a href="index.jsp" class="back-button">메인으로</a>
		</div>
	</div>
</body>
</html>
