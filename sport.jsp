<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>스포츠 게시판 - PlayCulture</title>
    <style>
        body { margin: 0; font-family: "Segoe UI", sans-serif; background: #f4f4f4; color: #333; }
        header { background: #2c3e50; color: #fff; padding: 20px 0; text-align: center; }
        nav { margin-top: 10px; }
        nav a { color: #ddd; margin: 0 15px; text-decoration: none; font-weight: bold; }
        nav a:hover { color: #fff; }
		a { color: inherit; text-decoration: none; /* 부모 요소의 글씨 색상을 상속받아 파란색을 없애고 밑줄을 없앱니다. */
}

        .container { display: grid; grid-template-columns: 250px 1fr 250px; gap: 20px; width: 1200px; margin: 20px auto; }
        .left-sidebar, .right-sidebar { display: flex; flex-direction: column; gap: 20px; }
        .section { background: #fff; padding: 15px; border-radius: 6px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .section h2 { font-size: 16px; margin-bottom: 10px; border-bottom: 2px solid #3498db; padding-bottom: 5px; }

        .thumbnail-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px; }
        .card { background: #fff; border-radius: 6px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.1); transition: transform 0.2s; }
        .card:hover { transform: translateY(-5px); }
        .card img { width: 100%; height: 160px; object-fit: cover; }
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
        <h1>스포츠 게시판</h1>
        <nav>
            <a href="index.jsp">메인</a>

        </nav>
    </header>

    <!-- 메인 컨테이너 -->
    <div class="container">
        <!-- 왼쪽 사이드 -->
        <div class="left-sidebar">
            <div class="section">
		    <h2>주요 정보 사이트</h2>
			    <p><a href="https://m.sports.naver.com/index">📢 네이버 스포츠</a></p>
			    <p><a href="https://www.premierleague.com/en">⚽️ 프리미어 리그</a></p>
			    <p><a href="https://www.nba.com/">🏀 NBA</a></p>
		</div>
            <div class="section">
                <h2>인기 게시글</h2>
                <p>🔥 EPL 주간 베스트 매치 리뷰</p>
                <p>⚽ K리그 득점왕 경쟁 현황</p>
            </div>
        </div>

        <!-- 메인 -->
        <div class="main">
            <!-- 카드형 게시글 -->
            <div class="thumbnail-grid">
                <div class="card">
				    <a href="https://www.youtube.com/watch?v=D92kXnQ3aDY" target="_blank">
				        <img src="https://img.youtube.com/vi/D92kXnQ3aDY/hqdefault.jpg" alt="국가대표">
				    </a>
				    <div class="card-content">
				        <h3>최근 국가대표 경기</h3>
				        <p>치열했던 경기 주요 장면 정리</p>
				    </div>
				</div>
                <div class="card">
                	<a href="https://www.youtube.com/watch?v=axNafTgRIeg" target="_blank">
                   		<img src="https://img.youtube.com/vi/axNafTgRIeg/hqdefault.jpg" alt="축구 이미지">
                    </a>
                    <div class="card-content">
                        <h3>국가대표 직캠</h3>
                        <p>국가대표 공식 유튜브</p>
                    </div>
                </div>
            </div>

            <!-- 뉴스 리스트 -->
            <div class="news-list">
                <div class="news-item">
				  <a href="https://www.youtube.com/watch?v=ifApGM5eZIk" target="_blank">
				    <img src="https://img.youtube.com/vi/ifApGM5eZIk/hqdefault.jpg" alt="프리미어리그 하이라이트">
				  </a>
				  <div>
				    <h4>프리미어리그 주간 하이라이트</h4>
				    <p>이번 주 경기 주요 장면</p>
				  </div>
				</div>

                <div class="news-item">
				  <a href="https://www.youtube.com/watch?v=umBzUhvS5gE" target="_blank">
				    <img src="https://img.youtube.com/vi/umBzUhvS5gE/hqdefault.jpg" alt="NBA 하이라이트">
				  </a>
				  <div>
				    <h4>NBA 24-25 스페셜</h4>
				    <p>새 시즌 개막 전 저번 시즌 몰아보기</p>
				  </div>
				</div>
                 <div class="news-item">
				  <a href="https://www.youtube.com/watch?v=5XVLE4u46cg" target="_blank">
				    <img src="https://img.youtube.com/vi/5XVLE4u46cg/hqdefault.jpg" alt="MLB 하이라이트">
				  </a>
				  <div>
				    <h4>MLB 하이라이트</h4>
				    <p>메이저리그 하이라이트</p>
				  </div>
				</div>
            </div>
        </div>
        
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
                <p>1. 손흥민</p>
                <p>2. 맨시티 맨유</p>
                <p>3. 아이콘 매치</p>
                <p>4. 국가대표</p>
            </div>
        </div>
    </div>

    <!-- 푸터 -->
    <footer>
        <p>© 2025 PlayCulture | 스포츠 커뮤니티</p>
    </footer>
</body>
</html>
