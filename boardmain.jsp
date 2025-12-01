<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%!
    public class Post {
        public int index;
        public String title;
        public String content;
        public Post(int index, String title, String content) {
            this.index = index;
            this.title = title;
            this.content = content;
        }
    }
%>

<%
// ⭐️ 2. 모든 변수 선언 및 로직 통합 ⭐️

// [a] 조회수 및 신규 글 상태 관리를 위한 세션 변수 초기화
Map<Integer, Integer> views = (Map<Integer, Integer>) session.getAttribute("views");
if (views == null) {
	views = new HashMap<>();
	session.setAttribute("views", views);
}

// 'N' 표시를 위한 마지막으로 본 글 인덱스 확인
Integer lastViewedIndex = (Integer) session.getAttribute("last_viewed_post_index");
if (lastViewedIndex == null) {
	lastViewedIndex = 0; // 초기값은 0으로 설정
	session.setAttribute("last_viewed_post_index", lastViewedIndex);
}

// [b] application 영역에서 List<Post>를 가져옵니다.
List<Post> posts = (List<Post>) application.getAttribute("posts");
if (posts == null) {
	posts = new ArrayList<>();
	
	// 임의의 더미 데이터 추가
	posts.add(new Post(posts.size(), "🔥 [공지] yuven 커뮤니티 오픈 및 이용 안내", "안녕하세요! yuven 커뮤니티가 오픈했습니다. 자유롭게 이용해주세요."));
	posts.add(new Post(posts.size(), "📢 서버 업데이트 클라이언트 1.2.500 패치", "클라이언트 안정화 및 신규 이모티콘이 추가되었습니다."));
	posts.add(new Post(posts.size(), "💡 자유 게시판 사용법 및 팁", "게시글 작성 시 제목과 내용을 명확하게 작성해주세요."));
	posts.add(new Post(posts.size(), "🎮 재미있는 **게임** 추천 받습니다", "최근 할 만한 PC 게임이 있을까요?"));
	posts.add(new Post(posts.size(), "🎵 **음악** 장르별 추천 목록", "잔잔한 발라드 위주로 부탁드려요."));
	posts.add(new Post(posts.size(), "🎬 **영화** '듄 2' 개봉 임박 후기", "기대 이상입니다. 꼭 보세요."));
	posts.add(new Post(posts.size(), "스포츠 뉴스 하이라이트", "손흥민 선수의 골 소식입니다."));
	//서버 상에 저장함
	application.setAttribute("posts", posts);
}

// [c] 조회수 증가 요청 처리 (현재 페이지가 view=index 파라미터를 받을 때)
String viewIndexStr = request.getParameter("view");
if (viewIndexStr != null) {
	try {
		int viewIndex = Integer.parseInt(viewIndexStr);
        
        // 주의: 조회수 증가는 이제 viewPost.jsp에서 처리하는 것이 일반적입니다.
        // 여기서는 게시글 목록을 유지하기 위해 별도 처리 없이 넘어갑니다.
		// views.put(viewIndex, views.getOrDefault(viewIndex, 0) + 1);

	} catch (NumberFormatException e) {
		// 예외 처리 
	}
}

// [d] 글쓰기 등록 처리
String newTitle = request.getParameter("title");
String newContent = request.getParameter("content");

if (newTitle != null && newContent != null && !newTitle.trim().equals("")) {
	Post newPost = new Post(posts.size(), newTitle, newContent);
	posts.add(newPost);
    // 등록 후 리다이렉트 (중복 등록 방지)
    response.sendRedirect("boardmain.jsp"); 
    return;
}

// [e] 검색 쿼리 처리
String searchQuery = request.getParameter("q"); 
if (searchQuery == null) {
	searchQuery = "";
}
String lowerQuery = searchQuery.toLowerCase().trim();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>yuven 게시판</title>
<link rel="stylesheet" href="style.css">
<style>
/* 게시판 목록 스타일 */
.board-container {
    padding: 20px;
    background: #fff;
    border-radius: 6px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}
.board-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
}
.board-table th, .board-table td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
    text-align: left;
}
.board-table th {
    background: #f4f4f4;
    font-size: 14px;
}
.board-table td a {
    text-decoration: none;
    color: #333;
    display: block;
    max-width: 95%;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.board-table td.title-col {
    width: 70%;
}
.board-table td.meta-col {
    width: 10%;
    text-align: center;
    font-size: 12px;
}
.board-table tr:hover {
    background: #fafafa;
}
.board-table .new-post a {
    font-weight: bold;
    color: #DB0000;
}
/* 글쓰기 폼 */
.write-form textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
    margin-bottom: 10px;
}
.write-form input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.write-form input[type="submit"] {
    padding: 8px 15px;
    background: #3498db;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}
.write-form::after {
    content: "";
    display: table;
    clear: both;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="container">
		<div class="banner-ad"></div>
		<%@ include file="left-sidebar.jsp"%>

		<div class="main">
			<h2>게시판</h2>
            
            <div class="board-container write-form" style="margin-bottom: 20px;">
                <form method="post">
                    <h3>새 글 작성</h3>
                    <input type="text" name="title" placeholder="글 제목을 입력하세요." required>
                    <textarea name="content" placeholder="글 내용을 입력하세요." rows="5" required></textarea>
                    <input type="submit" value="등록">
                </form>
            </div>
            
            <div class="board-container">
                <h3>게시글 목록 (총 <%= posts.size() %>개)</h3>
                <% if (!lowerQuery.isEmpty()) { %>
                    <p style="color: #DB0000; font-weight: bold;">
                        '<%= searchQuery %>' 에 대한 검색 결과입니다. 
                        (<a href="boardmain.jsp" style="font-weight: normal; color: #3498db;">전체 목록 보기</a>)
                    </p>
                <% } %>
                <table class="board-table">
                    <thead>
                        <tr>
                            <th class="meta-col">번호</th>
                            <th class="title-col">제목</th>
                            <th class="meta-col">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    int displayedCount = 0;
                    // posts 리스트를 역순으로 순회하며 필터링
                    for (int i = posts.size() - 1; i >= 0; i--) {
                        Post p = posts.get(i);
                        
                        // ⭐️ 검색 필터링 로직 ⭐️
                        if (!lowerQuery.isEmpty() && !p.title.toLowerCase().contains(lowerQuery)) {
                            continue; // 검색어와 일치하지 않으면 건너뛰기
                        }

                        // lastViewedIndex와 views는 이미 위에서 정의됨
                        boolean isNew = (i >= lastViewedIndex);
                        int viewCount = views.getOrDefault(p.index, 0); 
                        String rowClass = isNew ? "new-post" : "";
                    %>
                        <tr class="<%= rowClass %>">
                            <td class="meta-col"><%= p.index + 1 %></td>
                            <td class="title-col">
                                <a href="viewPost.jsp?index=<%= p.index %>"><%= p.title %></a>
                            </td>
                            <td class="meta-col"><%= isNew ? "N" : viewCount %></td>
                        </tr>
                    <%
                        displayedCount++;
                    }
                    
                    // ⭐️ 검색 결과가 없는 경우 처리 ⭐️
                    if (!lowerQuery.isEmpty() && displayedCount == 0) {
                    %>
                        <tr>
                            <td colspan="3" style="text-align: center; color: #888;">'<%= searchQuery %>' 에 대한 검색 결과가 없습니다.</td>
                        </tr>
                    <%
                    }
                    %>
                    </tbody>
                </table>
            </div>
		</div>

		<%@ include file="right-sidebar.jsp"%>

		<div class="banner-ad"></div>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>