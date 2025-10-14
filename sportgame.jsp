<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>스포츠 게임 게시판 - PlayCulture</title>
    <style>
        body { margin: 0; font-family: "Segoe UI", sans-serif; background: #f4f4f4; color: #333; }
        header { background: #2c3e50; color: #fff; padding: 20px 0; text-align: center; }
        nav { margin-top: 10px; }
        nav a { color: #ddd; margin: 0 15px; text-decoration: none; font-weight: bold; }
        nav a:hover { color: #fff; }
		a { color: inherit; text-decoration: none; } /* 부모 요소의 글씨 색상을 상속받아 파란색을 없애고 밑줄을 없앱니다. */
							
        .section p a {		/* 섹션 내 링크 스타일 정의 */
            display: block; /* 링크가 p 태그 전체 너비를 사용하도록 설정 */
            padding: 2px 0; /* 상하 여백을 추가하여 가독성 개선 */
        }

        .container { display: grid; grid-template-columns: 250px 1fr 250px; gap: 20px; width: 1200px; margin: 20px auto; }
        .left-sidebar, .right-sidebar { display: flex; flex-direction: column; gap: 20px; }
        .section { background: #fff; padding: 15px; border-radius: 6px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .section h2 { font-size: 16px; margin-bottom: 10px; border-bottom: 2px solid #3498db; padding-bottom: 5px; }

        .thumbnail-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }
        .card { background: #fff; border-radius: 6px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.1); transition: transform 0.2s; }
        .card:hover { transform: translateY(-5px); }
        .card img { width: 100%; height: 80px; object-fit: cover; } /* sport.jsp에서 80px로 수정된 값 적용 */
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
    <header>
        <h1>스포츠 게임 게시판</h1>
        <nav>
            <a href="index.jsp">메인</a>

        </nav>
    </header>

    <div class="container">
        <div class="left-sidebar">
            <div class="section">
		    <h2>주요 게임 정보</h2>
			    <p><a href="https://www.ea.com/ko-kr/games/ea-sports-fc">🎮 EA FC 공식 사이트</a></p>
			    <p><a href="https://nba.2k.com/ko-KR/2k26/">🏀 NBA 2K 공식 사이트</a></p>
			    <p><a href="https://theshow.com/">⚾ MLB 더 쇼 공식 사이트</a></p>
		</div>
            <div class="section">
                <h2>🏆 역대 올스타 팀</h2>
                <p><a href="링크1_주소_입력" target="_blank">⚽️ FC 온라인 역대 올스타</a></p>
                <p><a href="링크2_주소_입력" target="_blank">🏀 2K 시리즈 베스트 로스터</a></p>
            </div>
            <div class="section">
	            <h2>📈 주간 메타 변화</h2>
	            <p>✔️ EA FC: 수비수 성능 버프</p>
	            <p>✔️ MLB 더 쇼: 투수 변화구 메타</p>
	            <p>✔️ NBA 2K: 신규 슈팅 배지 등장</p>
        	</div>
        </div>

        <div class="main">
            <div class="thumbnail-grid">
                <div class="card">
				    <a href="https://www.youtube.com/watch?v=2Y5tkhTq5-k" target="_blank">
				        <img src="https://img.youtube.com/vi/2Y5tkhTq5-k/hqdefault.jpg" alt="EA FC 공략">
				    </a>
				    <div class="card-content">
				        <h3>EA FC 26 공략</h3>
				        <p>기본기 공략</p>
				    </div>
				</div>
                <div class="card">
                	<a href="https://www.youtube.com/watch?v=pVY2i0yl5kA" target="_blank">
                   		<img src="https://img.youtube.com/vi/pVY2i0yl5kA/hqdefault.jpg" alt="fc온라인 공략">
        
            		 </a>
                    <div class="card-content">
                        <h3>FC 온라인 공략</h3>
                        <p>초보자를 위한 공략</p>
                
     				</div>
                </div>
                <div class="card">
                    <a href="https://www.youtube.com/watch?v=f_ZkL350y7w" target="_blank">
                        <img src="https://img.youtube.com/vi/f_ZkL350y7w/hqdefault.jpg" alt="2k 공략">
                    </a>
                    <div class="card-content">
                        <h3>2k26 공략</h3>
                        <p>드리블 마스터</p>
                    </div>
                </div>
                <div class="card">
                    <a href="링크4_주소_입력" target="_blank">
                        <img src="" alt="E-Sports 이미지">
                    </a>
                    <div class="card-content">
                        <h3>스포츠 게임 E-Sports 리그 소식</h3>
                        <p>우승팀 인터뷰 및 경기 분석</p>
                    </div>
                </div>
                <div class="card">
                    <a href="링크5_주소_입력" target="_blank">
                        <img src="" alt="매니저 모드 이미지">
                    </a>
                    <div class="card-content">
                        <h3>프랜차이즈 모드 완벽 가이드</h3>
                        <p>명문팀을 만드는 비결</p>
                    </div>
                </div>
                <div class="card">
                    <a href="링크6_주소_입력" target="_blank">
                        <img src="" alt="모바일 게임 이미지">
                    </a>
                    <div class="card-content">
                        <h3>모바일 스포츠 게임 추천</h3>
                        <p>출퇴근길에 즐기는 명작</p>
                    </div>
                </div>
            </div>

            <div class="news-list">
                <div class="news-item">
				  <a href="https://www.youtube.com/watch?v=VNnc1fSm1bQ" target="_blank">
				    <img src="https://img.youtube.com/vi/VNnc1fSm1bQ/hqdefault.jpg" alt="하이라이트">
				  </a>
				  <div>
				    <h4>[EA FC] 플레이 하이라이트</h4>
				    <p>주요 플레이 장면</p>
				  </div>
				</div>

                <div class="news-item">
				  <a href="https://www.youtube.com/watch?v=wb7q0lhNMbM" target="_blank">
				    <img src="https://img.youtube.com/vi/wb7q0lhNMbM/hqdefault.jpg" alt="fc 온라인">
				  </a>
				  <div>
				    <h4>[FC 온라인] 대회 하이라이트</h4>
				    <p>대회 플레이 장면</p>
				  </div>
				</div>
                 <div class="news-item">
				  <a href="https://www.youtube.com/watch?v=U62melMt6FA" target="_blank">
				    <img src="https://img.youtube.com/vi/U62melMt6FA/hqdefault.jpg" alt="2k 플레이">
				  </a>
				  <div>
				    <h4>[NBA 2k26] 초기 리뷰 영상</h4>
				    <p>출시 후 초반 플레이</p>
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
                <p>1. EA FC 25</p>
                <p>2. NBA 2K26</p>
                <p>3. MLB 더 쇼 공략</p>
                <p>4. 피파 온라인</p>
            </div>
        </div>
    </div>

    <footer>
        <p>© 2025 PlayCulture | 스포츠 게임 커뮤니티</p>
    </footer>
</body>
</html>