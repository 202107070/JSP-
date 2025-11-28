<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
// 1. 검색어 받기
String query = request.getParameter("q");
if (query == null || query.trim().isEmpty()) {
	return; // 검색어가 없으면 종료
}

// 대소문자 구분을 없애기 위해 소문자로 변환
String lowerQuery = query.toLowerCase();

// 2. application 영역에서 posts 리스트 가져오기
List<String> posts = (List<String>) application.getAttribute("posts");
if (posts == null) {
	posts = new ArrayList<>(); // 리스트가 없으면 빈 리스트로 초기화
}
%>

<ul>
	<%
	int resultCount = 0;
	// 3. 리스트를 순회하며 검색어 포함 여부 확인
	for (int i = 0; i < posts.size(); i++) {
		String postContent = posts.get(i);

		// 대소문자 구분 없이 검색
		if (postContent.toLowerCase().contains(lowerQuery)) {
			// 4. 검색 결과를 HTML 목록 항목으로 출력
			// 클릭 시 해당 글로 이동하는 링크를 포함 (임시로 boardmain.jsp로 이동)
			out.println("<li style='padding: 8px; border-bottom: 1px solid #eee; cursor: pointer;' "
			+ "onclick=\"location.href='boardmain.jsp?view=" + i + "';\">");
			out.println(postContent);
			out.println("</li>");

			resultCount++;
			if (resultCount >= 10)
		break; // 최대 10개까지만 표시
		}
	}

	if (resultCount == 0) {
		out.println("<li style='padding: 8px; color: #999;'>검색 결과가 없습니다.</li>");
	}
	%>
</ul>