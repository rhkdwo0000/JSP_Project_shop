<%@page import="DAODTO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			String id = (String)session.getAttribute("id");
			String pw = request.getParameter("k_pw");
			MemberDAO dao = new MemberDAO();
			boolean result = dao.inputPw(id, pw);
			
			if(result){					/* true = 다음페이지 */
					response.sendRedirect("/shop/member/myPage.jsp");
			}else{%>			<!-- false = 경고문 +이전페이지 -->		
				<script>
					alert("비밀번호를 확인해주세요");
					history.go(-1);
				</script>	
		<%
		}
		%>
</body>
</html>