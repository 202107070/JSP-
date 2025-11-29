<%@ page contentType="text/html; charset=UTF-8" language="java" %> <%-- 페이지 인코딩과 언어 설정 --%>
<%@ page import="java.text.SimpleDateFormat" %> <%-- 날짜 포맷팅 클래스 import --%>
<%@ page import="java.util.Date" %> <%-- Date 클래스 import --%>
<%@ page import="java.util.List" %> <%-- List 컬렉션 import --%>
<%@ page import="java.util.ArrayList" %> <%-- ArrayList 클래스 import --%>
<%@ page import="com.mygame.board.Comment" %> <%-- 댓글 객체 import --%>
<%@ page import="com.mygame.board.CommentDAO" %> <%-- 댓글 DAO import --%>

<%-- 게시글 ID 설정 (댓글 조회/등록용) --%>
<%
    String articleId = "web1"; 
%>

<%-- 제목 기본값 설정 --%>
<%
    String title = (String) request.getAttribute("title");
    if (title == null) title = "스타듀밸리: 힐링 농장 게임";
%>

<%-- 작성자 기본값 설정 --%>
<%
    String author = (String) request.getAttribute("author");
    if (author == null) author = "익명";
%>

<%-- 본문 기본값 설정 --%>
<%
    String content = (String) request.getAttribute("content");
    if (content == null) content = "스타듀밸리는 농사, 낚시, 채광, 마을 교류, 연애 등 다양한 요소를 즐길 수 있는 힐링형 인디게임입니다.";
%>

<%-- 조회수 기본값 설정 (없으면 0) --%>
<%
    int viewCount = request.getAttribute("viewCount") != null ? (Integer) request.getAttribute("viewCount") : 0;
%>

<%-- 게시 날짜 설정 (없으면 현재 시간) --%>
<%
    Date date = (Date) request.getAttribute("publishedAt");
    if (date == null) date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
    String publishedAt = sdf.format(date);
%>

<%-- 태그 데이터 기본값 설정 --%>
<%
    String tags = (String) request.getAttribute("tags");
    if (tags == null) tags = "농사, 힐링, 인디게임";
%>

<%-- 이전글 / 다음글 기본값 설정 --%>
<%
    String prevArticle = (String) request.getAttribute("prevArticle");
    if (prevArticle == null) prevArticle = "이전기사";

    String nextArticle = (String) request.getAttribute("nextArticle");
    if (nextArticle == null) nextArticle = "다음기사";
%>

<%-- CommentDAO에서 해당 게시글 ID의 댓글 리스트 가져오기 --%>
<%
    List<Comment> comments = CommentDAO.getCommentsByArticleId(articleId); 
%>

<!DOCTYPE html> <%-- HTML5 문서 타입 선언 --%>
<html lang="ko"> <%-- 문서 언어를 한국어로 설정 --%>
<head>
  <meta charset="UTF-8"> <%-- 문자 인코딩 UTF-8 설정 --%>
  <title><%= title %> - GameLinks</title> <%-- 브라우저 탭에 표시될 제목 --%>
  
  <style>
    :root { <%-- CSS 변수 정의 루트 --%>
      --bg: #ffffff; <%-- 배경 색상 변수 --%>
      --text: #222222; <%-- 기본 텍스트 색상 변수 --%>
      --muted: #666666; <%-- 보조 텍스트 색상 변수 --%>
      --border: #e0e0e0; <%-- 테두리 색상 변수 --%>
      --primary: #0056b3; <%-- 주요 링크 색상 변수 --%>
      --chip-bg: #f1f3f5; <%-- 태그 배경색 변수 --%>
      --chip-text: #333; <%-- 태그 텍스트 색상 변수 --%>
    }

    body { <%-- 전체 페이지 기본 스타일 --%>
      margin: 0; <%-- 기본 여백 제거 --%>
      font-family: 'Pretendard', sans-serif; <%-- 폰트 지정 --%>
      background: var(--bg); <%-- 배경색 적용 --%>
      color: var(--text); <%-- 글자색 적용 --%>
      line-height: 1.6; <%-- 줄간격 설정 --%>
    }

    a { color: var(--primary); text-decoration: none; } <%-- 링크 기본 스타일 --%>
    a:hover { text-decoration: underline; } <%-- 마우스 오버 시 밑줄 표시 --%>

    header { <%-- 상단 헤더 스타일 --%>
      background: #0d1033; <%-- 헤더 배경색 --%>
      border-bottom: 1px solid var(--border); <%-- 하단 테두리 --%>
      padding: 12px 20px; <%-- 내부 여백 --%>
      display: flex; <%-- 플렉스 레이아웃 --%>
      justify-content: space-between; <%-- 좌우 공간 배치 --%>
      align-items: center; <%-- 세로 중앙 정렬 --%>
    }

    header .logo { <%-- 로고 스타일 --%>
      font-weight: 700; <%-- 글자 두께 --%>
      font-size: 1.4rem; <%-- 글자 크기 --%>
      color: #ffffff; <%-- 글자 색상 --%>
    }

    nav a { margin: 0 10px; color: #ffffff; } <%-- 네비게이션 링크 간격 및 색상 --%>

    .container { <%-- 본문+사이드바 전체 컨테이너 --%>
      max-width: 1200px; <%-- 최대 너비 --%>
      margin: 0 auto; <%-- 가로 중앙 정렬 --%>
      padding: 18px; <%-- 내부 여백 --%>
      display: flex; <%-- 플렉스 레이아웃 --%>
      gap: 20px; <%-- 요소 간 간격 --%>
    }

    .main { flex: 3; } <%-- 본문 영역 비율 설정 --%>
    .sidebar { flex: 1; } <%-- 사이드바 비율 설정 --%>

    h1.headline { font-size: 1.8rem; margin: 12px 0; } <%-- 기사 제목 스타일 --%>
    .subhead { font-size: 1.1rem; color: var(--muted); } <%-- 작성자/부제 스타일 --%>
    .meta { font-size: 0.9rem; color: var(--muted); margin-bottom: 16px; } <%-- 조회수 및 날짜 스타일 --%>

    .hero img { width: 100%; border-radius: 8px; } <%-- 대표 이미지 스타일 --%>
    .content { margin: 20px 0; } <%-- 본문 내용 여백 --%>

    .tags { margin: 10px 0; } <%-- 태그 영역 여백 --%>
    .chip { <%-- 태그 스타일 --%>
      display: inline-block;
      background: var(--chip-bg);
      color: var(--chip-text);
      font-size: 0.85rem;
      padding: 4px 10px;
      border-radius: 20px;
      margin: 2px 4px 2px 0;
    }

    .nav-articles { display: flex; justify-content: space-between; margin: 20px 0; } <%-- 이전/다음 글 네비 스타일 --%>
    .nav-articles a { <%-- 이전/다음 글 버튼 스타일 --%>
      padding: 6px 12px;
      border: 1px solid var(--border);
      border-radius: 6px;
      background: #fafafa;
    }

    .card { <%-- 카드 컴포넌트 공통 스타일 --%>
      border: 1px solid var(--border);
      border-radius: 8px;
      background: #fff;
      padding: 10px;
      margin: 20px 0;
    }

    .comments { margin-bottom: 25px; } <%-- 댓글 영역 여백 --%>
    .comments h3 { margin-bottom: 10px; } <%-- 댓글 제목 여백 --%>
    .comment-meta { <%-- 댓글 메타 정보 스타일 --%>
      font-size: 0.8rem;
      color: var(--muted);
      margin-bottom: 4px;
      display: flex;
      justify-content: space-between;
    }

    .comment-box { <%-- 댓글 박스 스타일 --%>
      border: 1px solid var(--border);
      border-radius: 6px;
      padding: 10px;
      margin: 8px 0;
      background: #fafafa;
    }

    .comment-form textarea { <%-- 댓글 작성 textarea 스타일 --%>
      width: 98%;
      height: 60px;
      padding: 8px;
      border-radius: 6px;
      border: 1px solid var(--border);
      resize: none;
    }

    .comment-form button { <%-- 댓글 등록 버튼 스타일 --%>
      margin-top: 6px;
      padding: 6px 12px;
      background: var(--primary);
      color: #fff;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }

    .ad { margin-bottom: 18px; text-align: center; } <%-- 광고 영역 스타일 --%>
    footer { <%-- 페이지 하단 푸터 스타일 --%>
      border-top: 1px solid var(--border);
      background: #0d1033;
      padding: 16px 0;
      margin-top: 40px;
      font-size: 0.9rem;
      color: #ffffff;
      text-align: center;
    }

    /* 인기글 섹션 */
    .popular-section {margin-top:40px;} <%-- 인기글 영역 여백 --%>
    .popular-section h2 {font-size:20px; margin-bottom:15px; color:var(--brand); font-weight:700;} <%-- 인기글 제목 스타일 --%>
    .popular-list {display:flex; flex-direction:column; gap:12px;} <%-- 인기글 리스트 플렉스 스타일 --%>
    .popular-item {display:flex; gap:12px; align-items:center; cursor:pointer;} <%-- 인기글 아이템 스타일 --%>
    .popular-item img {width:80px; height:60px; object-fit:cover; border-radius:6px;} <%-- 인기글 썸네일 이미지 --%>
    .popular-item h4 {font-size:15px; margin:0;} <%-- 인기글 제목 스타일 --%>
    .popular-item p {font-size:12px; color:var(--muted); margin:2px 0 0;} <%-- 인기글 날짜/설명 스타일 --%>
    .popular-item:hover {background:#f0f0f0; border-radius:6px; transition:0.2s;} <%-- 마우스 오버 효과 --%>

  </style>
</head>

<body>
  <header> <%-- 상단 헤더 시작 --%>
    <a href="menu.jsp"><span class="logo">GameLinks</span></a> <%-- 로고 클릭 시 메뉴 페이지 이동 --%>
    <nav>
      <a href="menu.jsp">홈</a> <%-- 네비게이션 홈 링크 --%>
    </nav>
  </header>

  <div class="container"> <%-- 본문+사이드바 컨테이너 시작 --%>
    <main class="main"> <%-- 메인 콘텐츠 영역 시작 --%>
      <h1 class="headline"><%= title %></h1> <%-- JSP로 게시글 제목 출력 --%>
      <p class="subhead">by <%= author %></p> <%-- JSP로 작성자 출력 --%>
      <div class="meta">
        조회수: <%= viewCount %> · <%= publishedAt %> <%-- 조회수와 게시 날짜 출력 --%>
      </div>

      <div class="hero">
        <img src="image/Stardew_Valley.jpg" alt="메인 이미지"> <%-- 대표 이미지 표시 --%>
      </div>

      <div class="content">
        <p><%= content %></p> <%-- 게시글 본문 출력 --%>
      </div>

      <div class="tags"> <%-- 태그 영역 시작 --%>
        <% if (tags != null && !tags.isEmpty()) { %> <%-- 태그 존재 여부 확인 --%>
          <% String[] tagList = tags.split(","); %> <%-- 태그 문자열을 배열로 분리 --%>
          <% for (String t : tagList) { %>
            <span class="chip">#<%= t.trim() %></span> <%-- 각 태그 출력 --%>
          <% } %>
        <% } %>
      </div>

      <div class="nav-articles"> <%-- 이전/다음 글 네비게이션 영역 --%>
        <a href="web2.jsp">&larr; <%= prevArticle %></a> <%-- 이전글 링크 --%>
        <a href="web2.jsp"><%= nextArticle %> &rarr;</a> <%-- 다음글 링크 --%>
      </div>

      <div class="comments"> <%-- 댓글 영역 시작 --%>
        <h3>댓글 (<%= comments.size() %>)</h3> <%-- 댓글 개수 표시 --%>

        <% for (Comment c : comments) { %> <%-- 댓글 리스트 반복 출력 --%>
          <div class="comment-box">
            <div class="comment-meta">
              <span class="author"><%= c.getAuthor() %></span> <%-- 댓글 작성자 출력 --%>
              <span class="date"><%= c.getPublishedAt() %></span> <%-- 댓글 작성 날짜 출력 --%>
            </div>
            <%= c.getContent() %> <%-- 댓글 내용 출력 --%>
          </div>
        <% } %>

        <form class="comment-form" method="post" action="addComment.jsp?id=<%= articleId %>"> <%-- 댓글 작성 폼 --%>
          <textarea name="comment" required placeholder="댓글을 입력하세요..."></textarea> <%-- 댓글 입력 필드 --%>
          <br>
          <button type="submit">등록</button> <%-- 댓글 등록 버튼 --%> <%-- 폼캣서버가 켜 있는동안 댓글 데이터가 저장이된다 / 서버를 닫을시 초기화 --%>
        </form>
      </div>
    </main>

    <aside class="sidebar"> <%-- 사이드바 시작 --%>
      <div class="ad">
        <img src="image/광고배너_2.jpg" alt="광고 배너" width="300" height="250"> <%-- 파일 위치 : image / 광고 배너 이미지 --%>
      </div>

      <div class="card">
        <h3>연관 기사</h3>
        <ul>
          <li><a href="#">PUBG</a></li> <%-- 연관 기사 링크 1 --%>
          <li><a href="web2.jsp">Hollow_Knight_Silksong</a></li> <%-- web2.jsp로 이동함 / 연관 기사 링크 2 --%>
        </ul>
      </div>

      <div class="card">
        <h3></h3>
        <img src="image/광고배너.jpg" alt="인기 게임" style="width:100%"> <%-- 파일 위치 : image / 광고/이미지 카드 --%>
      </div>

      <div class="card">
        <h3>🔥 인기글</h3>
        <div class="popular-list"> <%-- 인기글 리스트 영역 --%>

          <div class="popular-item" onclick="location.href='https://store.steampowered.com/app/3241660/REPO/';">
            <img src="image/REPO.jpg" alt="인기글1">
            <div>
              <h4>4인 인기 공포게임 R.E.P.O.</h4> <%-- 인기글 제목 --%>
              <p>2025-09-13</p> <%-- 게시 날짜 --%>
            </div>
          </div>

          <div class="popular-item" onclick="location.href='https://store.steampowered.com/app/3167020/Escape_From_Duckov/';">
            <img src="image/Duckov.jpg" alt="인기글2">
            <div>
              <h4>새로운 타르코프류 비대칭 쿼터뷰 총게임</h4> <%-- 인기글 제목 --%>
              <p>2025-09-12</p>	<%-- 게시 날짜 --%>
            </div>
          </div>

          <div class="popular-item" onclick="location.href='https://store.steampowered.com/app/2060160/_/?l=koreana';">
            <img src="image/peasant.jpg" alt="인기글3">
            <div>
              <h4>코딩 할줄 아는 사람에게 추천!! '농부는 대체되었다'</h4>	<%-- 인기글 제목 --%>
              <p>2025-09-11</p>	<%-- 게시 날짜 --%>
            </div>
          </div>

        </div>
      </div>
    </aside>
  </div>

  <footer> <%-- 페이지 하단 푸터 --%>
    © YuhanGames | 회사소개 | 문의 | 개인정보처리방침 | 이용약관
  </footer>
</body>
</html>
