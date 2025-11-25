<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 왼쪽 사이드 -->
<div class="left-sidebar">
	<div class="section">
		<h2>최신 뉴스</h2>
		<p>🎮 발로란트 신규 패치 업데이트</p>
		<p>🎵 새벽 감성 플레이리스트 추천</p>
		<p>🎬 듄: 파트2 리뷰</p>
	</div>
	<div class="section">
		<h2>📢 공지 사항</h2>
		<p>사이트 이용 약관 개정 안내</p>
		<p>새로운 이벤트 당첨자 발표!</p>
	</div>
	<div class="section">
		<h2>🔥 오늘의 BEST</h2>
		<p>🔥 지금 가장 핫한 PC 게임 Top 5</p>
		<p>🎥 이번 주말 추천 영화</p>
	</div>
	<div class="section">
		<h2>📅 주요 일정</h2>
		<p>✔️ [음악] NewJeans 컴백 D-7</p>
		<p>✔️ [영화] 다음 주 개봉작</p>
	</div>
	<div class="section">
		<h2>📊 주간 투표</h2>
		<form action="voteAction.jsp" method="post">
			<p>
				<strong>이번 주말 플레이할 게임은?</strong>
			</p>
			<div style="margin-bottom: 10px;">
				<input type="radio" id="vote1" name="weekend_game" value="valorant"
					required> <label for="vote1">발로란트</label><br> <input
					type="radio" id="vote2" name="weekend_game" value="starfield">
				<label for="vote2">스타필드</label><br> <input type="radio"
					id="vote3" name="weekend_game" value="indie"> <label
					for="vote3">신작 인디게임</label>
			</div>
			<button type="submit"
				style="width: 100%; padding: 8px; background: #2ecc71; color: white; border: none; border-radius: 4px;">투표
				참여</button>
		</form>
		<hr style="margin: 15px 0;">
		<p>
			<strong>올해의 기대작 영화 TOP 3는?</strong> (총 125명 참여)
		</p>
		<div style="font-size: 12px; color: #555;">[결과 보기]</div>
	</div>
	<div class="section">
    <h2>🔥 주간 HOT 키워드</h2>
    <div style="font-size: 14px; line-height: 2.2; padding: 5px;">
        <a href="search.jsp?q=%23아이유신곡" style="color: #e74c3c; font-weight: bold;">#아이유신곡</a>
        <a href="search.jsp?q=%23스타필드확장팩" style="color: #3498db; margin-left: 10px;">#스타필드확장팩</a><br>
        <a href="search.jsp?q=%23넷플릭스신작" style="color: #2c3e50;">#넷플릭스신작</a>
        <a href="search.jsp?q=%23PC방패치" style="color: #e67e22; margin-left: 10px;">#PC방패치</a>
    </div>
</div>
</div>