<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
// boardmain.jsp와 동일하게 application 영역에서 posts 리스트를 가져옵니다.
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

/* 헤더 */
header {
	background: #2c3e50;
	color: #fff;
	padding: 20px 0;
	text-align: center;
}

header h1 {
	margin: 0;
	font-size: 24px;
}

nav {
	display: flex; /* 모든 메뉴를 가로로 정렬 */
	justify-content: center; /* 메뉴들을 가운데 정렬 */
	background: #f4f4f4; /* 배경색 통일 */
	padding: 10px 0; /* 상하 여백 */
	gap: 5px; /* 메뉴 항목 사이 간격 */
}

nav a {
	color: #242424;
	margin: 0 15px;
	text-decoration: none;
	font-weight: bold;
}

nav a:hover {
	color: #DB0000;
}

.container {
	display: grid;
	grid-template-columns: 350px 250px 1fr 250px 350px;
	gap: 20px;
	width: 1860px;
	margin: 20px auto;
}

.banner-ad {
	display: flex; /* 이미지를 컨테이너에 맞게 배치 */
	flex-direction: column;
	gap: 20px;
}

.banner-ad img {
	width: 100%;
	height: 600px;
	border-radius: 6px;
	object-fit: cover;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
	transition: transform 0.2s;
}

.news-item img {
	width: 120px;
	height: 80px;
	object-fit: cover;
	border-radius: 4px;
}

.news-item:hover {
	transform: translateY(-5px);
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

footer {
	background: #f4f4f4;
	color: #aaa;
	text-align: center;
	padding: 15px;
	margin-top: 30px;
	font-size: 13px;
}
footer hr {
	background: #DDDDDD;
	height: 1px;
	border: none;
}
/* 1. 전체 컨테이너 설정: 가로 배치 */
.header-container {
	display: flex; /* Flexbox 활성화 */
	align-items: center; /* 세로 중앙 정렬 */
	background-color: #2c3e50; /* 이미지와 유사한 배경색 */
	padding: 15px 50px; /* 상하좌우 패딩 */
	color: white;
	max-width: 600px; /* 로고와 검색창 전체가 차지할 최대 너비 지정 */
	margin: 0 auto; /* 컨테이너를 페이지 중앙에 위치시킴 */
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
	<%@ include file="header.jsp"%>

	<!-- 메인 컨테이너 -->
	<div class="container">
		<div class="banner-ad">
			<a
				href="https://www.yuhan.co.kr/Main/">
				<img src="https://doctorsnews.co.kr/news/photo/202511/162187_133261_5053.png">
			</a>
		</div>
		<!-- 왼쪽 사이드 -->

		<%@ include file="left-sidebar.jsp"%>

		<!-- 메인 -->
		<div class="main">
			<!-- 썸네일 카드 -->
			<div class="thumbnail-grid">
				<div class="card">
					<a href="https://vortexgaming.io/postdetail/520733"> <img
						src="https://th.bing.com/th/id/OIP.qZQVSOrqWRjHX94BY9EYMwHaEK?w=333&h=187&c=7&r=0&o=7&cb=ucfimgc2&pid=1.7&rm=3">
					</a>
					<div class="card-content">
						<h3>발로란트 신규 스킨 공개</h3>
						<p>신규 무기 스킨이 추가되었습니다!</p>
					</div>

				</div>
				<div class="card">
					<a
						href="https://www.bing.com/videos/riverview/relatedvideo?q=%ec%95%84%ec%9d%b4%ec%9c%a0+%ec%8b%a0%ea%b3%a1&qs=n&sp=-1&ghc=1&lq=0&pq=%ec%95%84%ec%9d%b4%ec%9c%a0+%ec%8b%a0%ea%b3%a1&sc=8-6&sk=&cvid=CA0746040D8E4D00A4536CE7792879CF&ajaxnorecss=1&sid=075BB83B3DEF66901A93AE983C98671E&jsoncbid=0&ajaxsydconv=1&ru=%2fsearch%3fq%3d%25EC%2595%2584%25EC%259D%25B4%25EC%259C%25A0%2520%25EC%258B%25A0%25EA%25B3%25A1%26qs%3dn%26form%3dQBRE%26sp%3d-1%26ghc%3d1%26lq%3d0%26pq%3d%25EC%2595%2584%25EC%259D%25B4%25EC%259C%25A0%2520%25EC%258B%25A0%25EA%25B3%25A1%26sc%3d8-6%26sk%3d%26cvid%3dCA0746040D8E4D00A4536CE7792879CF%26ajaxnorecss%3d1%26sid%3d075BB83B3DEF66901A93AE983C98671E%26format%3dsnrjson%26jsoncbid%3d0%26ajaxsydconv%3d1&mmscn=vwrc&mid=7CAF855F10D66EEA3B407CAF855F10D66EEA3B40&FORM=WRVORC&ntb=1&msockid=3665e96ec05611f09263c28199dfaed9">
						<img
						src="https://th.bing.com/th/id/OIP.Mu3KNQxoAFdcr9zIP65y1wHaKn?w=186&h=267&c=7&r=0&o=7&cb=ucfimgc2&pid=1.7&rm=3">
					</a>
					<div class="card-content">
						<h3>아이유 신곡 발매</h3>
						<p>이번 신곡은 감성 발라드입니다.</p>
					</div>
				</div>
				<div class="card">
					<a
						href="https://tomorrowsgarden.tistory.com/entry/%EB%93%84-%ED%8C%8C%ED%8A%B82-%EC%A4%84%EA%B1%B0%EB%A6%AC-%EA%B0%9C%EB%B4%89%EC%9D%BC-%EC%BA%90%EC%8A%A4%ED%8C%85%EA%B9%8C%EC%A7%80-%ED%95%9C%EB%88%88%EC%97%90-%EC%A0%95%EB%A6%AC">
						<img
						src="https://th.bing.com/th/id/OIP.qog32us4mbwvs8KitkSfzQHaKn?w=138&h=198&c=7&r=0&o=7&cb=ucfimgc2&pid=1.7&rm=3">
					</a>
					<div class="card-content">
						<h3>듄: 파트2 개봉</h3>
						<p>올해 가장 기대되는 블록버스터!</p>
					</div>
				</div>
			</div>

			<!-- 뉴스/최신 동향 -->
			<div class="news-list">
				<div class="news-item">
					<a href="https://www.gamemeca.com/view.php?gid=1752312"> <img
						src="https://th.bing.com/th/id/OIP.H7VcVzX46atGSxDLgYfC5gHaEK?w=326&h=183&c=7&r=0&o=7&cb=ucfimgc2&pid=1.7&rm=3">
					</a>
					<div>
						<h4>[게임] 스타필드 신규 확장팩 공개</h4>
						<p>베데스다에서 대규모 확장팩 발표 소식!</p>
					</div>
				</div>
				<div class="news-item">
					<a
						href="https://www.chosun.com/entertainments/enter_general/2025/11/12/G4ZGKMTCME4DEZBXGY3DAMLEGY/">
						<img
						src="https://th.bing.com/th/id/OIP.mVWUm2ZkmdnnccfZamiWDwHaEK?w=312&h=180&c=7&r=0&o=7&cb=ucfimgc2&pid=1.7&rm=3">
					</a>
					<div>
						<h4>[음악] 방탄소년단 컴백 예고</h4>
						<p>전 세계 팬들이 기다리던 앨범 소식 공개!</p>
					</div>
				</div>
				<div class="news-item">
					<a href="https://www.youtube.com/watch?v=SVqZ6PGLGtM"> <img
						src="https://i.ytimg.com/vi/SVqZ6PGLGtM/maxresdefault.jpg">
					</a>
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
							href="boardmain.jsp?view=<%=i%>" onclick="increaseView(<%=i%>)">
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
				<hr style="margin: 40px 0; border: 1px solid #ddd;">
    
    <div class="section updates-section">
        <h2>🚀 주요 업데이트 및 패치 노트</h2>
        <div class="news-list" style="margin-top: 15px;">
            <div class="news-item">
                <img src="[URL_패치노트_1]" alt="패치 노트 이미지">
                <div>
                    <h4>[발로란트] 7.12 대규모 밸런스 패치</h4>
                    <p>신규 에이전트 너프 및 맵 로테이션 변경 사항 총정리.</p>
                </div>
            </div>
            <div class="news-item">
                <img src="[URL_패치노트_2]" alt="패치 노트 이미지">
                <div>
                    <h4>[스타필드] 넥스트 제너레이션 그래픽 업데이트</h4>
                    <p>4K 해상도 지원 및 프레임 속도 개선 내용 공식 발표.</p>
                </div>
            </div>
        </div>
    </div>

    <hr style="margin: 40px 0; border: 1px solid #ddd;">

    <div class="section video-section">
        <h2>📺 인기 동영상 하이라이트</h2>
        <div class="thumbnail-grid">
            <div class="card">
                <img src="[URL_유튜브_1]" alt="유튜브 썸네일">
                <div class="card-content">
                    <h3>[ASMR] 아이유의 노래 듣고 자는 ASMR</h3>
                    <p>잔잔한 감성으로 편안한 잠을 청하세요.</p>
                </div>
            </div>
            <div class="card">
                <img src="[URL_유튜브_2]" alt="유튜브 썸네일">
                <div class="card-content">
                    <h3>[게임 리뷰] 출시 예정인 기대작 TOP 5</h3>
                    <p>2025년 가장 기대되는 신작 게임 미리보기.</p>
                </div>
            </div>
            <div class="card">
                <img src="[URL_유튜브_3]" alt="유튜브 썸네일">
                <div class="card-content">
                    <h3>[영화 리뷰] 2025년 아카데미 시상식 예측</h3>
                    <p>작품상 후보 예측과 분석.</p>
                </div>
            </div>
        </div>
    </div>

    <hr style="margin: 40px 0; border: 1px solid #ddd;">

    <div class="section gallery-section">
        <h2>📸 커뮤니티 BEST 갤러리</h2>
        <div class="thumbnail-grid" style="grid-template-columns: repeat(4, 1fr);">
            <div class="card">
                <img src="[URL_갤러리_1]" alt="팬아트">
                <div class="card-content">
                    <h3>[팬아트] 듄의 스틸레토</h3>
                    <p>by 유저A</p>
                </div>
            </div>
            <div class="card">
                <img src="[URL_갤러리_2]" alt="코스프레">
                <div class="card-content">
                    <h3>[코스프레] 발로란트 제트</h3>
                    <p>by 유저B</p>
                </div>
            </div>
            <div class="card">
                <img src="[URL_갤러리_3]" alt="음식">
                <div class="card-content">
                    <h3>[자유] 주말에 만든 특제 라면</h3>
                    <p>by 유저C</p>
                </div>
            </div>
            <div class="card">
                <img src="[URL_갤러리_4]" alt="게임 스크린샷">
                <div class="card-content">
                    <h3>[스크린샷] 스타필드 은하수</h3>
                    <p>by 유저D</p>
                </div>
            </div>
        </div>
    </div>
				
			</div>
		</div>

		<!-- 오른쪽 사이드 -->

		<%@ include file="right-sidebar.jsp"%>
		<div class="banner-ad">
			<a
				href="https://www.yuhan.co.kr/Main/">
				<img src="https://doctorsnews.co.kr/news/photo/202511/162187_133261_5053.png">
			</a>
		</div>
	</div>

	<!-- 푸터 -->
	<%@ include file="footer.jsp"%>
</body>
</html>
