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
		<%@ include file="left-sidebar.jsp"%>
		<div class="main">
			<h2>🎬 영화 소식</h2>
			<div class="news-list">
				<div class="news-item">
					<img src="https://i.imgur.com/Gz8CNhK.jpeg" alt="영화 이미지">
					<div>
						<h4>[듄: 파트2] 개봉</h4>
						<p>올해 가장 기대되는 블록버스터!</p>
					</div>
				</div>
				<div class="news-item">
					<img src="https://i.imgur.com/4fWEDkK.jpeg" alt="영화 이미지">
					<div>
						<h4>[마블] 어벤져스 신작 루머</h4>
						<p>새로운 히어로 등장 소식이 유출!</p>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="right-sidebar.jsp"%>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
