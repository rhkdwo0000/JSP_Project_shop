<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>
	
		<article class="wrap">
			<h2>마이페이지 메인</h2>
				<hr width="500">
				<hr width="500">
			<table class="k_SelectTable">
				<tr>
					<td>
						<button class="k_SelectButton"onclick="location='/shop/member/passwordInput.jsp'">
							MYINFO<br>
							<hr width="100"><br>
							회원이신 고객님의<br>
							개인정보를 관리하는<br> 
							공간입니다.<br>
						</button>
					</td>
				</tr>
				<tr>
					<td>
						<button class="k_SelectButton"onclick="location='/shop/board/personReview.jsp'">
							BORDER<br>
							<hr width="100"><br>
							고객님께서 작성하신<br>
							게시물을 관리하는 공간으로<br>
							작성하신 글을<br>
							한눈에 관리하실 수 있습니다.
						</button>
					</td>
				</tr>
			</table>
				
				
		
		</article>
	</body>
</html>