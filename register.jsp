<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>yuven</title>
</head>
<style>
/* 기본 배경 및 폼 중앙 정렬 */
body {
	font-family: "Segoe UI", sans-serif;
	background: #ffffff;
	color: #333;
	margin: 0;
	display: flex; /* 폼 중앙 정렬을 위해 Flexbox 사용 */
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	min-height: 100vh; /* 화면 전체 높이 사용 */
}
</style>
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

		alert("yuven 회원이 되신걸 환영합니다.");
		location.href = 'index.jsp';
		
	}
</script>
<body>
	<h3>회원 가입</h3>
	<form action="#" name="Member" method="post">
		<p>
			아이디 : <input type="text" name="id">
		</p>
		<p>
			비밀번호 : <input type="password" name="passwd">
		</p>
		<p>
			이름 : <input type="text" name="name">
		</p>
		<p>
			연락처 : <select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - <input type="text" maxlength="4" size="4" name="phone2"> -
			<input type="text" maxlength="4" size="4" name="phone3">
		</p>
		<p>
			이메일 : <input type="text" name="email">
		</p>
		<p>
			<input type="button" value="가입하기" onclick="checkMember()">
			<input type="button" value="yuven" onclick="location.href='index.jsp'">			
		</p>
	</form>
</body>
</html>