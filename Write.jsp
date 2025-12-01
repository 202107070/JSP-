<%@ page contentType="text/html; charset=UTF-8" language="java" %> <%-- JSP 페이지 설정: UTF-8 및 Java 사용 선언 --%>
<%@ page import="com.mygame.board.PostDAO" %> <%-- PostDAO 클래스 임포트 --%>

<%
    // 폼 데이터가 POST 방식으로 제출되었는지 확인
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title"); // title 파라미터 가져오기

        // 내용(content)은 여기서는 저장하지 않음

        // 제목이 비어있지 않을 경우에만 처리
        if (title != null && !title.trim().isEmpty()) {
            com.mygame.board.PostDAO.savePost(title); // DAO로 게시글 제목 저장
            
            response.sendRedirect("Board.jsp"); // 저장 후 목록 페이지로 이동
            return; // 이후 코드 실행 방지
        }
    }
%>

<!DOCTYPE html>
<html lang="ko"> <%-- HTML 한국어 설정 --%>
<head>
  <meta charset="UTF-8"> <%-- UTF-8 인코딩 설정 --%>
  <meta name="viewport" content="width=device-width, initial-scale=1"> <%-- 모바일 반응형 설정 --%>

  <title>YuhanGames - 게시글 작성</title> <%-- 브라우저 탭 제목 --%>

  <link rel="preconnect" href="https://fonts.googleapis.com"> <%-- 폰트 프리로드 --%>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> <%-- 폰트 CDN 최적화 --%>
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700&display=swap" rel="stylesheet"> <%-- Pretendard 폰트 로드 --%>

  <style>
    /* 전역 CSS 변수 */
    :root {
      --bg: #fff;            /* 배경색 */
      --text: #111;          /* 기본 글자색 */
      --muted: #666;         /* 흐린 글자색 */
      --brand: #d72638;      /* 브랜드 색상 */
      --line: #ddd;          /* 테두리 색상 */
      --nav-bg: #0d1033;     /* 네비게이션 바 배경 */
      --nav-text: #fff;      /* 네비게이션 글자색 */
    }

    /* 기본 스타일 초기화 */
    * {margin:0; padding:0; box-sizing:border-box;}
    body {font-family: Pretendard, sans-serif; background: var(--bg); color: var(--text);}
    a {text-decoration:none; color:inherit;}

    /* 헤더 영역 */
    header {
      border-bottom:1px solid var(--line);  /* 아래 테두리 */
      padding:10px 20px;                   /* 내부 여백 */
      display:flex;                        /* 가로 배치 */
      align-items:center;                  /* 수직 정렬 */
      justify-content:space-between;       /* 양쪽 정렬 */
      flex-wrap:wrap;                      /* 줄바꿈 허용 */
      background: var(--nav-bg);           /* 헤더 배경색 */
    }

    /* 로고 스타일 */
    header .logo {
      font-size:26px;
      font-weight:700;
      color: var(--nav-text); /* 로고 글자색 */
    }

    /* 네비게이션 메뉴 */
    nav ul {
      display:flex;
      list-style:none;
      gap:20px;      /* 메뉴 간격 */
      font-size:15px;
      flex-wrap:wrap;
    }

    nav ul li a {
      color: var(--nav-text); /* 메뉴 글자색 */
      font-weight:600;
    }

    /* 컨텐츠 컨테이너 */
    .container {
      max-width:800px;   /* 최대 가로폭 */
      margin:40px auto;  /* 가운데 정렬 */
      padding:0 20px;
    }

    /* 글쓰기 박스 */
    .write-area {
        background: #fdfdfd;          /* 박스 배경 */
        border: 1px solid var(--line); /* 테두리 */
        border-radius: 10px;           /* 둥근 모서리 */
        padding: 30px;                 /* 내부 여백 */
        box-shadow: 0 4px 10px rgba(0,0,0,0.05); /* 그림자 */
    }

    /* 섹션 제목 */
    .write-area h1 {
        font-size: 28px;
        color: var(--brand);
        border-bottom: 2px solid var(--line);
        padding-bottom: 15px;
        margin-bottom: 25px;
    }

    /* 입력 폼 그룹 */
    .form-group {
        margin-bottom: 20px;
    }

    /* label 스타일 */
    .form-group label {
        display: block;
        font-size: 16px;
        font-weight: 600;
        margin-bottom: 8px;
        color: var(--text);
    }

    /* input과 textarea 공통 스타일 */
    .form-group input[type="text"],
    .form-group textarea {
        width: 100%;                /* 전체 너비 */
        padding: 12px;              /* 내부 여백 */
        border: 1px solid var(--line);
        border-radius: 6px;
        font-size: 15px;
        font-family: inherit;
        transition: border-color 0.2s; /* 포커스 애니메이션 */
    }

    /* 포커스 효과 */
    .form-group input[type="text"]:focus,
    .form-group textarea:focus {
        border-color: var(--brand);
        outline: none;
    }

    /* textarea 크기 */
    .form-group textarea {
        resize: vertical;     /* 세로만 조절 가능 */
        min-height: 250px;    /* 최소 높이 */
    }

    /* 버튼 묶음 */
    .button-group {
        display: flex;
        justify-content: flex-end; /* 오른쪽 정렬 */
        gap: 10px;
        margin-top: 30px;
    }

    /* 기본 버튼 스타일 */
    .btn {
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.2s, transform 0.1s;
    }

    /* 작성 완료 버튼 */
    .btn-submit {
        background: var(--brand);
        color: var(--nav-text);
    }
    .btn-submit:hover {
        background: #b5202e;
        transform: translateY(-1px);
    }

    /* 취소 버튼 */
    .btn-cancel {
        background: #ccc;
        color: var(--text);
    }
    .btn-cancel:hover {
        background: #bbb;
        transform: translateY(-1px);
    }

    /* 푸터 */
    footer {
      margin-top:40px;
      padding:20px;
      border-top:1px solid var(--line);
      font-size:13px;
      text-align:center;
      color: var(--nav-text);
      background: var(--nav-bg);
    }

  </style>
</head>

<body>
  <%-- 헤더 영역 --%>
  <header>
    <a href="menu.jsp"><span class="logo">GameLinks</span></a> <%-- 로고 클릭 시 메인 이동 --%>

    <nav>
      <ul>
        <li><a href="menu.jsp">메인</a></li>       <%-- 메인 페이지 --%>
        <li><a href="Board.jsp">게시글</a></li>    <%-- 게시판 --%>
        <li><a href="sport.jsp">스포츠</a></li>     <%-- 스포츠 메뉴 --%>
        <li><a href="sportgame.jsp">스포츠게임</a></li> <%-- 스포츠게임 메뉴 --%>
      </ul>
    </nav>

    <div>
      <a href="login_2.jsp" style="color: var(--nav-text);">로그인</a> <%-- 로그인 --%>
       | 
      <a href="register.jsp" style="color: var(--nav-text);">회원가입</a> <%-- 회원가입 --%>
    </div>
  </header>

  <%-- 본문 컨테이너 --%>
  <div class="container">
    <div class="write-area">
        <h1>새 게시글 작성</h1> <%-- 페이지 제목 --%>
        
        <form action="Write.jsp" method="post"> <%-- POST 방식 글쓰기 폼 --%>
            
            <div class="form-group">
                <label for="title">제목</label> <%-- 제목 입력 라벨 --%>
                <input type="text" id="title" name="title" required placeholder="제목을 입력해 주세요."> <%-- 제목 입력 필드 --%>
            </div>

            <div class="form-group">
                <label for="content">내용</label> <%-- 내용 입력 라벨 --%>
                <textarea id="content" name="content" rows="10" required placeholder="내용을 입력해 주세요."></textarea> <%-- 내용 입력 박스 --%>
            </div>
            
            <div class="button-group">
                <a href="Board.jsp" class="btn btn-cancel">취소</a> <%-- 취소 버튼 (게시판으로 이동) --%>
                <button type="submit" class="btn btn-submit">작성 완료</button> <%-- 제출 버튼 --%>
            </div>
        </form>

    </div>
  </div>
  
  <%-- 푸터 --%>
  <footer>
    ⓒ 2025 GameLinks. All rights reserved.
  </footer>

</body>
</html>
