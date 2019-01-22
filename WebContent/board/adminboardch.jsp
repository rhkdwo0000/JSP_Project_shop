<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8"); %>

<%@page import="DAODTO.AdminBoardDAO"%>      
<%@page import="DAODTO.AdminBoardDTO"%> 

<%
	AdminBoardDTO adminboarddto = new AdminBoardDTO();
	adminboarddto.setCategory(request.getParameter("category"));
	adminboarddto.setTitle(request.getParameter("title"));
	adminboarddto.setCont(request.getParameter("smartEditor"));
	adminboarddto.setDate(request.getParameter("date"));
	adminboarddto.setName(request.getParameter("name"));
	
	AdminBoardDAO adminboarddao = new AdminBoardDAO();
	boolean result = adminboarddao.adminboardsave(adminboarddto);
	if(result){%>
		<script>
			alert("게시물 등록 성공");
			location.href="/shop/admin/admin.jsp";
		</script>
	<%}else{%>
		<script>
			alert("게시물 등록 실패");
			history.back();
		</script>
	<%} %>
