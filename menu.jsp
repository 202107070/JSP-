<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>YuhanGames - 메인</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --bg: #fff;
      --text: #111;
      --muted: #666;
      --brand: #d72638;
      --line: #ddd;
      --nav-bg: #0d1033;
      --nav-text: #fff;
    }

    * {margin:0; padding:0; box-sizing:border-box;}
    body {font-family: Pretendard, sans-serif; background: var(--bg); color: var(--text);}
    a {text-decoration:none; color:inherit;}
    
    /* 헤더 */
    header {
      border-bottom:1px solid var(--line);
      padding:10px 20px;
      display:flex;
      align-items:center;
      justify-content:space-between;
      flex-wrap:wrap;
      background: var(--nav-bg);
    }
    header .logo {font-size:26px; font-weight:700; color: var(--nav-text);}
    nav ul {display:flex; list-style:none; gap:20px; font-size:15px; flex-wrap:wrap;}
    nav ul li a {color: var(--nav-text); font-weight:600;}

    /* 배너 */
    .top-banner {text-align:center; margin:10px 0;}
    .top-banner img {width:1200px; height:200px; object-fit:cover; border-radius:10px;}

    /* 본문 */
    .container {display:flex; gap:20px; max-width:1200px; margin:20px auto; padding:0 20px;}
    .sidebar-left {flex:1;}
    .main {flex:3;}
    .sidebar {flex:1;}

    /* 헤드라인 */
    .headline {position:relative;}
    .headline img {width:100%; border-radius:10px;}
    .headline .title {
      position:absolute; bottom:0; left:0; right:0;
      background:rgba(0,0,0,0.6); color:#fff; padding:12px; font-size:20px;
    }

    /* 뉴스 카드 */
    .news-section {margin-top:30px;}
    .news-card {display:flex; gap:12px; padding:30px 0; border-bottom:1px solid var(--line); width:100%;}
    .news-card:last-child {border-bottom:none;}
    .news-card img {width:120px; height:80px; object-fit:cover; border-radius:6px; flex-shrink:0;}
    .news-card .info {flex:1;}
    .news-card h3 {font-size:16px; margin-bottom:6px;}
    .news-card p.meta {font-size:12px; color:var(--muted); margin:0;}

    /* 인기글 섹션 */
    .popular-section {margin-top:40px;}
    .popular-section h2 {font-size:20px; margin-bottom:15px; color:var(--brand); font-weight:700;}
    .popular-list {display:flex; flex-direction:column; gap:12px;}
    .popular-item {display:flex; gap:12px; align-items:center; cursor:pointer;}
    .popular-item img {width:80px; height:60px; object-fit:cover; border-radius:6px;}
    .popular-item h4 {font-size:15px; margin:0;}
    .popular-item p {font-size:12px; color:var(--muted); margin:2px 0 0;}
    .popular-item:hover {background:#f0f0f0; border-radius:6px; transition:0.2s;}

    /* 사이드바 */
    .sidebar .widget, .sidebar-left .widget {
      margin-bottom:20px; border:1px solid var(--line); border-radius:10px; padding:12px; background:#fafafa;
    }
    .widget h4 {font-size:15px; margin-bottom:10px; border-bottom:1px solid var(--line); padding-bottom:6px;}
    .sidebar .widget ul, .sidebar-left .widget ul {list-style:none; padding:0; margin:0;}
    .sidebar .widget ul li, .sidebar-left .widget ul li {
      margin-bottom:8px; font-size:14px; word-break:break-word; white-space:normal; line-height:1.4;
    }

    /* 푸터 */
    footer {margin-top:40px; padding:20px; border-top:1px solid var(--line); font-size:13px; text-align:center; color: var(--nav-text); background: var(--nav-bg);}

    /* 반응형 */
    @media (max-width: 768px) {
      .container {flex-direction: column;}
      .news-card {flex-direction: column;}
      .news-card img {width:100%; height:auto;}
      .popular-item {flex-direction:column; align-items:flex-start;}
      .popular-item img {width:100%; height:auto;}
      nav ul {gap:10px; font-size:14px;}
      header {flex-direction:column; align-items:flex-start; gap:10px;}
    }
  </style>
</head>
<body>
  <header>
    <a href="menu.jsp"><span class="logo">GameLinks</span></a>
    <nav>
      <ul>
        <li><a href="#">뉴스</a></li>
        <li><a href="#">리뷰</a></li>
        <li><a href="#">특집</a></li>
        <li><a href="#">모바일</a></li>
        <li><a href="#">웹게임</a></li>
        <li><a href="팀플/index.jsp">취미</a></li>
      </ul>
    </nav>
    <div>
      <a href="login_2.jsp" style="color: var(--nav-text);">로그인</a> | <a href="register.jsp" style="color: var(--nav-text);">회원가입</a>
    </div>
  </header>

  <div class="top-banner"> <%-- 탑 배너 아직 추가 안함 --%> 
    <img src="image/탑 배너.jpg" alt="탑 배너" />
  </div>

  <div class="container">
    <!-- 왼쪽 사이드바 -->
    <aside class="sidebar-left">
      <div class="widget">
        <h4>인기광고</h4>
        <img src="image/PALWORLD.jpg" alt="인기광고" style="width:100%; border-radius:6px;" />
      </div>
      <div class="widget">
        <h4>추천</h4>
        <a href="#">
          <img src="image/BABY_STEPS.jpg" alt="현재 매출 상위권 게임" style="width:100%; border-radius:6px;" />
        </a>
      </div>
    </aside>

    <!-- 메인 컨텐츠 -->
    <main class="main">
      <div class="headline">
        <img src="image/PEAK.jpg" alt="메인 뉴스" /> <%-- 메인 사진 수정할 예정 --%> 
        <div class="title">친구들이랑 하기 좋은 게임 'PEAK'</div>
      </div>

      <div class="news-section">
        <div class="news-card">
          <img src="image/광고배너_2.jpg" alt="기사1" />
          <div class="info">
            <h3>9월 4일 사냥이 시작 된다(Hollow_Knight)</h3>
            <p class="meta">신재연 기자 • 2025-09-14</p>
          </div>
        </div>
        <div class="news-card" onclick="location.href='web1.jsp';" style="cursor:pointer;">
          <img src="image/Stardew_Valley.jpg" alt="기사2" />
          <div class="info">
            <h3>혼자서 하기 좋은 힐링 게임</h3>
            <p class="meta">이영 기자 • 2025-09-14</p>
          </div>
        </div>

        <!-- 인기글 섹션 -->
        <div class="popular-section">
          <h2>🔥 인기글</h2>
          <div class="popular-list">
            <div class="popular-item" onclick="location.href='#';">
              <img src="popular1.jpg" alt="인기글1" />
              <div>
                <h4>혼자서도 즐길 수 있는 게임 추천</h4>
                <p>2025-09-13</p>
              </div>
            </div>
            <div class="popular-item" onclick="location.href='#';">
              <img src="popular2.jpg" alt="인기글2" />
              <div>
                <h4>PEAK 게임 리뷰</h4>
                <p>2025-09-12</p>
              </div>
            </div>
            <div class="popular-item" onclick="location.href='#';">
              <img src="popular3.jpg" alt="인기글3" />
              <div>
                <h4>Stardew Valley 힐링 플레이</h4>
                <p>2025-09-11</p>
              </div>
            </div>
          </div>
        </div>
        <!-- 인기글 섹션 끝 -->
        
      </div>
    </main>

    <!-- 오른쪽 사이드바 -->
    <aside class="sidebar">
      <div class="widget">
        <h4>실시간 인기</h4>
        <ul>
          <li><a href="#">Stardew_Valley</a></li>
          <li><a href="#">PUBG</a></li>
          <li><a href="#">Hollow_Knight_Silksong</a></li>
          <li><a href="#">PEAK</a></li>
        </ul>
      </div>
      <div class="widget">
        <h4>인기광고</h4>
        <img src="image/PUBG.jpg" alt="인기광고" style="width:100%; border-radius:6px;" />
      </div>
      <div class="widget">
        <h4>추천</h4>
        <a href="#">
          <img src="image/광고배너.jpg" alt="현재 매출 상위권 게임" style="width:100%; border-radius:6px;" />
        </a>
      </div>
    </aside>
  </div>
  
  <footer>
    ⓒ 2025 GameLinks. All rights reserved.
  </footer>
</body>
</html>
