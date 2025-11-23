<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    // 1. 요청 인코딩 설정 (한글 깨짐 방지)
    request.setCharacterEncoding("UTF-8");

    // 2. 파라미터 받기
    String content = request.getParameter("quickContent");
    String returnUrl = request.getParameter("returnUrl"); // 돌아갈 페이지 주소

    // 유효성 검사 (내용이 없으면 저장하지 않음)
    if (content != null && !content.trim().isEmpty()) {
        
        // 3. application 내장 객체를 사용하여 데이터 공유 (DB 대용)
        // "quickNewsList"라는 이름으로 리스트를 가져옴
        
        // ⭐️ 수정됨: 노란 줄(Type safety) 경고를 숨기기 위한 어노테이션 추가
        @SuppressWarnings("unchecked")
        List<String> newsList = (List<String>) application.getAttribute("quickNewsList");
        
        // 리스트가 없으면 새로 생성 (서버 켜지고 첫 등록일 때)
        if (newsList == null) {
            newsList = new ArrayList<String>();
        }
        
        // 리스트의 맨 앞(0번 인덱스)에 최신 글 추가
        newsList.add(0, content);
        
        // 갱신된 리스트를 다시 application 영역에 저장
        application.setAttribute("quickNewsList", newsList);
    }

    // 돌아갈 URL 방어 코드
    if (returnUrl == null || returnUrl.isEmpty()) {
        returnUrl = "index.jsp";
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>등록 처리</title>
</head>
<body>
    <script>
        // 4. 알림창 출력 및 페이지 이동
        alert("한줄 뉴스가 성공적으로 등록되었습니다!");
        location.href = '<%= returnUrl %>'; 
    </script>
</body>
</html>