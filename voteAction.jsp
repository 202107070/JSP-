<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // 1. 투표 데이터 받기
    String votedGame = request.getParameter("weekend_game");
    
    // 2. 세션에 투표 기록 저장 (중복 투표 방지용, 간단 구현)
    String hasVoted = (String) session.getAttribute("hasVoted_weekend");
    
    // 3. application 스코프에 전체 투표 결과를 저장할 맵 가져오기
    @SuppressWarnings("unchecked")
    Map<String, Integer> pollResults = (Map<String, Integer>) application.getAttribute("pollResults_weekend");
    
    if (pollResults == null) {
        pollResults = new HashMap<>();
        application.setAttribute("pollResults_weekend", pollResults);
    }
    
    // 4. 로직 실행
    if (votedGame != null && hasVoted == null) {
        // 첫 투표일 경우
        int currentCount = pollResults.getOrDefault(votedGame, 0);
        pollResults.put(votedGame, currentCount + 1);
        
        session.setAttribute("hasVoted_weekend", "true"); // 투표 완료 표시
        
        out.println("<script>");
        out.println("alert('투표가 완료되었습니다! 결과 보기를 확인해주세요.');");
        out.println("location.href = 'index.jsp';");
        out.println("</script>");
        
    } else if (hasVoted != null) {
        // 이미 투표했을 경우
        out.println("<script>");
        out.println("alert('이미 투표에 참여하셨습니다.');");
        out.println("location.href = 'index.jsp';");
        out.println("</script>");
    } else {
        // 비정상 접근 (투표 항목 선택 안 함)
        out.println("<script>");
        out.println("alert('투표 항목을 선택해주세요.');");
        out.println("history.back();");
        out.println("</script>");
    }
%>