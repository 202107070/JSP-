<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Game Point</title>
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

        /* 섹션 내 링크 스타일 */
        .section p a {		
            display: block; 
            padding: 2px 0; 
            transition: color 0.2s;
        }
        .section p a:hover {
            color: #3498db;
            text-decoration: underline;
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
        
        /* 광고 배너 스타일 */
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
            font-size: 11px;
            color: #7f8c8d;
            height: 400px; /* 고정 높이 설정 (세로형 광고 기준) */
            border: 1px solid #bdc3c7;
            overflow: hidden; /* 이미지가 배너 영역을 넘치지 않도록 설정 */
        }

        /* 광고 배너 내 이미지 스타일: 영역을 가득 채우도록 설정 */
        .ad-unit img {
            width: 100%;
            height: 100%;
            object-fit: cover; 
            border-radius: 6px; 
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

        /* ==================================================================== */
        /* 3. 메인 콘텐츠 스타일 (카드 및 리스트) */
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
        /* 4. 사이드바 내부 스타일 */
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
        <h1>Game Point</h1>
        <nav>
            <a href="index.jsp">메인</a>
            <a href="menu.jsp">스팀리뷰</a>
        </nav>
    </header>

    <!-- 메인 컨테이너 영역 (5단 레이아웃: 광고 | 좌측 사이드 | 메인 | 우측 사이드 | 광고) -->
    <div class="container">
        
        <!-- 왼쪽 광고 배너 영역 (180px) -->
        <div class="ad-banner">
            <div class="ad-unit">
                <a href="https://magumagu.netmarble.com/" target="_blank">
                    <img src="202207015_image/마구마구.png" alt="마구마구">
                </a>
            </div>
        </div>

        <!-- 왼쪽 사이드바 (250px) -->
        <div class="left-sidebar">
            
            <!-- 주요 게임 정보 섹션 -->
            <div class="section">
                <h2>주요 게임 정보</h2>
                <p><a href="https://www.ea.com/ko-kr/games/ea-sports-fc" target="_blank">🎮 EA FC 공식 사이트</a></p>
                <p><a href="https://nba.2k.com/" target="_blank">🏀 NBA 2K 공식 사이트</a></p>
                <p><a href="https://mlbtheshow.com/" target="_blank">⚾ MLB 더 쇼 공식 사이트</a></p>
            </div>
            
            <!-- 스포츠 게임 역사 섹션 -->
            <div class="section">
                <h2>🎮 스포츠 게임 역사</h2>
                <p><a href="https://www.youtube.com/watch?v=ix3IcNIIH3U" target="_blank">🕹️ 한국 고전 스포츠 게임</a></p>
                <p><a href="https://www.youtube.com/watch?v=nxM-5rlZlY8" target="_blank">⚽️ 피파 vs 위닝</a></p>
                <p><a href="https://www.youtube.com/watch?v=_tU0Knysv8E" target="_blank">🏀 NBA 2K, 리얼리즘의 시작</a></p>             
            </div>
            
            <!-- 주간 메타 변화 섹션 (링크 적용) -->
            <div class="section">
	            <h2>📈 주간 메타 변화</h2>
	            <p><a href="https://search.naver.com/search.naver?query=EA+FC+수비수+성능+버프" target="_blank">✔️ EA FC: 수비수 성능 버프</a></p>
	            <p><a href="https://search.naver.com/search.naver?query=MLB+더+쇼+투수+변화구+메타" target="_blank">✔️ MLB 더 쇼: 투수 변화구 메타</a></p>
	            <p><a href="https://search.naver.com/search.naver?query=NBA+2K+신규+슈팅+배지" target="_blank">✔️ NBA 2K: 신규 슈팅 배지 등장</a></p>
                <p><a href="https://search.naver.com/search.naver?query=마구마구+새로운+레전드+카드" target="_blank">✔️ 마구마구: 새로운 레전드 카드</a></p>
        	</div>
        </div>

        <!-- 메인 콘텐츠 영역 (1fr) -->
        <div class="main">
            <!-- 카드형 게시글 (3열, 6개 항목) -->
            <div class="thumbnail-grid">
                <!-- 1. EA FC 26 신규 트레일러 -->
                <div class="card">
				    <a href="https://www.youtube.com/watch?v=F2Q4xrASt94" target="_blank">
				        <img src="https://img.youtube.com/vi/F2Q4xrASt94/hqdefault.jpg" alt="EA FC 26">
				    </a>
				    <div class="card-content">
				        <h3>EA FC 26 신규 트레일러 공개</h3>
				        <p>그래픽 및 애니메이션 대폭 개선</p>
				    </div>
				</div>
                <!-- 2. NBA 2K26 마이커리어 가이드 -->
                <div class="card">
                	<a href="https://www.youtube.com/watch?v=f_ZkL350y7w" target="_blank">
                   		<img src="https://img.youtube.com/vi/f_ZkL350y7w/hqdefault.jpg" alt="NBA 2K">
             </a>
                    <div class="card-content">
                        <h3>NBA 2K26 마이커리어 가이드</h3>
                        <p>초보자를 위한 가이드</p>
     				</div>
                </div>
                <!-- 3. MLB 더 쇼 후기 -->
                <div class="card">
                    <a href="https://www.youtube.com/watch?v=lWln2SUTF0k" target="_blank">
                        <img src="https://img.youtube.com/vi/lWln2SUTF0k/hqdefault.jpg" alt="MLB 더 쇼">
                    </a>
                    <div class="card-content">
                        <h3>MLB 더 쇼 후기</h3>
                        <p>최신작 플레이</p>
                    </div>
                </div>
                <!-- 4. fc 온라인 이벤트 -->
                <div class="card">
                    <a href="https://www.youtube.com/watch?v=ZqISZc-favc" target="_blank">
                        <img src="https://img.youtube.com/vi/ZqISZc-favc/hqdefault.jpg" alt="fc 온라인">
                    </a>
                    <div class="card-content">
                        <h3>fc 온라인 이벤트</h3>
                        <p>이벤트 공략</p>
                    </div>
                </div>
                <!-- 5. fc 온라인 초보자 공략 -->
                <div class="card">
                    <a href="https://www.youtube.com/watch?v=r3FNf-Rm0KM" target="_blank">
                        <img src="https://img.youtube.com/vi/r3FNf-Rm0KM/hqdefault.jpg" alt="fc 온라인 가이드">
                    </a>
                    <div class="card-content">
                        <h3>fc 온라인 초보자 공략</h3>
                        <p>초보자 가이드</p>
                    </div>
                </div>
                <!-- 6. 모바일 스포츠 게임 추천 -->
                <div class="card">
                    <a href="https://www.youtube.com/watch?v=u4FWiigifuQ" target="_blank">
                        <img src="https://img.youtube.com/vi/u4FWiigifuQ/hqdefault.jpg" alt="스포츠 게임 추천">
                    </a>
                    <div class="card-content">
                        <h3>스포츠 게임 추천</h3>
                        <p>다양한 장르 게임 추천</p>
                    </div>
                </div>
            </div>

            <!-- 뉴스 리스트 영역 -->
            <div class="news-list">
                <div class="news-item">
				  <a href="https://www.youtube.com/watch?v=euXJAKGc4LM" target="_blank">
				    <img src="https://img.youtube.com/vi/euXJAKGc4LM/hqdefault.jpg" alt="패치 노트">
				  </a>
				  <div>
				    <h4>[EA FC] 대규모 밸런스 패치 노트</h4>
				    <p>주요 선수 능력치 변경 사항</p>
				  </div>
				</div>

                <div class="news-item">
				  <a href="https://www.youtube.com/watch?v=5lkMReLqixs" target="_blank">
				    <img src="https://img.youtube.com/vi/5lkMReLqixs/hqdefault.jpg" alt="신규 시즌">
				  </a>
				  <div>
				    <h4>[NBA 2K] 신규 시즌 이벤트</h4>
				    <p>시즌 2 시작</p>
				  </div>
				</div>
                 <div class="news-item">
				  <a href="https://www.youtube.com/watch?v=iBXkMjO7lbY" target="_blank">
				    <img src="https://img.youtube.com/vi/iBXkMjO7lbY/hqdefault.jpg" alt="신작 루머 이미지">
				  </a>
				  <div>
				    <h4>[MLB 더 쇼] 차기작 개발 루머</h4>
				    <p>차기작의 새로운 기능</p>
				  </div>
				</div>
				<div class="news-item">
				  <a href="https://www.youtube.com/watch?v=IEej0noQMik" target="_blank">
				    <img src="https://img.youtube.com/vi/IEej0noQMik/hqdefault.jpg" alt="이풋볼 업데이트">
				  </a>
				  <div>
				    <h4>[efootball] 업데이트</h4>
				    <p>신규 선수 업데이트</p>
				  </div>
				</div>
            </div>
            
            <!-- 한줄 뉴스 배너 모듈 포함 (뉴스 리스트 아래) -->
            <!-- 
                JSP Action Tag (jsp:include):
                공통 UI 컴포넌트인 '한줄 뉴스(quickBoard.jsp)'를 재사용하기 위해 포함시킴.
                모든 페이지에서 동일한 뉴스 데이터를 보여줌.
            -->
            <jsp:include page="quickBoard.jsp" />
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
            
            <!-- 실시간 인기 검색 섹션 (링크 적용) -->
            <div class="section">
                <h2>실시간 인기 검색</h2>
                <p><a href="https://search.naver.com/search.naver?query=EA+FC+25" target="_blank">1. EA FC 25</a></p>
                <p><a href="https://search.naver.com/search.naver?query=NBA+2K26" target="_blank">2. NBA 2K26</a></p>
                <p><a href="https://search.naver.com/search.naver?query=MLB+더쇼+공략" target="_blank">3. MLB 더 쇼 공략</a></p>
                <p><a href="https://search.naver.com/search.naver?query=피파+온라인" target="_blank">4. 피파 온라인</a></p>
            </div>
            
            <!-- 문의 사항 배너 -->
            <div class="section inquiry-box">
                <h2>💌 문의 / 제안</h2>
                <form action="inquiryAction.jsp" method="post">
                    <!-- 현재 페이지 URL을 hidden으로 전달하여 처리 후 이 페이지로 돌아오게 함 -->
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
                <a href="https://fconline.nexon.com/main/index" target="_blank">
                    <img src="202207015_image/fc온라인.png" alt="fc온라인">
                </a>
            </div>
        </div>
    </div>

    <!-- 푸터 영역 -->
    <footer>
        <p>© 2025 Game Point | 스포츠 게임 커뮤니티</p>
    </footer>
</body>
</html>