<%@page import="DAODTO.MemberDAO"%>
<%@page import="DAODTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<%				
			/* 회원수정페이지 */					
			String name = request.getParameter("k_name");		/* 아이디는변경불가 */
			String id = request.getParameter("k_id");
			String pw = request.getParameter("k_pw");			/* 비밀번호가 일치해야함  */
			String repw = request.getParameter("k_repw");
			String email = request.getParameter("k_email");
			String tel = request.getParameter("k_tel");
			String addr = request.getParameter("k_addr");
			
			MemberDTO dto = new MemberDTO();
			MemberDAO dao = new MemberDAO();
			
			dto.setName(name);
			dto.setPw(pw);
			dto.setTel(tel);
			dto.setEmail(email);
			dto.setAddr(addr);
			dto.setId(id);										// >> id 변동불가.
			dao.update(dto);
			
			/* 메소드로정보수정후,페이지이동 */
			response.sendRedirect("/shop/main/index.jsp");
		%>
