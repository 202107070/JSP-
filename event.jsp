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
			<h2>🎉 진행 중인 이벤트</h2>
			<div class="news-list">
				<div class="news-item">
					<img src="https://i.imgur.com/Gz8CNhK.jpeg" alt="이벤트 이미지">
					<div>
						<h4>[게임] 추석 기념 이벤트</h4>
						<p>게임 내 한정 아이템을 받을 수 있는 기회!</p>
					</div>
				</div>
				<div class="news-item">
					<img src="https://i.imgur.com/xUAZQCd.jpeg" alt="이벤트 이미지">
					<div>
						<h4>[음악] 콘서트 티켓 이벤트</h4>
						<p>방탄소년단 콘서트 티켓 추첨 이벤트!</p>
					</div>
				</div>
				<div class="news-item">
					<img src="https://i.imgur.com/4fWEDkK.jpeg" alt="이벤트 이미지">
					<div>
						<h4>[영화] 무료 시사회 초대</h4>
						<p>신작 영화 무료 시사회 이벤트에 참여하세요.</p>
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
