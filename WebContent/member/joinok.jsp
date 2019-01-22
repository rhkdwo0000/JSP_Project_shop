<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DAODTO.MemberDAO"%>
<%@ page import="DAODTO.MemberDTO"%>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("idName");
		String name = request.getParameter("nameName");
		String pw = request.getParameter("pwName");
		String email = request.getParameter("emailName");
		String tel = request.getParameter("telName");
		String addr = request.getParameter("addrName");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();

		dto.setId(id);
		dto.setAddr(addr);
		dto.setEmail(email);
		dto.setName(name);
		dto.setPw(pw);
		dto.setTel(tel);

		if (dao.joinMember(dto).equals("1")) {
			System.out.print("회원가입 성공");
			session.removeValue("tempId");
			System.out.print(session.getAttribute("tempId"));
			session.setAttribute("id", id);
			response.sendRedirect("/shop/main/index.jsp");
		}else{
			System.out.print("회원가입 실패");
		}
	%>
