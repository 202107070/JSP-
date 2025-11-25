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
	background: #C90000;
	color: white;
	font-weight: bold;
	border-radius: 4px;
	cursor: pointer;
}

.login-box h4 {
	font-weight: natural;
}

</style>

<div class="section login-box">
	<h4>유벤에 로그인 하세요</h4>
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