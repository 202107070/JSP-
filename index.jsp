<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>문화 취미 커뮤니티</title>
    <style>
        body { margin: 0; font-family: "Segoe UI", sans-serif; background: #f4f4f4; color: #333; }
        header { background: #2c3e50; color: #fff; padding: 20px 0; text-align: center; }
        nav { margin-top: 10px; }
        nav a { color: #ddd; margin: 0 15px; text-decoration: none; font-weight: bold; }
        nav a:hover { color: #fff; }

        .container { display: grid; grid-template-columns: 250px 1fr 250px; gap: 20px; width: 1200px; margin: 20px auto; }
        .left-sidebar, .right-sidebar { display: flex; flex-direction: column; gap: 20px; }
        .section { background: #fff; padding: 15px; border-radius: 6px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .section h2 { font-size: 16px; margin-bottom: 10px; border-bottom: 2px solid #3498db; padding-bottom: 5px; }

        .thumbnail-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }
        .card { background: #fff; border-radius: 6px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.1); transition: transform 0.2s; }
        .card:hover { transform: translateY(-5px); }
        .card img { width: 100%; height: 150px; object-fit: cover; }
        .card-content { padding: 10px; }
        .card-content h3 { margin: 0; font-size: 14px; font-weight: bold; }
        .card-content p { font-size: 12px; color: #555; margin-top: 5px; }

        .news-list { margin-top: 30px; }
        .news-item { display: flex; gap: 15px; margin-bottom: 15px; background: #fff; padding: 10px; border-radius: 6px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .news-item img { width: 120px; height: 80px; object-fit: cover; border-radius: 4px; }
        .news-item h4 { margin: 0; font-size: 14px; font-weight: bold; }
        .news-item p { font-size: 12px; color: #555; margin-top: 5px; }

        .login-box input { width: 100%; padding: 8px; margin: 8px 0; border: 1px solid #ccc; border-radius: 4px; }
        .login-box button { width: 100%; padding: 10px; border: none; background: #3498db; color: white; font-weight: bold; border-radius: 4px; cursor: pointer; }
        .login-box button:hover { background: #2980b9; }

        footer { background: #2c3e50; color: #aaa; text-align: center; padding: 15px; margin-top: 30px; font-size: 13px; }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <header>
        <h1>문화 취미 커뮤니티</h1>
        <nav>
            <a href="game.jsp">게임</a>
            <a href="music.jsp">음악</a>
            <a href="movie.jsp">영화</a>
            <a href="board.jsp">게시판</a>
            <a href="event.jsp">이벤트</a>
            <a href="sport.jsp">스포츠</a>
            <a href="sportgame.jsp">스포츠 게임</a>
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
                <h2>인기 게시글</h2>
                <p>🔥 지금 가장 핫한 PC 게임 Top 5</p>
                <p>🎥 이번 주말 추천 영화</p>
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
            </div>
        </div>

        <!-- 오른쪽 사이드 -->
        <div class="right-sidebar">
            <div class="section login-box">
                <h2>로그인</h2>
                <form action="loginAction.jsp" method="post">
                    <input type="text" name="userid" placeholder="아이디">
                    <input type="password" name="password" placeholder="비밀번호">
                    <button type="submit">로그인</button>
                </form>
            </div>
            <div class="section">
                <h2>실시간 인기 검색</h2>
                <p>1. 발로란트</p>
                <p>2. 아이유 신곡</p>
                <p>3. 듄: 파트2</p>
                <p>4. 스타필드</p>
            </div>
        </div>
    </div>

    <!-- 푸터 -->
    <footer>
        <p>© 2025 문화생활팀 | JSP 프로젝트 | 회사소개 · 개인정보처리방침 · 이용약관</p>
    </footer>
</body>
</html>
