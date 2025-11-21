<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
header {
	background: #2c3e50;
	color: #fff;
	padding: 40px 0 0 0;
	text-align: center;
}

header h1 {
	margin: 0;
	margin-bottom: 20px;
	font-size: 24px;
}

header h1 a{
	color: inherit;
	text-decoration: none;
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
}

.submenu a {
	display: block; /*a 태그는 가로배치 이므로 세로배치로 변경*/
	padding: 7px;
	text-align: center;
}
</style>
<header>
	<h1><a href="index.jsp">yuven</a></h1>
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
