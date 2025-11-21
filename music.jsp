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
		<div class="banner-ad">
			<a href="https://www.billboard.com/charts/pop-songs/"> <img
				src="./image/golden.png">
			</a>
		</div>
		<%@ include file="left-sidebar.jsp"%>
		<div class="main">
			<h2>🎵 음악 소식</h2>
			<div class="thumbnail-grid">
				<div class="card">
					<a
						href="https://www.bing.com/videos/riverview/relatedvideo?q=%ec%95%84%ec%9d%b4%ec%9c%a0+%ec%8b%a0%ea%b3%a1&qs=n&sp=-1&ghc=1&lq=0&pq=%ec%95%84%ec%9d%b4%ec%9c%a0+%ec%8b%a0%ea%b3%a1&sc=8-6&sk=&cvid=CA0746040D8E4D00A4536CE7792879CF&ajaxnorecss=1&sid=075BB83B3DEF66901A93AE983C98671E&jsoncbid=0&ajaxsydconv=1&ru=%2fsearch%3fq%3d%25EC%2595%2584%25EC%259D%25B4%25EC%259C%25A0%2520%25EC%258B%25A0%25EA%25B3%25A1%26qs%3dn%26form%3dQBRE%26sp%3d-1%26ghc%3d1%26lq%3d0%26pq%3d%25EC%2595%2584%25EC%259D%25B4%25EC%259C%25A0%2520%25EC%258B%25A0%25EA%25B3%25A1%26sc%3d8-6%26sk%3d%26cvid%3dCA0746040D8E4D00A4536CE7792879CF%26ajaxnorecss%3d1%26sid%3d075BB83B3DEF66901A93AE983C98671E%26format%3dsnrjson%26jsoncbid%3d0%26ajaxsydconv%3d1&mmscn=vwrc&mid=7CAF855F10D66EEA3B407CAF855F10D66EEA3B40&FORM=WRVORC&ntb=1&msockid=3665e96ec05611f09263c28199dfaed9">
						<img
						src="https://th.bing.com/th/id/OIP.Mu3KNQxoAFdcr9zIP65y1wHaKn?w=186&h=267&c=7&r=0&o=7&cb=ucfimgc2&pid=1.7&rm=3">
					</a>
					<div class="card-content">
						<div>
							<h3>[아이유] 신곡 발매</h3>
							<p>감성 발라드 신곡이 공개되었습니다!</p>
						</div>
					</div>

				</div>
				<div class="card">
					<a
						href="https://www.chosun.com/entertainments/enter_general/2025/11/12/G4ZGKMTCME4DEZBXGY3DAMLEGY/">
						<img
						src="https://th.bing.com/th/id/OIP.mVWUm2ZkmdnnccfZamiWDwHaEK?w=312&h=180&c=7&r=0&o=7&cb=ucfimgc2&pid=1.7&rm=3">
					</a>
					<div class="card-content">
						<div>
							<h3>[방탄소년단] 컴백 예고</h3>
							<p>전 세계 팬들이 기다리던 앨범 발표!</p>
						</div>

					</div>

				</div>
				<div class="card">
					<img src="https://i.imgur.com/xUAZQCd.jpeg" alt="음악 이미지">
					<div class="card-content">
						<div>
							<h3>[방탄소년단] 컴백 예고</h3>
							<p>전 세계 팬들이 기다리던 앨범 발표!</p>
						</div>
					</div>

				</div>
			</div>
		</div>
		<%@ include file="right-sidebar.jsp"%>
		<div class="banner-ad">
			<a href="https://www.billboard.com/charts/pop-songs/"> <img
				src="./image/golden.png">
			</a>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
