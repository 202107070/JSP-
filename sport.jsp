<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Sports Zone</title>
    <style>
        body {
	    margin: 0;
	    font-family: "Segoe UI", sans-serif;
	    color: #333;
    
	    /* 1. 페이지 기본 배경색 (이 색상과 자연스럽게 이어지게 합니다) */
	    background-color: #f4f4f4;
	    
	    /* 2. 배경 이미지 설정 (순서 중요: 맨 위 코드가 가장 위에 쌓입니다) */
	    background-image: 
        /* [층 1] 맨 위: 하단 페이드 아웃 효과 */
        /* 위쪽(0%~70%)은 투명하다가, 아래쪽(100%)으로 갈수록 배경색(#f4f4f4)이 됨 */
        linear-gradient(to bottom, rgba(244,244,244,0) 90%, #f4f4f4 100%),
        
        /* [층 2] 중간: 상단 글씨 가독성을 위한 그림자 (선택 사항) */
        linear-gradient(to bottom, rgba(0,0,0,0.5) 0%, rgba(0,0,0,0) 30%),
        
        /* [층 3] 맨 아래: 실제 배경 사진 */
        url('202207015_image/background1.jpg'); /* 여기에 실제 파일명을 넣으세요 */
        
	    /* 이미지 반복 방지 */
	    background-repeat: no-repeat;
	    
	    /* 가로 100%, 세로 60vh (화면 높이의 60%) */
	    background-size: 100% 80vh;
	    
	    /* 위치 상단 고정 */
	    background-position: top center;
}
        header {
	    /* 배경색을 완전 투명하게 설정 */
	    background: transparent;
	    
	    /* 글씨 색상 (흰색 유지) */
	    color: #fff;
	    
	    /* 여백 및 정렬 */
	    padding: 20px 0;
	    text-align: center;
	    
	    /* (선택 사항) 배경 이미지 때문에 글씨가 잘 안 보일 수 있어 그림자 추가 */
	    text-shadow: 1px 1px 3px rgba(0,0,0, 0.8);
}
        nav { margin-top: 10px; }
        nav a { color: #ddd; margin: 0 15px; text-decoration: none; font-weight: bold; }
        nav a:hover { color: #fff; }
        a { color: inherit; text-decoration: none; }
        
        /* 링크 호버 효과 */
        .section p a { display: block; padding: 2px 0; transition: color 0.2s; }
        .section p a:hover { color: #3498db; text-decoration: underline; }

        .container { display: grid; grid-template-columns: 180px 250px 1fr 250px 180px; gap: 20px; width: 1500px; margin: 20px auto; }
        .left-sidebar, .right-sidebar { display: flex; flex-direction: column; gap: 20px; }
        .section { background: #fff; padding: 15px; border-radius: 6px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .section h2 { font-size: 16px; margin-bottom: 10px; border-bottom: 2px solid #3498db; padding-bottom: 5px; }
        
        .ad-banner { display: flex; flex-direction: column; gap: 20px; }
        .ad-unit { background: #ecf0f1; padding: 0; border-radius: 6px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); text-align: center; height: 400px; border: 1px solid #bdc3c7; overflow: hidden; }
        .ad-unit img { width: 100%; height: 100%; object-fit: cover; border-radius: 6px; }

        .thumbnail-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }
        .card { background: #fff; border-radius: 6px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.1); transition: transform 0.2s; }
        .card:hover { transform: translateY(-5px); }
        .card img { width: 100%; height: 80px; object-fit: cover; }
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

        .inquiry-box input, .inquiry-box textarea { width: 100%; padding: 8px; margin: 4px 0 8px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .inquiry-box textarea { resize: vertical; min-height: 50px; }
        .inquiry-box button { width: 100%; padding: 10px; border: none; background: #27ae60; color: white; font-weight: bold; border-radius: 4px; cursor: pointer; }
        .inquiry-box button:hover { background: #2ecc71; }

        footer { background: #2c3e50; color: #aaa; text-align: center; padding: 15px; margin-top: 30px; font-size: 13px; }
    </style>
</head>
<body>
    <header>
        <h1>Sports Zone</h1>
        <nav>
            <a href="index.jsp">메인</a>
            <a href="menu.jsp">스팀리뷰</a>
        </nav>
    </header>

    <div class="container">
        <!-- 왼쪽 광고 -->
        <div class="ad-banner">
            <div class="ad-unit">
                <a href="https://www.nike.com/kr/" target="_blank">
                    <img src="202207015_image/나이키.png" alt="나이키">
                </a>
            </div>
        </div>

        <!-- 왼쪽 사이드바 -->
        <div class="left-sidebar">
            <div class="section">
                <h2>주요 정보 사이트</h2>
                <p><a href="https://m.sports.naver.com/index" target="_blank">📢 네이버 스포츠</a></p>
                <p><a href="https://www.premierleague.com/en" target="_blank">⚽️ 프리미어 리그</a></p>
                <p><a href="https://www.nba.com/" target="_blank">🏀 NBA</a></p>
            </div>
            <div class="section">
                <h2>🔥 명예의 전당</h2>
                <p><a href="https://www.youtube.com/watch?v=oPiMOQLa7U8" target="_blank">🔥 축구황제 펠레</a></p>
                <p><a href="https://www.youtube.com/watch?v=fkke9gSdFHE" target="_blank">🏀 GOAT 마이클 조던</a></p>
                <p><a href="https://www.youtube.com/watch?v=8WpyuKMzGb0" target="_blank">⚾️ 야구 레전드 투수</a></p> 
            </div>
            <div class="section">
                <h2>📆 주간 경기 일정</h2>
                <p><a href="https://search.naver.com/search.naver?query=EPL+일정" target="_blank">✔️ (토) 04:00 | EPL 맨유 vs 리버풀</a></p>
                <p><a href="https://search.naver.com/search.naver?query=K리그+일정" target="_blank">✔️ (일) 19:00 | K리그 전북 vs 울산</a></p>
                <p><a href="https://search.naver.com/search.naver?query=NBA+일정" target="_blank">✔️ (월) 09:00 | NBA 레이커스 vs 보스턴</a></p>
                <p><a href="https://search.naver.com/search.naver?query=V리그+일정" target="_blank">✔️ (화) 20:00 | 배구 V리그 현대 vs 대한항공</a></p> 
            </div>
        </div>

        <!-- 메인 콘텐츠 -->
        <div class="main">
            <div class="thumbnail-grid">
                <div class="card">
				    <a href="https://www.youtube.com/watch?v=D92kXnQ3aDY" target="_blank">
				        <img src="https://img.youtube.com/vi/D92kXnQ3aDY/hqdefault.jpg" alt="국가대표 경기 하이라이트">
				    </a>
				    <div class="card-content">
				        <h3>최근 국가대표 경기 하이라이트</h3>
				        <p>치열했던 경기 주요 장면 정리</p>
				    </div>
				</div>
                <div class="card">
                	<a href="https://www.youtube.com/watch?v=axNafTgRIeg" target="_blank">
                   		<img src="https://img.youtube.com/vi/axNafTgRIeg/hqdefault.jpg" alt="축구 이미지">
                    </a>
                    <div class="card-content">
                        <h3>국가대표 선수 직캠 모음</h3>
                        <p>국가대표 공식 유튜브</p>
                    </div>
                </div>
                <div class="card">
                    <a href="https://www.youtube.com/watch?v=usU2ETKUxoI" target="_blank">
                        <img src="https://img.youtube.com/vi/usU2ETKUxoI/hqdefault.jpg" alt="기자회견">
                    </a>
                    <div class="card-content">
                        <h3>국가대표 기자회견</h3>
                        <p>최근 경기 리뷰</p>
                    </div>
                </div>
                <div class="card">
                    <a href="https://www.youtube.com/watch?v=zw87BDptVXQ" target="_blank">
                        <img src="https://img.youtube.com/vi/zw87BDptVXQ/hqdefault.jpg" alt="비하인드">
                    </a>
                    <div class="card-content">
                        <h3>국가대표 훈련 비하인드</h3>
                        <p>경기에선 볼 수 없는 모습</p>
                    </div>
                </div>
                <div class="card">
                    <a href="https://www.youtube.com/watch?v=_fFOnrICmKk" target="_blank">
                        <img src="https://img.youtube.com/vi/_fFOnrICmKk/hqdefault.jpg" alt="인터뷰">
                    </a>
                    <div class="card-content">
                        <h3>선수별 심층 인터뷰</h3>
                        <p>경기 전 인터뷰</p>
                    </div>
                </div>
                <div class="card">
                    <a href="https://www.youtube.com/watch?v=I9vK5EVTt0U" target="_blank">
                        <img src="https://img.youtube.com/vi/I9vK5EVTt0U/hqdefault.jpg" alt="레전드 매치">
                    </a>
                    <div class="card-content">
                        <h3>레전드 스페셜 매치 다시보기</h3>
                        <p>과거 영웅들과의 재회</p>
                    </div>
                </div>
            </div>
            <!-- 뉴스 리스트 영역 -->
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
				  <a href="https://www.youtube.com/com/watch?v=5XVLE4u46cg" target="_blank">
				    <img src="https://img.youtube.com/vi/5XVLE4u46cg/hqdefault.jpg" alt="MLB 하이라이트">
				  </a>
				  <div>
				    <h4>MLB 하이라이트</h4>
				    <p>메이저리그 하이라이트</p>
				  </div>
				</div>
				<div class="news-item">
				  <a href="https://www.youtube.com/watch?v=vXJhItKCQBk" target="_blank">
				    <img src="https://img.youtube.com/vi/vXJhItKCQBk/hqdefault.jpg" alt="v리그 하이라이트">
				  </a>
				  <div>
				    <h4>v리그 하이라이트</h4>
				    <p>우리카드 vs 현대캐피탈</p>
				  </div>
				</div>
            </div>
            
            <!-- 한줄 뉴스 배너 모듈 포함 (뉴스 리스트 아래) -->
            <!-- 
                JSP Action Tag (jsp:include):
                다른 JSP 파일(quickBoard.jsp)을 현재 페이지에 포함시켜 모듈처럼 사용합니다.
                이를 통해 코드의 재사용성을 높이고 유지보수를 용이하게 합니다.
            -->
            <jsp:include page="quickBoard.jsp" />
        </div>
        
        <!-- 오른쪽 사이드바 -->
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
                <p><a href="https://search.naver.com/search.naver?query=손흥민" target="_blank">1. 손흥민</a></p>
                <p><a href="https://search.naver.com/search.naver?query=아스날+토트넘" target="_blank">2. 아스날 토트넘</a></p>
                <p><a href="https://search.naver.com/search.naver?query=아이콘+매치" target="_blank">3. 아이콘 매치</a></p>
                <p><a href="https://search.naver.com/search.naver?query=국가대표" target="_blank">4. 국가대표</a></p>
            </div>
            
            <div class="section inquiry-box">
                <h2>💌 문의 / 제안</h2>
                <form action="inquiryAction.jsp" method="post">
                    <input type="hidden" name="returnUrl" value="<%= request.getRequestURI() %>">
                    <input type="text" name="name" placeholder="이름 (필수)" required>
                    <input type="email" name="email" placeholder="이메일 (선택)">
                    <textarea name="content" placeholder="문의 내용을 작성해 주세요." required></textarea>
                    <button type="submit">문의 등록</button>
                </form>
            </div>
        </div>
        
        <!-- 오른쪽 광고 -->
        <div class="ad-banner">
             <div class="ad-unit">
                <a href="https://www.adidas.co.kr/" target="_blank">
                    <img src="202207015_image/아디다스.png" alt="아디다스">
                </a>
            </div>
        </div>
    </div>

    <footer>
        <p>© 2025 Sports Zone | 스포츠 커뮤니티</p>
    </footer>
</body>
</html>


