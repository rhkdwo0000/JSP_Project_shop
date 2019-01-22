<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DAODTO.MemberDAO"%>
<%@ page import="DAODTO.MemberDTO"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.print("도착");
	String id = request.getParameter("idName");
	MemberDAO dao = new MemberDAO();
	if (dao.idCheck(id)==null) {
	  System.out.print("if도착");
	request.setAttribute("tempId", id);
%>

<jsp:forward page="join.jsp"></jsp:forward>
<%
	} else {
%>

<script>
	alert("사용중인 아이디입니다.");
	history.go(-1);
</script>
<%}%>