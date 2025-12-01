<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 왼쪽 사이드 -->
<script type="text/javascript">
	//⭐️ 1. 게임 투표 처리 함수 ⭐️
	function handleGameVote(event, form) {
		event.preventDefault();

		var selected = form.querySelector('input[name="weekend_game"]:checked');
		if (!selected) {
			alert('플레이할 게임을 선택해주세요!');
			return;
		}

		// (실제 서버 처리 로직은 생략하고, 성공했다고 가정)

		form.style.display = 'none'; // 폼을 즉시 숨기고
		showGameResults('game-poll-results'); // 즉시 결과 표시 함수 호출
	}

	// ⭐️ 2. 결과 표시 함수 (즉시 실행) ⭐️
	function showGameResults(elementId) {
		var resultDiv = document.getElementById(elementId);
		resultDiv.style.display = 'block'; // 결과를 즉시 보이게 설정
	}

	// ⭐️ 3. 결과 숨기기 함수 (즉시 실행) ⭐️
	function hideGameResults(elementId) {
		var resultDiv = document.getElementById(elementId);
		resultDiv.style.display = 'none'; // 즉시 숨김
		document.gameVoteForm.style.display = 'block'; // 폼 즉시 복구
	}

	// ⭐️ 4. 영화 투표/결과 보기 토글 함수 ⭐️
	function toggleResults(elementId) {
		var resultDiv = document.getElementById(elementId);

		// 현재 display 상태를 확인합니다.
		if (resultDiv.style.display === 'none'
				|| resultDiv.style.display === '') {
			// 숨겨져 있으면 보이게 합니다.
			resultDiv.style.display = 'block';
		} else {
			// 보이고 있으면 다시 숨깁니다.
			resultDiv.style.display = 'none';
		}
	}
</script>
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
		<form name="gameVoteForm" onsubmit="handleGameVote(event, this)">
			<p>
				<strong>이번 주말 플레이할 게임은?</strong>
			</p>
			<div id="game-poll-options" style="margin-bottom: 10px;">
				<input type="radio" id="vote1" name="weekend_game" value="valorant"
					required> <label for="vote1">발로란트</label><br> <input
					type="radio" id="vote2" name="weekend_game" value="starfield">
				<label for="vote2">스타필드</label><br> <input type="radio"
					id="vote3" name="weekend_game" value="indie"> <labelforvote3">신작
					인디게임</label>
			</div>
			<button type="button" onclick="handleGameVote(event, this.form)"
				style="width: 100%; padding: 8px; background: #2ecc71; color: white; border: none; border-radius: 4px;">
				투표 참여</button>
		</form>

		<div id="game-poll-results"
			style="display: none; margin-top: 10px; font-size: 14px;">
			<hr style="margin: 15px 0;">
			<p>
				<strong>🔥 실시간 투표 결과</strong>
			</p>
			<ul style="list-style: disc; padding-left: 20px;">
				<li>발로란트: 50% (35명)</li>
				<li>스타필드: 30% (21명)</li>
				<li>신작 인디게임: 20% (14명)</li>
			</ul>
			<a href="javascript:void(0)"
				onclick="hideGameResults('game-poll-results')"
				style="font-size: 12px; color: #3498db; cursor: pointer; display: block; text-align: center; margin-top: 10px;">
				[결과 숨기기] </a>
		</div>
		<hr style="margin: 15px 0;">
		<p>
			<strong>올해의 기대작 영화 TOP 3는?</strong> (총 125명 참여)
		</p>
		<a href="javascript:void(0)"
			onclick="toggleResults('movie-poll-results')"
			style="font-size: 12px; color: #3498db; cursor: pointer;"> [결과
			보기] </a>

		<div id="movie-poll-results"
			style="display: none; margin-top: 10px; font-size: 14px;">
			<ul style="list-style: none; padding: 0;">
				<li style="margin-bottom: 5px;">1위: 퓨리오사 (40%)</li>
				<li style="margin-bottom: 5px;">2위: 미션 임파서블 8 (35%)</li>
				<li style="margin-bottom: 5px;">3위: 아바타 3 (25%)</li>
			</ul>
		</div>
	</div>
	<div class="section">
		<h2>🔥 주간 HOT 키워드</h2>
		<div style="font-size: 14px; line-height: 2.2; padding: 5px;">
			<a
				href="https://www.bing.com/videos/riverview/relatedvideo?q=%ec%95%84%ec%9d%b4%ec%9c%a0+%ec%8b%a0%ea%b3%a1&qs=n&sp=-1&ghc=1&lq=0&pq=%ec%95%84%ec%9d%b4%ec%9c%a0+%ec%8b%a0%ea%b3%a1&sc=8-6&sk=&cvid=CA0746040D8E4D00A4536CE7792879CF&ajaxnorecss=1&sid=075BB83B3DEF66901A93AE983C98671E&jsoncbid=0&ajaxsydconv=1&ru=%2fsearch%3fq%3d%25EC%2595%2584%25EC%259D%25B4%25EC%259C%25A0%2520%25EC%258B%25A0%25EA%25B3%25A1%26qs%3dn%26form%3dQBRE%26sp%3d-1%26ghc%3d1%26lq%3d0%26pq%3d%25EC%2595%2584%25EC%259D%25B4%25EC%259C%25A0%2520%25EC%258B%25A0%25EA%25B3%25A1%26sc%3d8-6%26sk%3d%26cvid%3dCA0746040D8E4D00A4536CE7792879CF%26ajaxnorecss%3d1%26sid%3d075BB83B3DEF66901A93AE983C98671E%26format%3dsnrjson%26jsoncbid%3d0%26ajaxsydconv%3d1&mmscn=vwrc&mid=7CAF855F10D66EEA3B407CAF855F10D66EEA3B40&FORM=WRVORC&ntb=1&msockid=3665e96ec05611f09263c28199dfaed9"
				style="color: #e74c3c; font-weight: bold;">#아이유신곡</a> <a
				href="https://www.gamemeca.com/view.php?gid=1752312"
				style="color: #3498db; margin-left: 10px;">#스타필드확장팩</a><br> <a
				href="https://about.netflix.com/ko/new-to-watch"
				style="color: #2c3e50;">#넷플릭스신작</a> <a
				href="https://www.pcbang.com/_picaNews/syncPatch_list.jsp"
				style="color: #e67e22; margin-left: 10px;">#PC방패치</a>
		</div>
	</div>
</div>