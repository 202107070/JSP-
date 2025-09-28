@WebServlet("/auth/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 예시: DB 확인 대신 하드코딩
        if("user".equals(username) && "1234".equals(password)) {
            // 로그인 성공
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            // menu.jsp로 리다이렉트
            response.sendRedirect("menu.jsp");
        } else {
            // 로그인 실패 → 다시 login.jsp로
            request.setAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
