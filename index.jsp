<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
// board.jsp와 동일하게 application 영역에서 posts 리스트를 가져옵니다.
List<String> posts = (List<String>) application.getAttribute("posts");
if (posts == null) {
	posts = new ArrayList<>();
	// application.setAttribute("posts", posts); // board.jsp에서 이미 처리됨
}

// 게시글의 조회수를 저장할 세션 (간단한 구현을 위해 세션을 사용)
Map<Integer, Integer> views = (Map<Integer, Integer>) session.getAttribute("views");
if (views == null) {
	views = new HashMap<>();
	session.setAttribute("views", views);
}

//⭐️ 오류 해결을 위한 핵심 코드 추가 ⭐️
Integer lastViewedIndex = (Integer) session.getAttribute("last_viewed_post_index");
if (lastViewedIndex == null) {
	// 세션에 값이 없을 경우, 현재 등록된 글 수로 초기화 (모든 글을 이미 본 것으로 간주)
	lastViewedIndex = posts.size();
	session.setAttribute("last_viewed_post_index", lastViewedIndex);
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>yuven</title>
<style>
body {
	margin: 0;
	font-family: "Segoe UI", sans-serif;
	background: #f4f4f4;
	color: #333;
}

header {
	background: #2c3e50;
	color: #fff;
	padding: 20px 0;
	text-align: center;
}

nav {
	margin-top: 10px;
}

nav a {
	color: #ddd;
	margin: 0 15px;
	text-decoration: none;
	font-weight: bold;
}

nav a:hover {
	color: #fff;
}

.container {
	display: grid;
	grid-template-columns: 250px 1fr 250px;
	gap: 20px;
	width: 1200px;
	margin: 20px auto;
}

.left-sidebar, .right-sidebar {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.section {
	background: #fff;
	padding: 15px;
	border-radius: 6px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.section h2 {
	font-size: 16px;
	margin-bottom: 10px;
	border-bottom: 2px solid #3498db;
	padding-bottom: 5px;
}

.thumbnail-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}

.card {
	background: #fff;
	border-radius: 6px;
	overflow: hidden;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
}

.card:hover {
	transform: translateY(-5px);
}

.card img {
	width: 100%;
	height: 150px;
	object-fit: cover;
}

.card-content {
	padding: 10px;
}

.card-content h3 {
	margin: 0;
	font-size: 14px;
	font-weight: bold;
}

.card-content p {
	font-size: 12px;
	color: #555;
	margin-top: 5px;
}

.news-list {
	margin-top: 30px;
}

/* 게시판 목록 스타일 */
.board-list {
	margin-top: 30px;
	padding: 15px;
	background: #fff;
	border-radius: 6px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.board-list h2 {
	font-size: 16px;
	margin-bottom: 10px;
	border-bottom: 2px solid #3498db;
	padding-bottom: 5px;
}

.board-list ul {
	list-style: none;
	padding: 0;
}

.board-item {
	padding: 5px 0;
	border-bottom: 1px dotted #eee;
	display: flex;
	justify-content: space-between;
	font-size: 14px;
}

.board-item a {
	text-decoration: none;
	color: #333;
	max-width: 85%;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

/* 신규 글 ('N') 스타일 */
.board-item .meta {
	font-weight: bold;
	color: #95a5a6; /* 기본 조회수 색상 */
	min-width: 30px;
	text-align: right;
}

.board-item.new .meta {
	color: #e74c3c; /* New 글자 빨간색 */
}

.news-item {
	display: flex;
	gap: 15px;
	margin-bottom: 15px;
	background: #fff;
	padding: 10px;
	border-radius: 6px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.news-item img {
	width: 120px;
	height: 80px;
	object-fit: cover;
	border-radius: 4px;
}

.news-item h4 {
	margin: 0;
	font-size: 14px;
	font-weight: bold;
}

.news-item p {
	font-size: 12px;
	color: #555;
	margin-top: 5px;
}

.login-box input {
	width: 100%;
	padding: 8px;
	margin: 8px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.login-box button {
	width: 100%;
	padding: 10px;
	border: none;
	background: #3498db;
	color: white;
	font-weight: bold;
	border-radius: 4px;
	cursor: pointer;
}

.login-box button:hover {
	background: #2980b9;
}

footer {
	background: #2c3e50;
	color: #aaa;
	text-align: center;
	padding: 15px;
	margin-top: 30px;
	font-size: 13px;
}
/* 1. 전체 컨테이너 설정: 가로 배치 */
.header-container {
	display: flex; /* Flexbox 활성화 */
	align-items: center; /* 세로 중앙 정렬 */
	background-color: #2c3e50; /* 이미지와 유사한 배경색 */
	padding: 15px 50px; /* 상하좌우 패딩 */
	color: white;
	max-width: 600px; /* 로고와 검색창 전체가 차지할 최대 너비 지정 */
    margin: 0 auto;    /* 컨테이너를 페이지 중앙에 위치시킴 */
}

/* 2. 로고 스타일 */
.logo {
	font-size: 40px;
	font-weight: bold;
	color: #EAEAEA; /* INVEN 로고 색상 */
	margin-right: 40px; /* 검색창과의 간격 */
	letter-spacing: -2px; /* 글자 간격 조정 */
}

/* 3. 검색 폼 (검색창 전체) 스타일 */
.search-bar {
	display: flex; /* 검색 입력창과 버튼을 가로로 배치 */
	border: 2px solid #EAEAEA; /* 테두리 색상 */
	border-radius: 8px; /* 모서리 둥글게 */
	overflow: hidden; /* input과 button의 경계를 감춤 */
	flex-grow: 1; /* 남은 공간을 검색창이 최대한 차지하도록 */
	max-width: 400px; /* 검색창의 최대 너비 제한 (선택 사항) */
	height: 50px; /* 검색창 높이 */
}

/* 4. 입력 창 스타일 */
.search-input {
	flex-grow: 1; /* 최대한 많은 공간 차지 */
	border: none;
	padding: 0 15px;
	font-size: 16px;
	background-color: transparent; /* 배경색 투명 */
	color: white; /* 입력 글자색 */
	outline: none; /* 클릭 시 생기는 파란 테두리 제거 */
	/* 플레이스홀더 텍스트 스타일 */
	-webkit-input-placeholder: #ccc; /* Chrome, Safari */
	-moz-placeholder: #ccc; /* Firefox 19+ */
	-ms-input-placeholder: #ccc; /* IE 10+ */
	placeholder: #ccc; /* Standard */
	text-align: center; /* 가운데 정렬 */
}

/* 5. 검색 버튼 스타일 */
.search-button {
	background-color: transparent;
	border: none;
	cursor: pointer;
	color: #e53935; /* 돋보기 색상 */
	font-size: 20px;
	padding: 0 15px;
	transition: background-color 0.2s;
}
</style>
</head>
<script>
    // 조회수 증가 함수 (실제로는 서버에 요청을 보내야 하지만, 여기서는 간단히 새로고침 유도)
    function increaseView(postIndex) {
        // 서버 측에서 조회수를 업데이트하는 로직을 호출해야 합니다.
        // 현재 JSP 구조에서는 간단히 board.jsp로 이동하는 것만 처리합니다.
        console.log("View count increment requested for post: " + postIndex);
        return true; // 링크 이동 허용
    }
</script>
<body>
	<!-- 헤더 -->
	<header>
		<div class="header-container">
			<div class="logo">yuven</div>
			<form class="search-bar" action="#">
				<input type="text" placeholder="..." class="search-input">
				<button type="submit" class="search-button">🔍</button>
			</form>
		</div>
		<nav>
			<a href="game.jsp">게임</a> <a href="music.jsp">음악</a> <a
				href="movie.jsp">영화</a> <a href="board.jsp">게시판</a> <a
				href="event.jsp">이벤트</a>
		</nav>
	</header>

	<!-- 메인 컨테이너 -->
	<div class="container">
		<!-- 왼쪽 사이드 -->
		<div class="left-sidebar">
			<div class="section">
				<h2>최신 뉴스</h2>
				<p>🎮 발로란트 신규 패치 업데이트</p>
				<p>🎵 새벽 감성 플레이리스트 추천</p>
				<p>🎬 듄: 파트2 리뷰</p>
			</div>
			<div class="section">
				<h2>📢 공지 사항</h2>
				<p>사이트 이용 약관 개정 안내</p>
				<p>새로운 이벤트 당첨자 발표!</p>
			</div>
			<div class="section">
				<h2>🔥 오늘의 BEST</h2>
				<p>🔥 지금 가장 핫한 PC 게임 Top 5</p>
				<p>🎥 이번 주말 추천 영화</p>
			</div>
			<div class="section">
				<h2>📅 주요 일정</h2>
				<p>✔️ [음악] NewJeans 컴백 D-7</p>
				<p>✔️ [영화] 다음 주 개봉작</p>
			</div>

		</div>

		<!-- 메인 -->
		<div class="main">
			<!-- 썸네일 카드 -->
			<div class="thumbnail-grid">
				<div class="card">
					<img src="https://i.imgur.com/oeN8h2K.jpeg" alt="게임 이미지">
					<div class="card-content">
						<h3>발로란트 신규 스킨 공개</h3>
						<p>신규 무기 스킨이 추가되었습니다!</p>
					</div>
				</div>
				<div class="card">
					<img src="https://i.imgur.com/vu2S1pQ.jpeg" alt="음악 이미지">
					<div class="card-content">
						<h3>아이유 신곡 발매</h3>
						<p>이번 신곡은 감성 발라드입니다.</p>
					</div>
				</div>
				<div class="card">
					<img src="https://i.imgur.com/Gz8CNhK.jpeg" alt="영화 이미지">
					<div class="card-content">
						<h3>듄: 파트2 개봉</h3>
						<p>올해 가장 기대되는 블록버스터!</p>
					</div>
				</div>
			</div>

			<!-- 뉴스/최신 동향 -->
			<div class="news-list">
				<div class="news-item">
					<img src="https://i.imgur.com/Q6aZpX1.jpeg" alt="뉴스 이미지">
					<div>
						<h4>[게임] 스타필드 신규 확장팩 공개</h4>
						<p>베데스다에서 대규모 확장팩 발표 소식!</p>
					</div>
				</div>
				<div class="news-item">
					<img src="https://i.imgur.com/xUAZQCd.jpeg" alt="뉴스 이미지">
					<div>
						<h4>[음악] 방탄소년단 컴백 예고</h4>
						<p>전 세계 팬들이 기다리던 앨범 소식 공개!</p>
					</div>
				</div>
				<div class="news-item">
					<img src="https://i.imgur.com/4fWEDkK.jpeg" alt="뉴스 이미지">
					<div>
						<h4>[영화] 어벤져스 신작 루머</h4>
						<p>마블 차기작에 대한 새로운 정보 유출!</p>
					</div>
				</div>

				<div class="board-list">
					<h2>📝 커뮤니티 최신글</h2>
					<ul>
						<li>👋 안녕하세요! 문화 취미 커뮤니티 게시판입니다.</li>
						<li>💡 자유롭게 글을 작성하여 소통해 보세요!</li>
						<li>🔥 [인기] 지금 가장 핫한 PC 게임 Top 5</li>
						<li>🎬 [추천] 이번 주말 추천 영화</li>
						<%
						// posts 리스트를 역순으로 순회하여 최신 글 5개를 표시
						int count = 0;
						for (int i = posts.size() - 1; i >= 0 && count < 5; i--) {
							String postContent = posts.get(i);

							boolean isNew = (i >= lastViewedIndex);
							// 조회수 (간단 구현: 실제 조회수는 아니며, 인덱스로 관리)
							int viewCount = views.getOrDefault(i, 0);

							// 클릭 시 조회수를 증가시키기 위해 JavaScript 함수 호출 (3단계 참고)
						%>
						<li class="board-item <%=isNew ? "new" : ""%>" data-index="<%=i%>"><a
							href="board.jsp?view=<%=i%>" onclick="increaseView(<%=i%>)">
								<%=postContent.length() > 30 ? postContent.substring(0, 30) + "..." : postContent%>
						</a> <span class="meta"> [<%=isNew ? "N" : viewCount%>]
						</span></li>
						<%
						count++;
						}
						// 현재 페이지를 로드한 후, 마지막 글 인덱스를 업데이트하여 다음 로드 시 'N' 표시 기준을 잡습니다.
						if (posts.size() > 0) {
						session.setAttribute("last_viewed_post_index", posts.size());
						} else {
						session.setAttribute("last_viewed_post_index", 0);
						}
						%>
					</ul>
				</div>
			</div>
		</div>

		<!-- 오른쪽 사이드 -->
		<div class="right-sidebar">
			<div class="section login-box">
				<h2>로그인</h2>
				<form action="loginAction.jsp" method="post">
					<input type="text" name="userid" placeholder="아이디"> <input
						type="password" name="password" placeholder="비밀번호">
					<button type="submit">로그인</button>
				</form>
			</div>
			<div class="section">
				<h2>실시간 인기 검색</h2>
				<p>1. 발로란트</p>
				<p>2. 아이유 신곡</p>
				<p>3. 듄: 파트2</p>
				<p>4. 스타필드</p>
				<p>5. 아이유</p>
				<p>6. 뉴진스</p>
				<p>7. 유한대학교</p>
				<p>8. 현대백화점</p>
				<p>9. 방탄소년단</p>
				<p>10. 리그오브레전드</p>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
	<footer>
		<p>© 2025 문화생활팀 | JSP 프로젝트 | 회사소개 · 개인정보처리방침 · 이용약관</p>
	</footer>
</body>
</html>
