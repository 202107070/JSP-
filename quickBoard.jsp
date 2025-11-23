<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    // application 영역에서 저장된 뉴스 리스트 가져오기
    // ⭐️ 수정됨: Type safety 경고 무시 어노테이션 추가
    @SuppressWarnings("unchecked")
    List<String> loadedList = (List<String>) application.getAttribute("quickNewsList");
    
    // 리스트가 아직 없으면 빈 리스트로 초기화 (NullPointerException 방지)
    if (loadedList == null) {
        loadedList = new ArrayList<String>();
    }
%>

<style>
    /* 한줄 뉴스 배너 스타일 */
    .quick-board-container {
        background-color: #fff;
        border: 1px solid #3498db; /* 브랜드 컬러 */
        border-radius: 8px;
        padding: 20px;
        margin-top: 30px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.05);
    }
    .quick-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
        border-bottom: 2px solid #eee;
        padding-bottom: 10px;
    }
    .quick-header h3 { margin: 0; color: #2c3e50; font-size: 18px; }
    
    /* 입력 폼 스타일 */
    .quick-form {
        display: flex;
        gap: 10px;
        margin-bottom: 20px;
    }
    .quick-input {
        flex: 1;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }
    .quick-btn {
        background-color: #3498db;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
        transition: background 0.2s;
    }
    .quick-btn:hover { background-color: #2980b9; }

    /* 리스트 스타일 */
    .quick-list {
        list-style: none;
        padding: 0;
        margin: 0;
        max-height: 200px; /* 너무 길어지면 스크롤 */
        overflow-y: auto;
    }
    .quick-item {
        padding: 8px 10px;
        border-bottom: 1px solid #f1f1f1;
        font-size: 14px;
        display: flex;
        align-items: center;
    }
    .quick-item:before {
        content: "📢";
        margin-right: 8px;
    }
    .quick-item:last-child { border-bottom: none; }
    .empty-msg { color: #999; text-align: center; padding: 10px; font-size: 13px; }
</style>

<div class="quick-board-container">
    <div class="quick-header">
        <h3>📢 실시간 한줄 뉴스</h3>
        <span style="font-size: 12px; color: #888;">유저들이 직접 만드는 뉴스</span>
    </div>

    <!-- 글쓰기 폼 -->
    <form action="writeAction.jsp" method="post" class="quick-form">
        <!-- 현재 페이지 URL을 숨겨서 보냄 (작성 후 여기로 돌아오기 위해) -->
        <input type="hidden" name="returnUrl" value="<%= request.getRequestURI() %>">
        <input type="text" name="quickContent" class="quick-input" placeholder="새로운 소식을 공유해주세요! (예: 손흥민 골!)" required>
        <button type="submit" class="quick-btn">등록</button>
    </form>

    <!-- 글 목록 배너 -->
    <div class="quick-list-area">
        <ul class="quick-list">
            <% 
                if (loadedList.isEmpty()) { 
            %>
                <li class="empty-msg">등록된 한줄 뉴스가 없습니다. 첫 소식을 알려주세요!</li>
            <% 
                } else {
                    // 최대 10개까지만 보여주기
                    int limit = loadedList.size() > 10 ? 10 : loadedList.size();
                    for (int i = 0; i < limit; i++) {
            %>
                <li class="quick-item"><%= loadedList.get(i) %></li>
            <% 
                    }
                } 
            %>
        </ul>
    </div>
</div>