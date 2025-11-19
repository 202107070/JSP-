<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>YuhanGames - 메인</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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

    /* 탑 배너 */
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
    .news-card {display:flex; gap:12px; padding:30px 0; border-bottom:1px solid var(--line); width:100%; cursor:pointer;}
    .news-card:last-child {border-bottom:none;}
    .news-card img {width:120px; height:80px; object-fit:cover; border-radius:6px; flex-shrink:0;}
    .news-card .info {flex:1;}
    .news-card h3 {font-size:16px; margin-bottom:6px;}
    .news-card p.meta {font-size:12px; color:var(--muted); margin:0;}
    .news-card:hover {background:#f8f8f8; border-radius:6px; transition:0.2s; padding:30px 10px; margin: 0 -10px;} 

    /* 인기글 섹션 */
    .popular-section {margin-top:40px;}
    .popular-section h2 {font-size:20px; margin-bottom:15px; color:var(--brand); font-weight:700;}
    .popular-list {display:flex; flex-direction:column; gap:12px;}
    .popular-item {
      display:flex;
      gap:12px;
      align-items:center;
      cursor:pointer;
      padding:6px;
      border-radius:8px;
      transition:0.2s;
    }
    .popular-item img {
      width:100px;
      height:70px;
      object-fit:cover;
      border-radius:6px;
      flex-shrink:0;
    }
    .popular-item h4 {font-size:15px; margin:0;}
    .popular-item p {font-size:12px; color:var(--muted); margin:2px 0 0;}
    .popular-item:hover {background:#f0f0f0; transform:translateY(-2px);}

    /* 사이드바 */
    .sidebar .widget, .sidebar-left .widget {
      margin-bottom:20px; border:1px solid var(--line); border-radius:10px; padding:12px; background:#fafafa;
    }
    .widget h4 {font-size:15px; margin-bottom:10px; border-bottom:1px solid var(--line); padding-bottom:6px;}
    .sidebar .widget ul, .sidebar-left .widget ul {list-style:none; padding:0; margin:0;}
    .sidebar .widget ul li, .sidebar-left .widget ul li {
      margin-bottom:8px; font-size:14px; word-break:break-word; white-space:normal; line-height:1.4;
    }
    
    /* 수정된 부분: 게시글 작성 영역 스타일 - 테두리 및 배경색 완전히 제거 */
    .write-box {
      /* border, background, border-radius 제거 */
      padding: 20px 0; /* padding을 위아래로만 유지하거나 조정 */
      margin-bottom: 20px;
      text-align: center;
      cursor: pointer;
      transition: all 0.2s ease-in-out;
    }
    .write-box:hover {
      background: #f0f0f0; /* 호버 시 아주 연한 배경색 적용 */
      box-shadow: none;
      transform: translateY(-1px);
    }
    .write-box h4 {
      font-size: 18px;
      color: var(--brand);
      font-weight: 700;
      margin: 0;
    }
    .write-box p {
        font-size: 14px;
        color: var(--muted);
        margin-top: 5px;
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
        <li><a href="/index.jsp">메뉴</a></li> 
        <li><a href="Board.jsp">게시글</a></li>
        <li><a href="sport.jsp">스포츠</a></li>
		<li><a href="sportgame.jsp">스포츠게임</a></li>
      </ul>
    </nav>
    <div>
      <a href="login_2.jsp" style="color: var(--nav-text);">로그인</a> | <a href="register.jsp" style="color: var(--nav-text);">회원가입</a>
    </div>
  </header>

  <div class="top-banner">
    <img src="image/탑 배너_2.jpg" alt="탑 배너" />
  </div>

  <div class="container">
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
      
      <a href="Board.jsp" class="write-box">
          <h4>✍️ 게시글 작성하기</h4>
          <p>나만의 게임 소식을 공유해보세요!</p>
      </a>

    </aside>

    <main class="main">
      <div class="headline">
        <img src="image/PEAK.jpg" alt="메인 뉴스" />
        <div class="title">친구들이랑 하기 좋은 게임 'PEAK'</div>
      </div>

      <div class="news-section">
        <div class="news-card" onclick="location.href='web2.jsp';">
          <img src="image/광고배너_2.jpg" alt="기사1" />
          <div class="info">
            <h3>9월 4일 사냥이 시작 된다(Hollow_Knight)</h3>
            <p class="meta">신재연 기자 • 2025-09-14</p>
          </div>
        </div>

        <div class="news-card" onclick="location.href='web1.jsp';">
          <img src="image/Stardew_Valley.jpg" alt="기사2" />
          <div class="info">
            <h3>혼자서 하기 좋은 힐링 게임</h3>
            <p class="meta">이영 기자 • 2025-09-14</p>
          </div>
        </div>

        <div class="popular-section">
          <h2>🔥 인기글</h2>
          <div class="popular-list">
            <div class="popular-item" onclick="location.href='https://store.steampowered.com/app/3241660/REPO/';">
              <img src="image/REPO.jpg" alt="인기글1" />
              <div>
                <h4>4인 인기 공포게임 R.E.P.O.</h4>
                <p>2025-09-13</p>
              </div>
            </div>
            <div class="popular-item" onclick="location.href='https://store.steampowered.com/app/3167020/Escape_From_Duckov/';">
              <img src="image/Duckov.jpg" alt="인기글2" />
              <div>
                <h4>PVPE 새로운 타르코프류 비대칭 쿼터뷰 총게임</h4>
                <p>2025-10-16</p>
              </div>
            </div>
            <div class="popular-item" onclick="location.href='https://store.steampowered.com/app/2060160/_/?l=koreana';">
              <img src="image/peasant.jpg" alt="인기글3" />
              <div>
                <h4>코딩 할줄 아는 사람에게 추천!! '농부는 대체되었다'</h4>
                <p>2025-09-11</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

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
