<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

header {
	background: #f4f4f4;
	color: #fff;
	padding: 0;
}
.header-main-content {
    display: flex;
    align-items: center; /* 세로 중앙 정렬 */
    justify-content: center; /* 중앙 정렬 */
    padding: 20px 0; /* 기존 header의 상하 패딩을 이리로 옮김 */
    width: 800px; /* 내용물 크기만큼 너비를 설정 */
    margin: 0 auto;
}
header h1 {
	margin: 0;
	margin-right: 30px;
	font-size: 40px;
}

header h1 a{
	color: #C90000;
	text-decoration: none;
}
.search-bar {
    display: flex;
    align-items: center;
    width: 500px; /* 검색창 너비 지정 */
    max-width: 40%;
    height: 45px; 
    
    /* 인벤의 붉은 테두리 */
    border: 3px solid #b91c1c; 
    border-radius: 25px; 
    overflow: hidden;
    background: white; /* 입력 필드 배경색 */
}
.search-input {
    flex-grow: 1;
    border: none;
    padding: 0 15px;
    font-size: 16px;
    color: #333;
    outline: none;
    /* placeholder 텍스트 스타일 */
    text-align: left;
}
.search-button {
    background: transparent;
    border: none;
    cursor: pointer;
    color: #b91c1c; /* 돋보기 색상 */
    font-size: 24px;
    padding: 0 15px;
}
header hr {
	background: #DDDDDD;
	margin: 0;
	height: 1px;
	border: none;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); 
}

nav {
	display: flex; /* 모든 메뉴를 가로로 정렬 */
	justify-content: center; /* 메뉴들을 가운데 정렬 */
	background: #f4f4f4; /* 배경색 통일 */
	padding: 0; /* 상하 여백 */
	gap: 5px; /* 메뉴 항목 사이 간격 */
}

nav a {
	color: #242424;
	text-decoration: none;
	font-weight: bold;
	padding: 7px 2px; /* 메뉴 규격 통일을 위한 패딩 */
	font-size: 18px;
	white-space: nowrap; /* 메뉴가 줄바꿈되지 않게 방지 */
	margin: 0 15px;
}

nav a:hover {
	color: #DB0000;
}

.dropdown {
	display: inline-block;
	position: relative; /* ⭐️ 핵심: 하위 메뉴의 기준점 설정 ⭐️ */
	padding: 0 10px; /* 앵커 태그와 동일한 좌우 여백 */
}

.dropdown:hover .submenu {
	display: block;
}

.dropdown-btn {
	/* 앵커 태그와 규격 맞추기 */
	font-weight: bold;
	padding: 7px 0; /* 앵커 태그와 높이를 맞추기 위한 패딩 조정 */
	font-size: 18px;
	/* 배경/테두리 제거 및 색상 통일 */
	background: transparent; /* ⭐️ 배경색 투명으로 설정 ⭐️ */
	border: none;
	outline: none;
	cursor: pointer;
	color: #242424;
}

.dropdown-btn:hover {
	color: #DB0000;
}

.submenu {
	display: none; /*처음에 안보이게*/
	width: 150px;
	position: absolute;
	top: 100%; /* 부모 요소 바로 아래에 겹쳐서 나타남 */
	left: 50%;
	transform: translateX(-50%); /* 중앙 정렬 */
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
	z-index: 10;
	background: #EAEAEA;
	border-radius: 6px;
}

.submenu a {
	display: block; /*a 태그는 가로배치 이므로 세로배치로 변경*/
	padding: 7px;
	text-align: center;
}
</style>
<header>
	<div class="header-main-content">
        <h1><a href="index.jsp">yuven</a></h1>
        
        <form class="search-bar" action="#">
            <input type="text" placeholder="검색어를 입력해 주세요" class="search-input">
            <button type="submit" class="search-button">🔍</button>
        </form>
    </div>
	<hr>
	<nav>
		<div class="dropdown">
			<button class="dropdown-btn">게임</button>
			<div class="submenu">
				<a href="sportgame.jsp">스포츠 게임</a> <a href="menu.jsp">스팀 게임</a>
			</div>
		</div>
		<a href="music.jsp">음악</a> <a href="movie.jsp">영화</a> <a
			href="sport.jsp">스포츠</a> <a href="boardmain.jsp">게시판</a>
	</nav>
	<hr>
</header>
