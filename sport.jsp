<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>스포츠 게시판 - PlayCulture</title>
    <style>
        /* ==================================================================== */
        /* 1. 기본 및 공통 스타일 */
        /* ==================================================================== */
        body { 
            margin: 0; 
            font-family: "Segoe UI", sans-serif; 
            background: #f4f4f4; 
            color: #333; 
        }
        
        /* 헤더 스타일 */
        header { 
            background: #2c3e50; 
            color: #fff; 
            padding: 20px 0; 
            text-align: center; 
        }
        nav { 
            margin-top: 10px;
        }
        nav a { 
            color: #ddd; 
            margin: 0 15px; 
            text-decoration: none; 
            font-weight: bold;
        }
        nav a:hover { 
            color: #fff; 
        }
		a { 
            color: inherit; 
            text-decoration: none; 
            /* 부모 요소의 글씨 색상을 상속받아 파란색을 없애고 밑줄을 없앱니다. */
        }

        /* ==================================================================== */
        /* 2. 레이아웃 및 그리드 설정 */
        /* ==================================================================== */
        /* [5단 레이아웃] 중앙 영역(사이드바/메인)의 폭을 고정하고, 광고 영역(180px)을 배치 */
        .container { 
            display: grid; 
            /* 그리드 컬럼 구성: (광고 180px) (좌측 사이드 250px) (메인 1fr) (우측 사이드 250px) (광고 180px) */
            grid-template-columns: 180px 250px 1fr 250px 180px; 
            gap: 20px; 
            width: 1500px; /* 중앙 콘텐츠 영역 보호를 위해 전체 너비 고정 */
            margin: 20px auto; 
        }

        .left-sidebar, .right-sidebar { 
            display: flex; 
            flex-direction: column; 
            gap: 20px;
        }
        
        /* 섹션(배너) 공통 스타일 */
        .section { 
            background: #fff; 
            padding: 15px; 
            border-radius: 6px; 
            box-shadow: 0 2px 5px rgba(0,0,0,0.1); 
        }
        .section h2 { 
            font-size: 16px; 
            margin-bottom: 10px; 
            border-bottom: 2px solid #3498db; 
            padding-bottom: 5px; 
        }

        /* 섹션 내 링크 스타일 (목록 항목) */
        .section p a {		
            display: block; 
            padding: 2px 0; 
        }
        
        /* ==================================================================== */
        /* 3. 광고 배너 스타일 */
        /* ==================================================================== */
        .ad-banner {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .ad-unit {
            background: #ecf0f1; /* 밝은 회색 배경 */
            padding: 0; 
            border-radius: 6px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            text-align: center;
            height: 400px; /* 고정 높이 설정 (세로형 광고 기준) */
            border: 1px solid #bdc3c7;
            overflow: hidden; 
        }

        /* 광고 배너 내 이미지 스타일: 영역을 가득 채우도록 설정 */
        .ad-unit img {
            width: 100%;
            height: 100%;
            object-fit: cover; 
            border-radius: 6px; 
        }

        /* ==================================================================== */
        /* 4. 메인 콘텐츠 스타일 (카드 및 리스트) */
        /* ==================================================================== */
        
        /* 썸네일 카드 그리드 (3열) */
        .thumbnail-grid { 
            display: grid;
            grid-template-columns: repeat(3, 1fr); 
            gap: 20px; 
        }
        .card { 
            background: #fff; 
            border-radius: 6px;
            overflow: hidden; 
            box-shadow: 0 2px 5px rgba(0,0,0,0.1); 
            transition: transform 0.2s;
        }
        .card:hover { 
            transform: translateY(-5px);
        }
        /* 카드 이미지 높이 (80px로 설정) */
        .card img { 
            width: 100%; 
            height: 80px; 
            object-fit: cover;
        }
        .card-content { 
            padding: 10px;
        }
        .card-content h3 { 
            margin: 0; 
            font-size: 14px; 
            font-weight: bold;
        }
        .card-content p { 
            font-size: 12px; 
            color: #555; 
            margin-top: 5px;
        }

        /* 뉴스 리스트 스타일 */
        .news-list { 
            margin-top: 30px;
        }
        .news-item { 
            display: flex; 
            gap: 15px; 
            margin-bottom: 15px; 
            background: #fff; 
            padding: 10px;
            border-radius: 6px; 
            box-shadow: 0 2px 5px rgba(0,0,0,0.1); 
        }
        .news-item img { 
            width: 120px;
            height: 80px; 
            object-fit: cover; 
            border-radius: 4px; 
        }
        .news-item h4 { 
            margin: 0;
            font-size: 14px; 
            font-weight: bold; 
        }
        .news-item p { 
            font-size: 12px; 
            color: #555;
            margin-top: 5px; 
        }
        
        /* ==================================================================== */
        /* 5. 사이드바 내부 스타일 */
        /* ==================================================================== */
        
        /* 로그인 박스 스타일 */
        .login-box input { 
            width: 100%;
            padding: 8px; 
            margin: 8px 0; 
            border: 1px solid #ccc; 
            border-radius: 4px;
        }
        .login-box button { 
            width: 100%; 
            padding: 10px; 
            border: none; 
            background: #3498db;
            color: white; 
            font-weight: bold; 
            border-radius: 4px; 
            cursor: pointer; 
        }
        .login-box button:hover { 
            background: #2980b9; 
        }
        
        /* 문의 박스 스타일 */
        .inquiry-box input, .inquiry-box textarea { 
            width: 100%; 
            padding: 8px; 
            margin: 4px 0 8px 0; 
            border: 1px solid #ccc; 
            border-radius: 4px; 
            box-sizing: border-box; 
        }
        .inquiry-box textarea {
            resize: vertical; 
            min-height: 50px; 
        }
        .inquiry-box button { 
            width: 100%; 
            padding: 10px; 
            border: none; 
            background: #27ae60; 
            color: white; 
            font-weight: bold; 
            border-radius: 4px; 
            cursor: pointer; 
        }
        .inquiry-box button:hover { 
            background: #2ecc71; 
        }

        /* 푸터 스타일 */
        footer { 
            background: #2c3e50; 
            color: #aaa; 
            text-align: center; 
            padding: 15px; 
            margin-top: 30px;
            font-size: 13px; 
        }
    </style>
</head>
<body>
    <!-- 헤더 영역 -->
    <header>
        <h1>스포츠 게시판</h1>
        <nav>
            <a href="index.jsp">메인</a>
            <a href=menu.jsp">스팀리뷰</a>
        </nav>
    </header>

    <!-- 메인 컨테이너 영역 (5단 레이아웃: 광고 | 좌측 사이드 | 메인 | 우측 사이드 | 광고) -->
    <div class="container">
        
        <!-- 왼쪽 광고 배너 영역 -->
        <div class="ad-banner">
            <div class="ad-unit">
                <a href="https://www.nike.com/kr/" target="_blank">
                    <img src="202207015_image/나이키.png" alt="나이키">
                </a>
            </div>
        </div>

        <!-- 왼쪽 사이드바 (250px) -->
        <div class="left-sidebar">
          
            <!-- 주요 정보 사이트 섹션 -->
            <div class="section">
                <h2>주요 정보 사이트</h2>
                <p><a href="https://m.sports.naver.com/index">📢 네이버 스포츠</a></p>
                <p><a href="https://www.premierleague.com/en">⚽️ 프리미어 리그</a></p>
                <p><a href="https://www.nba.com/">🏀 NBA</a></p>
            </div>
            
            <!-- 명예의 전당 섹션 -->
            <div class="section">
                <h2>🔥 명예의 전당</h2>
                <p><a href="https://www.youtube.com/watch?v=oPiMOQLa7U8" target="_blank">🔥 축구황제 펠레</a></p>
                <p><a href="https://www.youtube.com/watch?v=fkke9gSdFHE" target="_blank">🏀 GOAT 마이클 조던</a></p>
                <p><a href="https://www.youtube.com/watch?v=8WpyuKMzGb0" target="_blank">⚾️ 야구 레전드 투수</a></p> 
            </div>
            
            <!-- 주간 경기 일정 섹션 -->
            <div class="section">
                <h2>📆 주간 경기 일정</h2>
                <p>✔️ (토) 04:00 | EPL 맨유 vs 리버풀</p>
                <p>✔️ (일) 19:00 | K리그 전북 vs 울산</p>
                <p>✔️ (월) 09:00 | NBA 레이커스 vs 보스턴</p>
                <p>✔️ (화) 20:00 | 배구 V리그 현대 vs 대한항공</p> 
            </div>
        </div>

        <!-- 메인 콘텐츠 영역 (1fr) -->
        <div class="main">
            <!-- 카드형 게시글 (6개, 3열 레이아웃, 이미지 높이 80px) -->
            <div class="thumbnail-grid">
                <!-- 1. 최근 국가대표 경기 하이라이트 -->
                <div class="card">
				    <a href="https://www.youtube.com/watch?v=D92kXnQ3aDY" target="_blank">
				        <img src="https://img.youtube.com/vi/D92kXnQ3aDY/hqdefault.jpg" 
                             alt="국가대표 경기 하이라이트">
				    </a>
				    <div class="card-content">
				        <h3>최근 국가대표 경기 하이라이트</h3>
				        <p>치열했던 경기 주요 장면 정리</p>
				    </div>
				</div>
                <!-- 2. 국가대표 선수 직캠 모음 -->
                <div class="card">
                	<a href="https://www.youtube.com/watch?v=axNafTgRIeg" target="_blank">
                   		<img src="https://img.youtube.com/vi/axNafTgRIeg/hqdefault.jpg" alt="축구 이미지">
             </a>
                    <div class="card-content">
                        <h3>국가대표 선수 직캠 모음</h3>
                        <p>국가대표 공식 유튜브</p>
                
     </div>
                </div>
                <!-- 3. 국가대표 기자회견 -->
                <div class="card">
                    <a href="https://www.youtube.com/watch?v=usU2ETKUxoI" target="_blank">
                        <img src="https://img.youtube.com/vi/usU2ETKUxoI/hqdefault.jpg" alt="기자회견">
                    </a>
                    <div class="card-content">
                        <h3>국가대표 기자회견</h3>
                        <p>최근 경기 리뷰</p>
                    </div>
                </div>
                <!-- 4. 국가대표 훈련 비하인드 -->
                <div class="card">
                    <a href="https://www.youtube.com/watch?v=zw87BDptVXQ" target="_blank">
                        <img src="https://img.youtube.com/vi/zw87BDptVXQ/hqdefault.jpg" alt="비하인드">
                    </a>
                    <div class="card-content">
                        <h3>국가대표 훈련 비하인드</h3>
                        <p>경기에선 볼 수 없는 모습</p>
                    </div>
                </div>
                <!-- 5. 선수별 심층 인터뷰 -->
                <div class="card">
                    <a href="https://www.youtube.com/watch?v=_fFOnrICmKk" target="_blank">
                        <img src="https://img.youtube.com/vi/_fFOnrICmKk/hqdefault.jpg" alt="인터뷰">
                    </a>
                    <div class="card-content">
                        <h3>선수별 심층 인터뷰</h3>
                        <p>경기 전 인터뷰</p>
                    </div>
                </div>
                <!-- 6. 레전드 스페셜 매치 -->
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

            <!-- 뉴스 리스트 영역 (프리미어리그, NBA, MLB 하이라이트) -->
            <div class="news-list">
                <!-- 1. 프리미어리그 주간 하이라이트 -->
                <div class="news-item">
				  <a href="https://www.youtube.com/watch?v=ifApGM5eZIk" target="_blank">
				    <img src="https://img.youtube.com/vi/ifApGM5eZIk/hqdefault.jpg" alt="프리미어리그 하이라이트">
				  </a>
				  <div>
				    <h4>프리미어리그 주간 하이라이트</h4>
				    <p>이번 주 경기 주요 장면</p>
				  </div>
				</div>

                <!-- 2. NBA 24-25 스페셜 -->
                <div class="news-item">
				  <a href="https://www.youtube.com/watch?v=umBzUhvS5gE" target="_blank">
				    <img src="https://img.youtube.com/vi/umBzUhvS5gE/hqdefault.jpg" alt="NBA 하이라이트">
				  </a>
				  <div>
				    <h4>NBA 24-25 스페셜</h4>
				    <p>새 시즌 개막 전 저번 시즌 몰아보기</p>
				  </div>
				</div>
                <!-- 3. MLB 하이라이트 -->
                 <div class="news-item">
				  <a href="https://www.youtube.com/com/watch?v=5XVLE4u46cg" target="_blank">
				    <img src="https://img.youtube.com/vi/5XVLE4u46cg/hqdefault.jpg" alt="MLB 하이라이트">
				  </a>
				  <div>
				    <h4>MLB 하이라이트</h4>
				    <p>메이저리그 하이라이트</p>
				  </div>
				</div>
            </div>
        </div>
        
         <!-- 오른쪽 사이드바 (250px) -->
        <div class="right-sidebar">
            <!-- 로그인 박스 -->
            <div class="section login-box">
                <h2>로그인</h2>
                <form action="loginAction.jsp" method="post">
                    <input type="text" name="userid" placeholder="아이디">
                    <input type="password" name="password" placeholder="비밀번호">
                    <button type="submit">로그인</button>
                </form>
            </div>
            
            <!-- 실시간 인기 검색 섹션 -->
            <div class="section">
                <h2>실시간 인기 검색</h2>
                <p>1. 손흥민</p>
                <p>2. 맨시티 맨유</p>
                <p>3. 아이콘 매치</p>
                <p>4. 국가대표</p>
            </div>
            
            <!-- 문의 사항 배너 -->
            <div class="section inquiry-box">
                <h2>💌 문의 / 제안</h2>
                <form action="inquiryAction.jsp" method="post">
                    <!-- 현재 페이지 URL을 hidden으로 전달하여 처리 후 이 페이지로 돌아오게 함 (request.getRequestURI() 사용) -->
                    <input type="hidden" name="returnUrl" value="<%= request.getRequestURI() %>">
                    <input type="text" name="name" placeholder="이름 (필수)" required>
                    <input type="email" name="email" placeholder="이메일 (선택)">
                    <textarea name="content" placeholder="문의 내용을 작성해 주세요." required></textarea>
                    <button type="submit">문의 등록</button>
                </form>
            </div>
        </div>
        
        <!-- 오른쪽 광고 배너 영역 -->
        <div class="ad-banner">
             <div class="ad-unit">
                <a href="https://www.adidas.co.kr/" target="_blank">
                    <img src="202207015_image/아디다스.png" alt="아디다스">
                </a>
            </div>
        </div>
    </div>

    <!-- 푸터 영역 -->
    <footer>
        <p>© 2025 PlayCulture | 스포츠 커뮤니티</p>
    </footer>
</body>
</html>


