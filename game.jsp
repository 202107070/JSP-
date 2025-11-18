<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>yuven</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="container">
		<div class="banner-ad"></div>
		<%@ include file="left-sidebar.jsp"%>
		<div class="main">
			<h2>🎮 게임 소식</h2>
			<div class="news-list">
				<div class="news-item">
					<img src="https://i.imgur.com/oeN8h2K.jpeg" alt="게임 이미지">
					<div>
						<h4>[발로란트] 신규 에이전트 등장</h4>
						<p>신규 캐릭터 공개! 전술적 능력이 화제.</p>
					</div>
				</div>
				<div class="news-item">
					<img src="https://i.imgur.com/Q6aZpX1.jpeg" alt="게임 이미지">
					<div>
						<h4>[스타필드] 대규모 확장팩 발표</h4>
						<p>수많은 행성이 추가된다고 합니다!</p>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="right-sidebar.jsp"%>

		<div class="banner-ad"></div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
