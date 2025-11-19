<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.mygame.board.PostDAO" %> 
<%
    // 폼 데이터가 POST 방식으로 제출되었을 때 처리하는 로직
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title");
        // 내용(content) 파라미터는 여기서는 저장하지 않고, 제목만 PostDAO에 저장합니다.
        
        if (title != null && !title.trim().isEmpty()) {
            // DAO를 사용하여 메모리에 게시글 저장
            com.mygame.board.PostDAO.savePost(title);
            
            // 저장 후 게시글 목록 페이지로 이동
            response.sendRedirect("Board.jsp");
            return;
        }
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>YuhanGames - 게시글 작성</title>
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

    /* 컨테이너 및 메인 영역 */
    .container {max-width:800px; margin:40px auto; padding:0 20px;}
    .write-area {
        background: #fdfdfd;
        border: 1px solid var(--line);
        border-radius: 10px;
        padding: 30px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.05);
    }
    
    /* 폼 스타일 */
    .write-area h1 {
        font-size: 28px;
        color: var(--brand);
        border-bottom: 2px solid var(--line);
        padding-bottom: 15px;
        margin-bottom: 25px;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        display: block;
        font-size: 16px;
        font-weight: 600;
        margin-bottom: 8px;
        color: var(--text);
    }
    .form-group input[type="text"],
    .form-group textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid var(--line);
        border-radius: 6px;
        font-size: 15px;
        font-family: inherit;
        transition: border-color 0.2s;
    }
    .form-group input[type="text"]:focus,
    .form-group textarea:focus {
        border-color: var(--brand);
        outline: none;
    }
    .form-group textarea {
        resize: vertical;
        min-height: 250px;
    }

    /* 버튼 스타일 */
    .button-group {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
        margin-top: 30px;
    }
    .btn {
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.2s, transform 0.1s;
    }
    .btn-submit {
        background: var(--brand);
        color: var(--nav-text);
    }
    .btn-submit:hover {
        background: #b5202e;
        transform: translateY(-1px);
    }
    .btn-cancel {
        background: #ccc;
        color: var(--text);
    }
    .btn-cancel:hover {
        background: #bbb;
        transform: translateY(-1px);
    }

    /* 푸터 */
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
    <div class="write-area">
        <h1>새 게시글 작성</h1>
        
        <form action="Write.jsp" method="post">
            
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" required placeholder="제목을 입력해 주세요.">
            </div>

            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" rows="10" required placeholder="내용을 입력해 주세요."></textarea>
            </div>
            
            <div class="button-group">
                <a href="Board.jsp" class="btn btn-cancel">취소</a> 
                <button type="submit" class="btn btn-submit">작성 완료</button>
            </div>
        </form>

    </div>
  </div>
  
  <footer>
    ⓒ 2025 GameLinks. All rights reserved.
  </footer>
</body>
</html>