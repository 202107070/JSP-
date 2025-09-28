<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>로그인 - GameLinks</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    :root{
      --bg:#f7f7f7; /* 약간 연한 흰색 배경 */
      --panel:#ffffff;
      --muted:#666;
      --text:#111;
      --brand:#3cc3ff;
      --line:#ddd;
      --danger:#ff6b6b;
    }
    *{box-sizing:border-box;}
    html,body{margin:0;padding:0;height:100%;font-family:Pretendard,system-ui,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;background:var(--bg);color:var(--text);}
    a{color:var(--brand);text-decoration:none;}
    .wrap{display:flex;flex-direction:column;align-items:center;justify-content:center;height:100%;padding:20px;}
    .login-card{background:var(--panel);border:1px solid var(--line);border-radius:20px;padding:40px;max-width:400px;width:100%;box-shadow:0 4px 20px rgba(0,0,0,0.08);}
    .logo{text-align:center;font-size:28px;font-weight:800;margin-bottom:20px;}
    .logo .dot{color:var(--brand);}
    .login-card h1{margin:0 0 20px;text-align:center;font-size:22px;}
    form{display:flex;flex-direction:column;gap:16px;}
    input[type="text"],input[type="password"]{padding:12px 14px;border-radius:12px;border:1px solid var(--line);background:#fff;color:var(--text);font-size:15px;}
    input[type="text"]:focus,input[type="password"]:focus{outline:none;border-color:var(--brand);}
    button{padding:12px;border-radius:12px;background:var(--brand);border:none;font-weight:600;font-size:16px;color:#000;cursor:pointer;transition:0.2s;}
    button:hover{filter:brightness(1.1);}
    .options{display:flex;justify-content:space-between;align-items:center;font-size:13px;color:var(--muted);}
    .options label{display:flex;align-items:center;gap:4px;}
    .divider{margin:20px 0;text-align:center;position:relative;color:var(--muted);font-size:13px;}
    .divider::before,.divider::after{content:"";position:absolute;top:50%;width:40%;height:1px;background:var(--line);} 
    .divider::before{left:0;} .divider::after{right:0;}
    .social{display:flex;flex-direction:column;gap:10px;}
    .social button{display:flex;align-items:center;gap:8px;justify-content:center;font-size:15px;}
    .social .google{background:#fff;color:#000;border:1px solid #ddd;}
    .social .naver{background:#03c75a;color:#fff;}
    .social .kakao{background:#fee500;color:#000;}
    .footer{text-align:center;margin-top:20px;font-size:13px;color:var(--muted);}
  </style>
</head>
<body>
<div class="wrap">
  <div class="login-card">
    <div class="logo">GameLinks<span class="dot">.</span></div>
    <h1>로그인</h1>
    
    <form action="login.jsp" method="post">
      <input type="text" name="username" placeholder="아이디 또는 이메일" required />
      <input type="password" name="password" placeholder="비밀번호" required />
      
      <div class="options">
        <label><input type="checkbox" name="remember" /> 로그인 유지</label>
        <a href="/forgot">비밀번호 찾기</a>
      </div>
      
      <button type="submit">로그인</button>
    </form>

    <div class="divider">또는</div>

    <div class="social">
      <button type="button" class="google">구글 계정으로 로그인</button>
      <button type="button" class="naver">네이버 계정으로 로그인</button>
      <button type="button" class="kakao">카카오 계정으로 로그인</button>
    </div>

    <div class="footer">
      계정이 없으신가요? <a href="register.jsp">회원가입</a>
    </div>
  </div>
</div>

<%
    // POST 요청 시 처리
    if(request.getMethod().equalsIgnoreCase("POST")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 예시: 아이디와 비밀번호가 "user"이면 로그인 성공
        if("user".equals(username) && "user".equals(password)) {
            session.setAttribute("username", username);
            response.sendRedirect("menu.jsp"); // 로그인 성공 → menu.jsp
        } else {
            out.println("<script>alert('아이디 또는 비밀번호가 잘못되었습니다.');</script>");
        }
    }
%>
</body>
</html>