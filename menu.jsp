<%@ page contentType="text/html; charset=UTF-8" language="java" %> <%-- JSP 페이지 설정: 인코딩 UTF-8, 언어 Java --%>
<!DOCTYPE html> <%-- HTML5 문서 선언 --%>
<html lang="ko"> <%-- 문서 언어를 한국어로 설정 --%>
<head>
  <meta charset="UTF-8"> <%-- 문자 인코딩 UTF-8 설정 --%>
  <meta name="viewport" content="width=device-width, initial-scale=1"> <%-- 반응형 화면 설정 --%>
  <title>YuhanGames - 메인</title> <%-- 페이지 제목 --%>
  
  <link rel="preconnect" href="https://fonts.googleapis.com"> <%-- 구글 폰트 사전 연결 --%>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> <%-- 폰트 로딩 최적화 --%>
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700&display=swap" rel="stylesheet"> <%-- 프리텐다드 폰트 불러오기 --%>

  <style>
    :root { <%-- CSS 전역 변수 선언 --%>
      --bg: #fff; <%-- 기본 배경색 --%>
      --text: #111; <%-- 기본 글자색 --%>
      --muted: #666; <%-- 희미한 텍스트 색상 --%>
      --brand: #d72638; <%-- 브랜드 강조 색상 --%>
      --line: #ddd; <%-- 라인 색상 --%>
      --nav-bg: #0d1033; <%-- 네비게이션 배경색 --%>
      --nav-text: #fff; <%-- 네비게이션 텍스트 색 --%>
    }

    * {margin:0; padding:0; box-sizing:border-box;} <%-- 기본 요소 여백 제거 --%>
    body {font-family: Pretendard, sans-serif; background: var(--bg); color: var(--text);} <%-- 전체 페이지 스타일 --%>
    a {text-decoration:none; color:inherit;} <%-- 링크 밑줄 제거 + 글자색 상속 --%>

    /* 헤더 */
    header { <%-- 상단 header 영역 스타일 --%>
      border-bottom:1px solid var(--line); <%-- 아래 테두리 --%>
      padding:10px 20px; <%-- 내부 여백 --%>
      display:flex; align-items:center; justify-content:space-between; flex-wrap:wrap; <%-- 플렉스 정렬 --%>
      background: var(--nav-bg); <%-- 헤더 배경색 --%>
    }
    header .logo {font-size:26px; font-weight:700; color: var(--nav-text);} <%-- 로고 텍스트 스타일 --%>
    nav ul {display:flex; list-style:none; gap:20px; font-size:15px; flex-wrap:wrap;} <%-- 네비게이션 메뉴 스타일 --%>
    nav ul li a {color: var(--nav-text); font-weight:600;} <%-- 네비 링크 색 지정 --%>

    /* 탑 배너 */
    .top-banner {text-align:center; margin:10px 0;} <%-- 탑 배너 정렬 --%>
    .top-banner img {width:1200px; height:200px; object-fit:cover; border-radius:10px;} <%-- 배너 이미지 크기 및 둥근 모서리 --%>

    /* 본문 */
    .container {display:flex; gap:20px; max-width:1200px; margin:20px auto; padding:0 20px;} <%-- 페이지 본문 컨테이너 --%>
    .sidebar-left {flex:1;} <%-- 왼쪽 사이드바 비율 --%>
    .main {flex:3;} <%-- 메인 콘텐츠 비율 --%>
    .sidebar {flex:1;} <%-- 오른쪽 사이드바 비율 --%>

    /* 헤드라인 */
    .headline {position:relative;} <%-- 이미지 위 텍스트 배치 위해 relative --%>
    .headline img {width:100%; border-radius:10px;} <%-- 헤드라인 이미지 스타일 --%>
    .headline .title {
      position:absolute; bottom:0; left:0; right:0; <%-- 이미지 아래쪽에 텍스트 고정 --%>
      background:rgba(0,0,0,0.6); color:#fff; padding:12px; font-size:20px; <%-- 오버레이 스타일 --%>
    }

    /* 뉴스 카드 */
    .news-section {margin-top:30px;} <%-- 뉴스 영역 위 여백 --%>
    .news-card {display:flex; gap:12px; padding:30px 0; border-bottom:1px solid var(--line); width:100%; cursor:pointer;} <%-- 뉴스 카드 레이아웃 --%>
    .news-card:last-child {border-bottom:none;} <%-- 마지막 카드 테두리 제거 --%>
    .news-card img {width:120px; height:80px; object-fit:cover; border-radius:6px; flex-shrink:0;} <%-- 카드 내 이미지 설정 --%>
    .news-card .info {flex:1;} <%-- 텍스트 영역 확장 --%>
    .news-card h3 {font-size:16px; margin-bottom:6px;} <%-- 뉴스 제목 스타일 --%>
    .news-card p.meta {font-size:12px; color:var(--muted); margin:0;} <%-- 뉴스 부가 정보 --%>
    .news-card:hover {background:#f8f8f8; border-radius:6px; transition:0.2s; padding:30px 10px; margin: 0 -10px;} <%-- 호버 효과 --%>

    /* 인기글 섹션 */
    .popular-section {margin-top:40px;} <%-- 인기글 영역 위 여백 --%>
    .popular-section h2 {font-size:20px; margin-bottom:15px; color:var(--brand); font-weight:700;} <%-- 인기글 제목 스타일 --%>
    .popular-list {display:flex; flex-direction:column; gap:12px;} <%-- 세로 정렬 --%>
    .popular-item {
      display:flex; gap:12px; align-items:center; cursor:pointer; padding:6px; border-radius:8px; transition:0.2s;
    } <%-- 인기글 아이템 스타일 --%>
    .popular-item img {width:100px; height:70px; object-fit:cover; border-radius:6px; flex-shrink:0;} <%-- 이미지 스타일 --%>
    .popular-item h4 {font-size:15px; margin:0;} <%-- 인기글 제목 --%>
    .popular-item p {font-size:12px; color:var(--muted); margin:2px 0 0;} <%-- 날짜 표시 --%>
    .popular-item:hover {background:#f0f0f0; transform:translateY(-2px);} <%-- 호버 시 살짝 위로 --%>

    /* 사이드바 */
    .sidebar .widget, .sidebar-left .widget {margin-bottom:20px; border:1px solid var(--line); border-radius:10px; padding:12px; background:#fafafa;} <%-- 공통 위젯 스타일 --%>
    .widget h4 {font-size:15px; margin-bottom:10px; border-bottom:1px solid var(--line); padding-bottom:6px;} <%-- 위젯 제목 스타일 --%>
    .sidebar .widget ul, .sidebar-left .widget ul {list-style:none; padding:0; margin:0;} <%-- 리스트 기본 스타일 제거 --%>
    .sidebar .widget ul li, .sidebar-left .widget ul li {margin-bottom:8px; font-size:14px; word-break:break-word; white-space:normal; line-height:1.4;} <%-- 리스트 아이템 --%>

    /* 게시글 작성 박스 */
    .write-box {padding: 20px 0; margin-bottom: 20px; text-align: center; cursor: pointer; transition: all 0.2s ease-in-out;} <%-- 테두리 제거된 작성 박스 --%>
    .write-box:hover {background: #f0f0f0; transform: translateY(-1px);} <%-- 호버 효과 --%>
    .write-box h4 {font-size: 18px; color: var(--brand); font-weight: 700; margin: 0;} <%-- 텍스트 스타일 --%>
    .write-box p {font-size: 14px; color: var(--muted); margin-top: 5px;} <%-- 설명 텍스트 --%>

    /* 푸터 */
    footer {margin-top:40px; padding:20px; border-top:1px solid var(--line); font-size:13px; text-align:center; color: var(--nav-text); background: var(--nav-bg);} <%-- 페이지 하단 푸터 --%>

    /* 반응형 */
    @media (max-width: 768px) {
      .container {flex-direction: column;} <%-- 모바일: 세로 배치 --%>
      .news-card {flex-direction: column;} <%-- 뉴스 카드 모바일 변환 --%>
      .news-card img {width:100%; height:auto;} <%-- 이미지 풀사이즈 --%>
      .popular-item {flex-direction:column; align-items:flex-start;} <%-- 인기글 모바일 정렬 --%>
      .popular-item img {width:100%; height:auto;} <%-- 이미지 반응형 --%>
      nav ul {gap:10px; font-size:14px;} <%-- 네비 크기 조정 --%>
      header {flex-direction:column; align-items:flex-start; gap:10px;} <%-- 헤더 모바일 배치 --%>
    }
  </style>
</head>
<body>
  <header> <%-- 헤더 시작 --%>
    <a href="menu.jsp"><span class="logo">GameLinks</span></a> <%-- 로고 클릭 시 메뉴 이동 --%>
    <nav>
      <ul> <%-- 네비게이션 메뉴 리스트 --%>
        <li><a href="index.jsp">메인</a></li> <%-- 메인 이동 --%>
        <li><a href="Board.jsp">게시글</a></li> <%-- 게시판 이동 --%>
        <li><a href="sport.jsp">스포츠</a></li> <%-- 스포츠 이동 --%>
        <li><a href="sportgame.jsp">스포츠게임</a></li> <%-- 스포츠게임 이동 --%>
      </ul>
    </nav>
    <div>
      <a href="login_2.jsp" style="color: var(--nav-text);">로그인</a> | <a href="register.jsp" style="color: var(--nav-text);">회원가입</a> <%-- 로그인/회원가입 버튼 --%>
    </div>
  </header>

  <div class="top-banner"> <%-- 상단 배너 영역 --%>
    <img src="image/탑 배너_2.jpg" alt="탑 배너" /> <%-- 배너 이미지 --%>
  </div>

  <div class="container"> <%-- 메인 콘텐츠 컨테이너 --%>
    <aside class="sidebar-left"> <%-- 왼쪽 사이드바 시작 --%>
      
      <div class="widget"> <%-- 광고 위젯 --%>
        <h4>인기광고</h4>
        <img src="image/PALWORLD.jpg" alt="인기광고" style="width:100%; border-radius:6px;" /> <%-- 광고 이미지 --%>
      </div>
      <div class="widget"> <%-- 추천 위젯 --%>
        <h4>추천</h4>
        <a href="#"> <%-- 클릭 시 이동 (현재 빈 링크) --%>
          <img src="image/BABY_STEPS.jpg" alt="현재 매출 상위권 게임" style="width:100%; border-radius:6px;" /> <%-- 추천 이미지 --%>
        </a>
      </div>
      
      <a href="Board.jsp" class="write-box"> <%-- 게시글 작성 박스 --%>
          <h4>✍️ 게시글 작성하기</h4>
          <p>나만의 게임 소식을 공유해보세요!</p>
      </a>

    </aside> <%-- 왼쪽 사이드바 종료 --%>

    <main class="main"> <%-- 메인 콘텐츠 시작 --%>
      <div class="headline"> <%-- 상단 대표 헤드라인 뉴스 이미지 --%>
        <img src="image/PEAK.jpg" alt="메인 뉴스" /> <%-- 헤드라인 이미지 --%>
        <div class="title">친구들이랑 하기 좋은 게임 'PEAK'</div> <%-- 헤드라인 제목 --%>
      </div>

      <div class="news-section"> <%-- 뉴스 섹션 시작 --%>
        <div class="news-card" onclick="location.href='web2.jsp';"> <%-- 클릭 시 web2.jsp 이동 --%>
          <img src="image/광고배너_2.jpg" alt="기사1" /> <%-- 기사1 이미지 --%>
          <div class="info"> <%-- 기사 정보 영역 --%>
            <h3>9월 4일 사냥이 시작 된다(Hollow_Knight)</h3> <%-- 기사 제목 --%>
            <p class="meta">신재연 기자 • 2025-09-14</p> <%-- 작성자 및 날짜 --%>
          </div>
        </div>

        <div class="news-card" onclick="location.href='web1.jsp';"> <%-- 기사2 카드 --%>
          <img src="image/Stardew_Valley.jpg" alt="기사2" /> <%-- 이미지 --%>
          <div class="info">
            <h3>혼자서 하기 좋은 힐링 게임</h3>
            <p class="meta">이영 기자 • 2025-09-14</p>
          </div>
        </div>

        <div class="popular-section"> <%-- 인기글 섹션 --%>
          <h2>🔥 인기글</h2>
          <div class="popular-list"> <%-- 인기글 목록 --%>
            <div class="popular-item" onclick="location.href='https://store.steampowered.com/app/3241660/REPO/';"> <%-- 인기글 1 --%>
              <img src="image/REPO.jpg" alt="인기글1" />
              <div>
                <h4>4인 인기 공포게임 R.E.P.O.</h4>
                <p>2025-09-13</p>
              </div>
            </div>
            <div class="popular-item" onclick="location.href='https://store.steampowered.com/app/3167020/Escape_From_Duckov/';"> <%-- 인기글 2 --%>
              <img src="image/Duckov.jpg" alt="인기글2" />
              <div>
                <h4>PVPE 새로운 타르코프류 비대칭 쿼터뷰 총게임</h4>
                <p>2025-10-16</p>
              </div>
            </div>
            <div class="popular-item" onclick="location.href='https://store.steampowered.com/app/2060160/_/?l=koreana';"> <%-- 인기글 3 --%>
              <img src="image/peasant.jpg" alt="인기글3" />
              <div>
                <h4>코딩 할줄 아는 사람에게 추천!! '농부는 대체되었다'</h4>
                <p>2025-09-11</p>
              </div>
            </div>
          </div>
        </div> <%-- 인기글 섹션 종료 --%>
      </div> <%-- 뉴스 섹션 종료 --%>
    </main> <%-- 메인 콘텐츠 종료 --%>

    <aside class="sidebar"> <%-- 오른쪽 사이드바 --%>
      <div class="widget"> <%-- 실시간 인기 위젯 --%>
        <h4>실시간 인기</h4>
        <ul>
          <li><a href="#">Stardew_Valley</a></li>
          <li><a href="#">PUBG</a></li>
          <li><a href="#">Hollow_Knight_Silksong</a></li>
          <li><a href="#">PEAK</a></li>
        </ul>
      </div>
      <div class="widget"> <%-- 광고 위젯 --%>
        <h4>인기광고</h4>
        <img src="image/PUBG.jpg" alt="인기광고" style="width:100%; border-radius:6px;" />
      </div>
      <div class="widget"> <%-- 추천 위젯 --%>
        <h4>추천</h4>
        <a href="#">
          <img src="image/광고배너.jpg" alt="현재 매출 상위권 게임" style="width:100%; border-radius:6px;" />
        </a>
      </div>
    </aside>
  </div> <%-- container 종료 --%>
  
  <footer> <%-- 푸터 시작 --%>
    ⓒ 2025 GameLinks. All rights reserved. <%-- 저작권 표기 --%>
  </footer>
</body>
</html>