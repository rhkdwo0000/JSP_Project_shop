<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DAODTO.MemberDAO"%>    
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
		
	MemberDAO memberdao = new MemberDAO();
	if(pw.equals(memberdao.loginMember(id))){	/* 로그인완료  */
	session.setAttribute("id",id);%>
	<script type="text/javascript">
		alert("로그인성공");
		location.href="/shop/main/index.jsp";
	</script>
<%	}else{%>
	<script type="text/javascript">
		alert("로그인실패");
		history.back();
	</script>	
<%	}%>
