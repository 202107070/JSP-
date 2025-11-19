<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // ====================================================================
    // 1. 요청 파라미터 처리 (Form Processing)
    // ====================================================================
    // 한글 데이터가 깨지지 않도록 요청 인코딩을 UTF-8로 설정
    request.setCharacterEncoding("UTF-8");

    // 폼에서 전송된 파라미터 값 받기 (JSP API 사용)
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String content = request.getParameter("content");
    // hidden 필드로부터 문의를 요청한 원래 페이지 URL을 받음
    String returnUrl = request.getParameter("returnUrl"); 
    
    // 이메일이 입력되지 않았을 경우 (선택 사항) 처리
    if (email == null || email.trim().isEmpty()) {
        email = "없음";
    }

    // 돌아갈 URL이 유효하지 않을 경우를 대비하여 기본 메인 페이지로 설정
    if (returnUrl == null || returnUrl.trim().isEmpty()) {
        returnUrl = "index.jsp";
    }
    
    // 참고: 실제 웹 애플리케이션에서는 이 시점에 문의 내용을 데이터베이스에 저장하거나 
    // 관리자 이메일로 전송하는 등의 백엔드 로직이 구현됩니다.
    // ====================================================================
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>문의 처리 결과</title>
</head>
<body>
    <script>
        // ====================================================================
        // 2. 처리 결과 알림 및 페이지 이동
        // ====================================================================
        // 문의 접수 성공 알림 (alert 사용)
        alert("<%= name %>님, 문의사항이 성공적으로 접수되었습니다. (이메일: <%= email %>)");
        
        // 문의 후 원래 페이지 URL(returnUrl)로 리다이렉트 (location.href 사용)
        location.href = '<%= returnUrl %>';
    </script>
</body>
</html>
