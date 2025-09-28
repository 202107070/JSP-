<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>회원가입 - GameLinks</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    :root{
      --bg:#f7f7f7;
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
    .card{background:var(--panel);border:1px solid var(--line);border-radius:20px;padding:40px;max-width:400px;width:100%;box-shadow:0 4px 20px rgba(0,0,0,0.08);}
    .logo{text-align:center;font-size:28px;font-weight:800;margin-bottom:20px;}
    .logo .dot{color:var(--brand);}
    h1{margin:0 0 20px;text-align:center;font-size:22px;}
    form{display:flex;flex-direction:column;gap:16px;}
    input[type="text"], input[type="email"], input[type="password"]{padding:12px 14px;border-radius:12px;border:1px solid var(--line);background:#fff;color:var(--text);font-size:15px;}
    input:focus{outline:none;border-color:var(--brand);}
    button{padding:12px;border-radius:12px;background:var(--brand);border:none;font-weight:600;font-size:16px;color:#000;cursor:pointer;transition:0.2s;}
    button:hover{filter:brightness(1.1);}
    .options{text-align:center;font-size:13px;color:var(--muted);}
  </style>
</head>
<body>
<div class="wrap">
  <div class="card">
    <div class="logo">YuhanGames<span class="dot">.</span></div>
    <h1>회원가입</h1>
    
    <form action="/auth/register" method="post">
      <input type="text" name="username" placeholder="아이디" required />
      <input type="email" name="email" placeholder="이메일" required />
      <input type="password" name="password" placeholder="비밀번호" required />
      <input type="password" name="passwordConfirm" placeholder="비밀번호 확인" required />
      <button type="submit">회원가입</button>
    </form>

    <div class="options">
      이미 계정이 있으신가요? <a href="login.jsp">로그인</a>
    </div>
  </div>
</div>

<%
    if(request.getMethod().equalsIgnoreCase("POST")) {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordConfirm");

        if(!password.equals(passwordConfirm)) {
            out.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
        } else {
            // 🔹 간단 예시: 회원가입 완료 → 세션에 저장
            session.setAttribute("username", username);
            
            // 가입 후 바로 menu.jsp로 이동
            response.sendRedirect("menu.jsp");
        }
    }
%>
</body>
</html>
