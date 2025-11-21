<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.login-box input {
	width: 90%;
	padding: 8px;
	margin: 4px 0;
	border: 2px solid #ccc;
	border-radius: 4px;
}

.login-box button {
	width: 100px;
	padding: 10px;
	margin: 2px 2px;
	border: 2px solid #ccc;
	background: #3498db;
	color: white;
	font-weight: bold;
	border-radius: 4px;
	cursor: pointer;
}

.login-box button:hover {
	background: #2980b9;
}
</style>

<div class="section login-box">
	<h2>로그인</h2>
	<form action="loginAction.jsp" method="post">
		<input type="text" name="userid" placeholder="아이디"> <input
			type="password" name="password" placeholder="비밀번호">
		<button type="submit" name="login">로그인</button>
		<button type="button" onclick="location.href='register.jsp'">회원가입</button>
		<button type="button" onclick="location.href='delete.jsp'">회원탈퇴</button>
		<button type="button" onclick="location.href='profile.jsp'">내
			정보</button>
	</form>
</div>