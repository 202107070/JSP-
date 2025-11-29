<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    // 1. 요청 인코딩 설정 (한글 깨짐 방지)
    // JSP API: request 객체의 setCharacterEncoding 메소드를 사용하여 요청 데이터 인코딩 설정
    request.setCharacterEncoding("UTF-8");

    // 2. 파라미터 받기
    // JSP API: request.getParameter()를 사용하여 form 태그의 입력값을 수신
    String content = request.getParameter("quickContent");
    String returnUrl = request.getParameter("returnUrl"); // 돌아갈 페이지 주소

    // 유효성 검사 (내용이 없으면 저장하지 않음)
    if (content != null && !content.trim().isEmpty()) {
        
        // 3. Application 영역을 사용한 데이터 공유 (DB 대용)
        // JSP API: application 객체는 서버가 실행되는 동안 모든 사용자가 공유하는 전역 객체입니다.
        // getAttribute()를 사용하여 저장된 뉴스 리스트를 가져옵니다.
        
        @SuppressWarnings("unchecked")
        List<String> newsList = (List<String>) application.getAttribute("quickNewsList");
        
        // 리스트가 없으면 새로 생성 (서버 켜지고 첫 등록일 때)
        if (newsList == null) {
            newsList = new ArrayList<String>();
        }
        
        // 리스트의 맨 앞(0번 인덱스)에 최신 글 추가
        newsList.add(0, content);
        
        // 갱신된 리스트를 다시 application 영역에 저장
        // JSP API: setAttribute()를 사용하여 갱신된 리스트를 서버 메모리에 저장하여 공유
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