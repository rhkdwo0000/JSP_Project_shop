<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="DAODTO.BasketDTO"%>
<%@page import="DAODTO.BasketDAO"%>
<%@page import="java.util.ArrayList"%>

<%request.setCharacterEncoding("UTF-8");%>

<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<!-- 장바구니 정보 가져오기-->
<jsp:useBean id="basketdto" class="DAODTO.BasketDTO">
	<jsp:setProperty property="*" name="basketdto"/>
</jsp:useBean>

<!-- 장바구니의 선택한 상품의 num값 가져오기 -->
<script>
	$(document).ready(function(){
		$("#delete").click(function(){
			$("form").attr('action','/shop/product/basketcheck.jsp').submit();
		});
		
		$("#purchase").click(function(){
			$("form").attr('action','/shop/product/purchase.jsp').submit();
		});
	});
</script>

<%
	BasketDAO basketdao = new BasketDAO();

	/* 선택한 상품 장바구니에 넣기 */
	if(basketdto.getName() != null){
		basketdao.basketSave(basketdto);
	}
	/* 해당 아이디의 장바구니 목록 가져오기 */
	ArrayList<BasketDTO> list = basketdao.basketlist(id);	
%>
<article class="wrap">	
	<h2>장 바 구 니</h2>
	<section class="c_basket">
		<form method="post">
			
			<%
				if(list.size() == 0){
			%>
			<table>
				<tr>
					<th style="display: none;">auto increment</th>
					<th>선택</th>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>사이즈</th>
					<th>색상</th>
					<th>수량</th>
					<th>가격</th>
					<th>구매자 아이디</th>
					<th>등록일</th>
				</tr>
				<tr>
					<td colspan="10">장바구니가 비었습니다.</td>
				</tr>
			</table>
			<%}else{%>
				<table>
				<tr>
					<th style="display: none;">auto increment</th>
					<th>선택</th>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>사이즈</th>
					<th>색상</th>
					<th>수량</th>
					<th>가격</th>
					<th>구매자 아이디</th>
					<th>등록일</th>
				</tr>
				<%for(int i=list.size()-1; i>=0; i--){
					basketdto = list.get(i);
				%>
				<tr>
					<td style="display: none;"><%=basketdto.getNum()%></td>
					<td><input type="checkbox" name="check" value="<%=basketdto.getNum()%>"></td>
					<td><img src="/shop/fileUpload/<%=basketdto.getThum() %>"></td>
					<td><%=basketdto.getName() %></td>
					<td><%=basketdto.getSize() %></td>
					<td><%=basketdto.getColor() %></td>
					<td><%=basketdto.getQuantity() %></td>
					<td><%=basketdto.getPrice() %></td>
					<td><input type="hidden" name="id" value="<%=basketdto.getId() %>"><%=basketdto.getId() %></td>
					<td><%=basketdto.getToday() %></td>
				</tr>	
				<%}%>
			</table>
				<div>
					<input type="button" id="delete" value="선택항목 삭제">
					<input type="button" id="purchase" value="구매하기">
				</div>
			<%}%>
		</form>
	</section>
</article>
</body>
</html>