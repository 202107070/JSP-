<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mygame.board.Post" %>
<%@ page import="com.mygame.board.PostDAO" %>
<%
    // PostDAO를 사용하여 메모리에서 게시글 목록을 가져옵니다.
    List<Post> postList = PostDAO.getAllPosts();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>YuhanGames - 게시글 목록</title>
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
        header {border-bottom:1px solid var(--line); padding:10px 20px; display:flex; align-items:center; justify-content:space-between; flex-wrap:wrap; background: var(--nav-bg);}
        header .logo {font-size:26px; font-weight:700; color: var(--nav-text);}
        nav ul {display:flex; list-style:none; gap:20px; font-size:15px; flex-wrap:wrap;}
        nav ul li a {color: var(--nav-text); font-weight:600;}
        .container {max-width:1000px; margin:40px auto; padding:0 20px;}
        .board-header {display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid var(--brand); padding-bottom: 10px; margin-bottom: 20px;}
        .board-header h1 {font-size: 28px; color: var(--text);}
        .btn-write {background: var(--brand); color: white; padding: 8px 15px; border-radius: 6px; font-weight: 600; transition: background 0.2s;}
        .btn-write:hover {background: #b5202e;}
        .post-list {border: 1px solid var(--line); border-radius: 10px; overflow: hidden;}
        .post-item {display: flex; padding: 15px 20px; border-bottom: 1px solid #eee; cursor: pointer; transition: background-color 0.2s;}
        .post-item:hover {background-color: #f9f9f9;}
        .post-item:last-child {border-bottom: none;}
        .post-no {width: 50px; text-align: center; color: var(--muted);}
        .post-title {flex-grow: 1; font-weight: 600;}
        .post-date {width: 100px; text-align: right; color: var(--muted); font-size: 14px;}
        footer {margin-top:40px; padding:20px; border-top:1px solid var(--line); font-size:13px; text-align:center; color: var(--nav-text); background: var(--nav-bg);}
    </style>
</head>
<body>
    <header>
      <a href="menu.jsp"><span class="logo">GameLinks</span></a>
      <nav>
        <ul>
          <li><a href="menu.jsp">메뉴</a></li>
          <li><a href="Board.jsp">게시글</a></li>
        </ul>
      </nav>
      <div>
        <a href="login_2.jsp" style="color: var(--nav-text);">로그인</a> | <a href="register.jsp" style="color: var(--nav-text);">회원가입</a>
      </div>
    </header>

    <div class="container">
        <div class="board-header">
            <h1>게시글 목록</h1>
            <a href="Write.jsp" class="btn-write">글쓰기</a> 
        </div>

        <div class="post-list">
            <% 
                // 게시글 리스트를 반복하여 출력합니다.
                if (postList.isEmpty()) {
            %>
                <div style="padding: 30px; text-align: center; color: var(--muted);">
                    게시글이 없습니다. 첫 게시글을 작성해 보세요!
                </div>
            <%
                } else {
                    for (Post post : postList) {
            %>
                        <div class="post-item" onclick="location.href='PostDetail.jsp?id=<%= post.getId() %>';">
                            <span class="post-no"><%= post.getId() %></span>
                            <span class="post-title"><%= post.getTitle() %></span>
                            <span class="post-date"><%= post.getDate() %></span>
                        </div>
            <%
                    }
                }
            %>
        </div>

        <p style="text-align: center; margin-top: 30px; font-size: 14px; color: var(--muted);">
            이 목록은 톰캣 서버가 실행되는 동안 메모리에 유지됩니다. 서버를 끄면 데이터가 사라집니다.
        </p>

    </div>

    <footer>
      ⓒ 2025 GameLinks. All rights reserved.
    </footer>
</body>
</html>