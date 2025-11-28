<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
		String user_name = request.getParameter("name");
		String user_phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
		String user_email = request.getParameter("email");	
		
		if(user_id.equals("admin") && user_pw.equals("1234") && user_name.equals("홍길동")
				&& user_phone.equals("010-1234-5678") && user_email.equals("abcde@yuhan.ac.kr"))
		{
			session.setAttribute("userID", user_id);
			session.setAttribute("userPW", user_pw);
			session.setAttribute("userNAME", user_name);
			session.setAttribute("userPHONE", user_phone);
			session.setAttribute("userEMAIL", user_email);
			out.println("<script>alert('yuven 회원이 되신걸 환영합니다.');");
			out.println("location.href = 'index.jsp';</script>");
		}
		else
		{
			out.println("<script>alert('입력란을 확인해주세요')</script>");
		}
	%>