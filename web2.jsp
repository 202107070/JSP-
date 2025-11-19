<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mygame.board.Comment" %>
<%@ page import="com.mygame.board.CommentDAO" %>

<%
    // ✅ 1. 현재 게시글의 ID 정의
    String articleId = "web2"; 

    // 컨트롤러에서 넘겨준 article 객체 받기 (예시용)
    String title = (String) request.getAttribute("title");
    if (title == null) title = "할로우 나이트 : 실크송 ";

    String author = (String) request.getAttribute("author");
    if (author == null) author = "익명";

    String content = (String) request.getAttribute("content");
    if (content == null) content = "할로우 나이트 : 실크송은 액션RPG, 메트로배니아, 플랫모퍼 등 다양한 모험을 하며 앞으로 나아가는 액션PRG 게임 입니다.";

    int viewCount = request.getAttribute("viewCount") != null ? (Integer) request.getAttribute("viewCount") : 0000;

    Date date = (Date) request.getAttribute("publishedAt");
    if (date == null) date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
    String publishedAt = sdf.format(date);

    String tags = (String) request.getAttribute("tags");
    if (tags == null) tags = "액션RPG, 액션어드벤처, 대전격투게임";

    String prevArticle = (String) request.getAttribute("prevArticle");
    if (prevArticle == null) prevArticle = "이전기사";

    String nextArticle = (String) request.getAttribute("nextArticle");
    if (nextArticle == null) nextArticle = "다음기사";

    // ✅ 2. CommentDAO에서 해당 ID의 댓글 데이터를 가져옵니다.
    List<Comment> comments = CommentDAO.getCommentsByArticleId(articleId);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title><%= title %> - GameLinks</title>
  <style>
    :root {
      --bg: #ffffff;
      --text: #222222;
      --muted: #666666;
      --border: #e0e0e0;
      --primary: #0056b3;
      --chip-bg: #f1f3f5;
      --chip-text: #333;
    }
    body {
      margin: 0;
      font-family: 'Pretendard', sans-serif;
      background: var(--bg);
      color: var(--text);
      line-height: 1.6;
    }
    a { color: var(--primary); text-decoration: none; }
    a:hover { text-decoration: underline; }
    header {
      background: #0d1033;
      border-bottom: 1px solid var(--border);
      padding: 12px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    header .logo {
      font-weight: 700;
      font-size: 1.4rem;
      color: #ffffff;
    }
    nav a { margin: 0 10px; color: #ffffff; }
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 18px;
      display: flex;
      gap: 20px;
    }
    .main { flex: 3; }
    .sidebar { flex: 1; }
    h1.headline { font-size: 1.8rem; margin: 12px 0; }
    .subhead { font-size: 1.1rem; color: var(--muted); }
    .meta { font-size: 0.9rem; color: var(--muted); margin-bottom: 16px; }
    .hero img { width: 100%; border-radius: 8px; }
    .content { margin: 20px 0; }
    .tags { margin: 10px 0; }
    .chip {
      display: inline-block;
      background: var(--chip-bg);
      color: var(--chip-text);
      font-size: 0.85rem;
      padding: 4px 10px;
      border-radius: 20px;
      margin: 2px 4px 2px 0;
    }
    .nav-articles {
      display: flex;
      justify-content: space-between;
      margin: 20px 0;
    }
    .nav-articles a {
      padding: 6px 12px;
      border: 1px solid var(--border);
      border-radius: 6px;
      background: #fafafa;
    }
    .card {
      border: 1px solid var(--border);
      border-radius: 8px;
      background: #fff;
      padding: 10px;
      margin: 20px 0;
    }
    .comments {
       margin-bottom: 25px;
    }
    .comments h3 { margin-bottom: 10px; }
    .comment-meta {
        font-size: 0.8rem;
        color: var(--muted);
        margin-bottom: 4px;
        display: flex;
        justify-content: space-between;
    }
    .comment-box {
      border: 1px solid var(--border);
      border-radius: 6px;
      padding: 10px;
      margin: 8px 0;
      background: #fafafa;
    }
    .comment-form textarea {
      width: 98%;
      height: 60px;
      padding: 8px;
      border-radius: 6px;
      border: 1px solid var(--border);
      resize: none;
    }
    .comment-form button {
      margin-top: 6px;
      padding: 6px 12px;
      background: var(--primary);
      color: #fff;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }
    .ad {
      margin-bottom: 18px;
      text-align: center;
    }
    footer {
      border-top: 1px solid var(--border);
      background: #0d1033;
      padding: 16px 0;
      margin-top: 40px;
      font-size: 0.9rem;
      color: #ffffff;
      text-align: center;
    }
    
    /* 인기글 섹션 */
    .popular-section {margin-top:40px;}
    .popular-section h2 {font-size:20px; margin-bottom:15px; color:var(--brand); font-weight:700;}
    .popular-list {display:flex; flex-direction:column; gap:12px;}
    .popular-item {display:flex; gap:12px; align-items:center; cursor:pointer;}
    .popular-item img {width:80px; height:60px; object-fit:cover; border-radius:6px;}
    .popular-item h4 {font-size:15px; margin:0;}
    .popular-item p {font-size:12px; color:var(--muted); margin:2px 0 0;}
    .popular-item:hover {background:#f0f0f0; border-radius:6px; transition:0.2s;}
    
  </style>
</head>
<body>
  <header>
    <a href="menu.jsp"><span class="logo">GameLinks</span></a>
    <nav>
      <a href="menu.jsp">홈</a>
    </nav>
  </header>

  <div class="container">
    <main class="main">
      <h1 class="headline"><%= title %></h1>
      <p class="subhead">by <%= author %></p>
      <div class="meta">
        조회수: <%= viewCount %> · <%= publishedAt %>
      </div>

      <div class="hero">
  		<iframe width="100%" height="450" src="https://www.youtube.com/embed/6XGeJwsUP9c" 
          title="Hollow Knight: Silksong - Release Trailer" frameborder="0" 
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
          allowfullscreen style="border-radius: 8px;"></iframe>
		</div>

      <div class="content">
        <p><%= content %></p>
      </div>

      <div class="tags">
        <% if (tags != null && !tags.isEmpty()) {
             String[] tagList = tags.split(",");
             for (String t : tagList) { %>
               <span class="chip">#<%= t.trim() %></span>
        <%   }
           } %>
      </div>

      <div class="nav-articles">
        <a href="web1.jsp">&larr; <%= prevArticle %></a>
        <a href="web1.jsp"><%= nextArticle %> &rarr;</a>
      </div>

      <div class="comments">
        <h3>댓글 (<%= comments.size() %>)</h3>
        
        <% for (Comment c : comments) { %>
          <div class="comment-box">
            <div class="comment-meta">
                <span class="author"><%= c.getAuthor() %></span>
                <span class="date"><%= c.getPublishedAt() %></span>
            </div>
            <%= c.getContent() %>
          </div>
        <% } %>

        <form class="comment-form" method="post" action="addComment.jsp?id=<%= articleId %>">
          <textarea name="comment" required placeholder="댓글을 입력하세요..."></textarea>
          <br>
          <button type="submit">등록</button>
        </form>
      </div>
    </main>

    <aside class="sidebar">
      <div class="ad">
        <img src="image/광고배너_2.jpg" alt="광고 배너" width="300" height="250">
      </div>

      <div class="card">
        <h3>연관 기사</h3>
        <ul>
          <li><a href="#">PUBG</a></li>
          <li><a href="web1.jsp">Stardew_Valley</a></li>
        </ul>
      </div>

      <div class="card">
        <h3></h3>
        <img src="image/광고배너.jpg" alt="인기 게임" style="width:100%">
      </div>
      
      <div class="card">
    <h3>🔥 인기글</h3>
    <div class="popular-list">
      <div class="popular-item" onclick="location.href='https://store.steampowered.com/app/3241660/REPO/';" style="cursor:pointer; display:flex; gap:10px; margin-bottom:12px;">
        <img src="image/REPO.jpg" alt="인기글1" style="width:80px; height:60px; object-fit:cover; border-radius:6px;">
        <div>
          <h4 style="margin:0; font-size:14px;">4인 인기 공포게임 R.E.P.O.</h4>
          <p style="margin:2px 0 0; font-size:12px; color:#666;">2025-09-13</p>
        </div>
      </div>
      <div class="popular-item" onclick="location.href='https://store.steampowered.com/app/3167020/Escape_From_Duckov/';" style="cursor:pointer; display:flex; gap:10px; margin-bottom:12px;">
        <img src="image/Duckov.jpg" alt="인기글2" style="width:80px; height:60px; object-fit:cover; border-radius:6px;">
        <div>
          <h4 style="margin:0; font-size:14px;">새로운 타르코프류 비대칭 쿼터뷰 총게임</h4>
          <p style="margin:2px 0 0; font-size:12px; color:#666;">2025-09-12</p>
        </div>
      </div>
      <div class="popular-item" onclick="location.href='https://store.steampowered.com/app/2060160/_/?l=koreana';" style="cursor:pointer; display:flex; gap:10px;">
        <img src="image/peasant.jpg" alt="인기글3" style="width:80px; height:60px; object-fit:cover; border-radius:6px;">
        <div>
          <h4 style="margin:0; font-size:14px;">코딩 할줄 아는 사람에게 추천!! '농부는 대체되었다</h4>
          <p style="margin:2px 0 0; font-size:12px; color:#666;">2025-09-11</p>
        </div>
      </div>
    </div>
  </div>
  </aside>
  </div>

  <footer>
    © YuhanGames | 회사소개 | 문의 | 개인정보처리방침 | 이용약관
  </footer>
</body>
</html>