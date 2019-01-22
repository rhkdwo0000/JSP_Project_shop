<%@page import="javax.tools.DocumentationTool.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<article class="wrap">
	<h2>마 이 페 이 지</h2>
	<section class="c_mypagepw">
		<p>마이페이지로 이동 전 비밀번호를 입력해 주세요.</p>
		<form action="/shop/member/passwordInputProcess.jsp">
			<input type="password" name="k_pw">
			<input type="submit" value="입력">
		</form>
	</section>
	
</article>
</body>
</html>