<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<%@page import="DAODTO.AdminBoardComDTO"%>
<%@page import="DAODTO.AdminBoardComDAO"%>

<%	
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>	
	
<jsp:useBean id="adminboardcomdto" class="DAODTO.AdminBoardComDTO">
<jsp:setProperty name="adminboardcomdto" property="*"/>
</jsp:useBean>
<%
	AdminBoardComDAO adminboardcomdao = new AdminBoardComDAO();
	
	boolean result = adminboardcomdao.adminboardcom(adminboardcomdto);	
	if(result){%>
		<script>
			alert("댓글이 등록 되었습니다.");
			location.href=("/shop/board/adminboardview.jsp?num=<%=adminboardcomdto.getNum()%>");
		</script>
<%}else{%>
	<script>
		alert("댓글이 등록이 실패 되었습니다.");
		history.back();
	</script>
<%}%>

