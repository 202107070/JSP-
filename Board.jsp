<%@ page contentType="text/html; charset=UTF-8" language="java" %> <%-- JSP 페이지 설정(UTF-8 & Java) --%>
<%@ page import="java.util.List" %> <%-- List 컬렉션 import --%>
<%@ page import="com.mygame.board.Post" %> <%-- Post DTO import --%>
<%@ page import="com.mygame.board.PostDAO" %> <%-- PostDAO import --%>

<%
    // PostDAO에서 현재 메모리에 저장된 모든 게시글 불러오기
    List<Post> postList = PostDAO.getAllPosts(); // 게시글 목록 리스트
%>

<!DOCTYPE html> <%-- HTML5 문서 선언 --%>
<html lang="ko"> <%-- 한국어 페이지 설정 --%>
<head> <%-- head 영역 시작 --%>
    <meta charset="UTF-8"> <%-- 문자 인코딩 UTF-8 설정 --%>

    <!-- 반응형 웹 설정 -->
    <meta name="viewport" content="width=device-width, initial-scale=1"> <%-- 모바일 대응 화면 크기 설정 --%>

    <title>YuhanGames - 게시글 목록</title> <%-- 페이지 제목 --%>

    <!-- Pretendard 폰트 로드 -->
    <link rel="preconnect" href="https://fonts.googleapis.com"> <%-- 구글 폰트 사전 연결 --%>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> <%-- 폰트 리소스 빠른 로딩 --%>
    <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700&display=swap" rel="stylesheet"> <%-- Pretendard 폰트 불러오기 --%>

    <style> <%-- CSS 스타일 시작 --%>

        :root { <%-- CSS 변수 정의 --%>
            --bg: #fff; <%-- 기본 배경색 --%>
            --text: #111; <%-- 기본 글자색 --%>
            --muted: #666; <%-- 흐린 텍스트 색상 --%>
            --brand: #d72638; <%-- 브랜드 포인트 색상 --%>
            --line: #ddd; <%-- 라인 색상 --%>
            --nav-bg: #0d1033; <%-- 네비게이션 배경색 --%>
            --nav-text: #fff; <%-- 네비게이션 글자색 --%>
        }

        * {margin:0; padding:0; box-sizing:border-box;} <%-- 기본 여백 제거 및 박스 모델 통일 --%>

        body {font-family: Pretendard, sans-serif; background: var(--bg); color: var(--text);} <%-- 전체 페이지 기본 스타일 --%>

        a {text-decoration:none; color:inherit;} <%-- 링크 밑줄 제거 및 색상 상속 --%>

        header { <%-- 헤더 스타일 --%>
            border-bottom:1px solid var(--line); <%-- 아래 테두리 --%>
            padding:10px 20px; <%-- 패딩 --%>
            display:flex; <%-- 가로 배치 --%>
            align-items:center; <%-- 수직 정렬 --%>
            justify-content:space-between; <%-- 양쪽 분리 정렬 --%>
            flex-wrap:wrap; <%-- 줄바꿈 허용 --%>
            background: var(--nav-bg); <%-- 헤더 배경색 --%>
        }

        header .logo {font-size:26px; font-weight:700; color: var(--nav-text);} <%-- 로고 폰트 스타일 --%>

        nav ul {display:flex; list-style:none; gap:20px; font-size:15px; flex-wrap:wrap;} <%-- 메뉴 리스트 정렬 --%>
        nav ul li a {color: var(--nav-text); font-weight:600;} <%-- 메뉴 링크 스타일 --%>

        .container {max-width:1000px; margin:40px auto; padding:0 20px;} <%-- 전체 페이지 중앙 컨테이너 --%>

        .board-header { <%-- 게시판 상단 영역 --%>
            display:flex;
            justify-content:space-between;
            align-items:center;
            border-bottom:2px solid var(--brand);
            padding-bottom:10px;
            margin-bottom:20px;
        }

        .board-header h1 {font-size:28px; color: var(--text);} <%-- 게시글 목록 타이틀 --%>

        .btn-write { <%-- 글쓰기 버튼 --%>
            background: var(--brand);
            color:white;
            padding:8px 15px;
            border-radius:6px;
            font-weight:600;
            transition:background 0.2s;
        }

        .btn-write:hover {background:#b5202e;} <%-- 버튼 호버 색상 --%>

        .post-list {border:1px solid var(--line); border-radius:10px; overflow:hidden;} <%-- 게시글 리스트 영역 박스 --%>

        .post-item { <%-- 게시글 한 줄 --%>
            display:flex;
            padding:15px 20px;
            border-bottom:1px solid #eee;
            cursor:pointer;
            transition:background-color 0.2s;
        }

        .post-item:hover {background-color:#f9f9f9;} <%-- 마우스 올렸을 때 배경색 변경 --%>

        .post-item:last-child {border-bottom:none;} <%-- 마지막 줄은 선 제거 --%>

        .post-no {width:50px; text-align:center; color:var(--muted);} <%-- 게시글 번호 --%>

        .post-title {flex-grow:1; font-weight:600;} <%-- 게시글 제목 --%>

        .post-date {width:100px; text-align:right; color:var(--muted); font-size:14px;} <%-- 작성 날짜 --%>

        footer { <%-- 하단 푸터 --%>
            margin-top:40px;
            padding:20px;
            border-top:1px solid var(--line);
            font-size:13px;
            text-align:center;
            color: var(--nav-text);
            background: var(--nav-bg);
        }

    </style> <%-- CSS 종료 --%>
</head> <%-- head 종료 --%>

<body> <%-- body 시작 --%>

    <header> <%-- 헤더 영역 시작 --%>

      <a href="menu.jsp"><span class="logo">GameLinks</span></a> <%-- 로고 클릭 시 메뉴 이동 --%>

      <nav> <%-- 메뉴 네비게이션 --%>
        <ul>
          <li><a href="menu.jsp">메뉴</a></li> <%-- 메뉴 버튼 --%>
          <li><a href="Board.jsp">게시글</a></li> <%-- 게시판 버튼 --%>
        </ul>
      </nav>

      <div> <%-- 로그인/회원가입 영역 --%>
        <a href="login_2.jsp" style="color: var(--nav-text);">로그인</a> <%-- 로그인 버튼 --%>
        | 
        <a href="register.jsp" style="color: var(--nav-text);">회원가입</a> <%-- 회원가입 버튼 --%>
      </div>

    </header> <%-- 헤더 종료 --%>

    <div class="container"> <%-- 중앙 컨테이너 시작 --%>

        <div class="board-header"> <%-- 게시글 목록 상단 헤더 --%>
            <h1>게시글 목록</h1> <%-- 페이지 제목 --%>
            <a href="Write.jsp" class="btn-write">글쓰기</a> <%-- 글쓰기 버튼 --%>
        </div>

        <div class="post-list"> <%-- 게시글 리스트 영역 --%>

            <% if (postList.isEmpty()) { %> <%-- 게시글이 없는 경우 --%>

                <div style="padding: 30px; text-align: center; color: var(--muted);">
                    게시글이 없습니다. 첫 게시글을 작성해 보세요!
                </div> <%-- 빈 게시판 안내 문구 --%>

            <% } else { %> <%-- 게시글이 하나 이상 있을 때 --%>

                <% for (Post post : postList) { %> <%-- 게시글 하나씩 출력 반복문 --%>

                    <div class="post-item" onclick="location.href='PostDetail.jsp?id=<%= post.getId() %>';">
                        <span class="post-no"><%= post.getId() %></span> <%-- 글 번호 표시 --%>
                        <span class="post-title"><%= post.getTitle() %></span> <%-- 제목 표시 --%>
                        <span class="post-date"><%= post.getDate() %></span> <%-- 작성 날짜 표시 --%>
                    </div>

                <% } %> <%-- for 종료 --%>

            <% } %> <%-- if 종료 --%>

        </div> <%-- post-list 종료 --%>

        <p style="text-align: center; margin-top: 30px; font-size: 14px; color: var(--muted);">
            이 목록은 톰캣 서버가 실행되는 동안 메모리에 유지됩니다. 서버를 끄면 데이터가 사라집니다.
        </p> <%-- 메모리 기반 안내 문구 --%>

    </div> <%-- container 종료 --%>

    <footer> <%-- 푸터 영역 --%>
      ⓒ 2025 GameLinks. All rights reserved.
    </footer>

</body> <%-- body 종료 --%>

</html> <%-- HTML 문서 끝 --%>
