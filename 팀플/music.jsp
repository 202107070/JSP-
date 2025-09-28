<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>음악 - 문화 취미 커뮤니티</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container">
        <div class="main">
            <h2>🎵 음악 소식</h2>
            <div class="news-list">
                <div class="news-item">
                    <img src="https://i.imgur.com/vu2S1pQ.jpeg" alt="음악 이미지">
                    <div>
                        <h4>[아이유] 신곡 발매</h4>
                        <p>감성 발라드 신곡이 공개되었습니다!</p>
                    </div>
                </div>
                <div class="news-item">
                    <img src="https://i.imgur.com/xUAZQCd.jpeg" alt="음악 이미지">
                    <div>
                        <h4>[방탄소년단] 컴백 예고</h4>
                        <p>전 세계 팬들이 기다리던 앨범 발표!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
