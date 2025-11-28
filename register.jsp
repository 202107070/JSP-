<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>yuven - 회원가입</title>
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
	--line: #ddd;
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
		Helvetica, Arial, sans-serif;
	background: var(--bg);
	color: var(--text);
}

a {
	color: var(--brand);
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
	border-radius: 20px;
	padding: 40px;
	max-width: 400px;
	width: 100%;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
}

.logo {
	text-align: center;
	font-size: 28px;
	font-weight: 800;
	margin-bottom: 20px;
}

.logo {
	color: var(--brand);
}

h1 {
	margin: 0 0 20px;
	text-align: center;
	font-size: 22px;
}

form {
	display: flex;
	flex-direction: column;
	gap: 16px;
}

input[type="text"], input[type="email"], input[type="password"] {
	padding: 12px 14px;
	border-radius: 12px;
	border: 1px solid var(--line);
	background: #fff;
	color: var(--text);
	font-size: 15px;
}

input:focus {
	outline: none;
	border-color: var(--brand);
}

button, input[type="button"] { 
	padding: 12px;
	border-radius: 12px;
	background: var(--brand);
	border: none;
	font-weight: 600;
	font-size: 16px;
	color: #000;
	cursor: pointer;
	transition: 0.2s;
}

button:hover, input[type="button"]:hover {
	filter: brightness(1.1);
}

</style>
</head>
<script type="text/javascript">
	function checkMember() {

		var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

		var regExpName = /^[가-힣]*$/;

		var regExpPasswd = /^[0-9]*$/;

		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;

		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		var form = document.Member;

		var id = form.id.value;

		var name = form.name.value;

		var passwd = form.passwd.value;

		var phone = form.phone1.value + "-" + form.phone2.value + "-"
				+ form.phone3.value;

		var email = form.email.value;

		if (!regExpId.test(id)) {

			alert("아이디는 문자로 시작해주세요!");

			form.id.select();

			return;

		}

		if (!regExpName.test(name)) {

			alert("이름은 한글만 입력해주세요!");

			return;

		}

		if (!regExpPasswd.test(passwd)) {

			alert("비밀번호는 숫자만 입력해주세요!");

			return;

		}

		if (!regExpPhone.test(phone)) {

			alert("연락처 입력을 확인해주세요!");

			return;

		}

		if (!regExpEmail.test(email)) {

			alert("이메일 입력을 확인해주세요!");

			return;

		}
		document.Member.action = "registerAction.jsp"; 
	    document.Member.submit();
	}
</script>
<body>
	<div class="wrap">
		<div class="card">
			<div class="logo">yuven</div>
			<h1>회원 가입</h1>
			<form action="registerAction.jsp" name="Member" method="post">

				<input type="text" name="id" placeholder="아이디" required> <input
					type="password" name="passwd" placeholder="비밀번호" required>
				<input type="text" name="name" placeholder="이름" required> <input
					type="email" name="email" placeholder="이메일" required>

				<div class="form-group-inline">
					<select name="phone1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select> - <input type="text" maxlength="4" size="4" name="phone2"
						placeholder="1234" required> - <input type="text"
						maxlength="4" size="4" name="phone3" placeholder="5678" required>
				</div>

				<button type="button" onclick="checkMember()">가입하기</button>

				<input type="button" value="메인으로"
					onclick="location.href='index.jsp'" class="options">

			</form>
		</div>
	</div>
</body>
</html>