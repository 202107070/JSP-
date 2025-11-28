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

header h1 a {
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
<script>
	function checkEnter(event) {
		// ⭐️ event.keyCode === 13은 Enter 키를 의미합니다. ⭐️
		if (event.keyCode === 13) {
			// 기본 폼 제출 동작을 막고 (이 경우엔 불필요하지만 습관적으로 넣어주는 것이 좋음)
			event.preventDefault();

			// 돋보기 버튼 클릭 시 실행하는 검색 함수 호출
			submitSearch();

			// 검색 제안 목록이 있다면 닫아줍니다.
			var resultsDiv = document.getElementById('searchResults');
			if (resultsDiv) {
				resultsDiv.style.display = 'none';
			}
		}
	}
	function submitSearch() {
		var query = document.getElementById('searchInput').value;

		// 1. 공백 제거 후 검색어 길이 검사
		if (query.trim() === '') {
			alert('검색어를 입력해 주세요.');
			return;
		}

		// 2. 최소 길이 검사 (2글자 이상)
		if (query.length < 2) {
			alert('검색어는 최소 2글자 이상이어야 합니다.');
			return;
		}

		// 3. ⭐️ 정규 표현식 유효성 검사 ⭐️
		// 정규식: ^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]*$
		//   - ^ : 문자열 시작
		//   - [a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣] : 영문 대소문자, 숫자, 모든 한글 자음/모음/완성형 허용
		//   - * : 0번 이상 반복 (검사 전에 이미 길이 체크했으므로 1번 이상이어도 무방)
		//   - $ : 문자열 끝
		var regExp = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]*$/;

		if (!regExp.test(query)) {
			alert('검색어는 한글, 영어, 숫자만 사용할 수 있습니다.');
			return; // 유효성 검사 실패 시 검색 중단
		}

		// 4. 유효성 검사 통과 시 검색 실행
		// 검색 결과 페이지(boardmain.jsp)로 검색어를 쿼리 파라미터 'q'로 넘기며 이동
		location.href = 'boardmain.jsp?q=' + encodeURIComponent(query);
	}
	function searchPosts(query) {
		var resultsDiv = document.getElementById('searchResults');

		// 2글자 미만일 때는 검색 제안 숨기기
		if (query.length < 2) {
			resultsDiv.style.display = 'none';
			return;
		}

		var xhr = new XMLHttpRequest();
		// searchAction.jsp에 검색어 전송
		xhr
				.open('GET', 'searchAction.jsp?q=' + encodeURIComponent(query),
						true);

		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				// 서버에서 받은 HTML 결과를 삽입
				resultsDiv.innerHTML = xhr.responseText;
				resultsDiv.style.display = 'block';
			}
		};

		xhr.send();
	}

	// 검색창 밖을 클릭하면 결과창 닫기
	document.addEventListener('click', function(event) {
		var searchInput = document.getElementById('searchInput');
		var resultsDiv = document.getElementById('searchResults');

		// 검색창과 결과창이 아닌 다른 곳을 클릭했을 때 숨기기
		if (resultsDiv && searchInput && !resultsDiv.contains(event.target)
				&& !searchInput.contains(event.target)) {
			resultsDiv.style.display = 'none';
		}
	});
</script>
<header>
	<div class="header-main-content">
		<h1>
			<a href="index.jsp">yuven</a>
		</h1>

		<div class="search-bar">
			<input type="text" placeholder="검색어를 입력해 주세요" class="search-input"
				id="searchInput" onkeyup="searchPosts(this.value)"
				onkeydown="checkEnter(event)">
			<button type="submit" class="search-button" onclick="submitSearch()">🔍</button>
		</div>

		<div id="searchResults"
			style="position: absolute; width: 500px; z-index: 100; background: white; border: 1px solid #b91c1c; border-top: none; display: none; left: 50%; transform: translateX(-50%); top: 85px; border-radius: 0 0 6px 6px;">
		</div>
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
