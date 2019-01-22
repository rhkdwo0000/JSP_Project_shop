<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<%
	String email = request.getParameter("emailName");
%>
		<article class="wrap">
			<h2>비 밀 번 호 찾 기</h2>
			<section class="k_myPage">
				<p>
					회원가입 시, 입력하신 회원정보 또는 본인인증으로 아이디와 비밀번호를 확인할 수 있습니다.<br>
					아이디와 비밀번호는 가입 시 적어주신 이메일로 보내드립니다.
				</p>
				
				<b>
					임시비밀번호가 전송 되었습니다.
				</b>
					<button onclick="location.href='/shop/member/login.jsp'">로그인</button>
			</section>
		</article>
	</body>
</html>