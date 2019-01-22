<%@page import="DAODTO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
	</head>
	<body>
		<%
			/* 회원탈퇴처리과정페이지 */	
			String id =(String)session.getAttribute("id");	//현재 등록되어있는 세션아이디 호출
			MemberDAO dao = new MemberDAO();
			dao.secession(id);
			/* 회원탈퇴완료 */
			session.invalidate();
			/* 세션OUT */
			response.sendRedirect("/shop/main/index.jsp");
		%>
	
	</body>
</html>