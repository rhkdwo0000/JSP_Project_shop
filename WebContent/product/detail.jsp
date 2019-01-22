<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="DAODTO.ProdSaveDAO"%>
<%@page import="DAODTO.ProdSaveDTO"%>


<%
	/* 쿠키구분을 위한 시간 구하기 */
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String today = formatter.format(new java.util.Date());
	
	//선택한 상품의 상품코드 넘겨 받기
	 	String code = request.getParameter("code"); 
	
	 	//상품선택시 선택한 상품 쿠키에 저장
	 			Cookie viewslist = new Cookie(today,code);
	 			viewslist.setMaxAge(30);
	 			viewslist.setPath("/");
	 			response.addCookie(viewslist);
	 	
		ProdSaveDAO prodsavedao = new ProdSaveDAO();
	 	ProdSaveDTO prodsavedto = new ProdSaveDTO();
	 	
	//상품의 기본 정보 가져오기
		prodsavedto = prodsavedao.prodinfo(code);
	 	
		String size = prodsavedto.getSize();
		String op_size[] = size.split("/");
	 	
		String color = prodsavedto.getColor();
		String op_color[] = color.split("/");	
%>

    
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<!-- 장바구니,구매하기 페이지 이동  -->
<script type="text/javascript">
	$(document).ready(function(){
		//장바구니 구매하기 버튼 클릭시 
		$('input[type=submit]').click(function(){
			if('<%=id%>' == 'null'){
				alert("로그인 후 이용이 가능합니다.");
			}else if('<%=id%>' != 'null'){
				if($(this).val() == '장바구니'){
					$("form").attr('action','/shop/product/basket.jsp').submit();
				}else if($(this).val() == '구매하기'){
					$("form").attr('action','/shop/product/purchase.jsp?code=<%=prodsavedto.getCode() %>').submit();
				}
			}
		});
		
		//수량선택 
		var increase = $('.quantity span:nth-child(4)') // + 버튼
		var decrease = $('.quantity span:nth-child(1)') // - 버튼

		$(decrease).click(function(e){
			e.preventDefault();
			var start = $(this).siblings('p').text() ;//  숫자 영역
			var num = parseInt(start,10);
			num--;

			if(num<=0){
				alert('더이상 줄일수 없습니다.');
				num =1;
				}
				$(this).siblings('p').text(num);
			});	

		$(increase).click(function(e){
			e.preventDefault();
			var stat = $(this).siblings('p').text();
			var num = parseInt(stat,10);
			num++;

			if(num>5){
				alert('더이상 늘릴수 없습니다.');
				num=5;
			}
			$(this).siblings('p').text(num);
			$(this).siblings('input').val(num);
		});
	});
</script>

<article class="wrap">
	<h2>상 품 정 보</h2>
	<section class="c_detail">
		<form method="post">
			<input type="hidden" name="id" value="<%=id %>">
			<input type="hidden" name="today" value="<%=today %>">
			<figure>
				<input type="hidden" name="thum" value="<%=prodsavedto.getThum() %>">
				<img src="/shop/fileUpload/<%=prodsavedto.getThum() %>">
				<figcaption>
					<table>
						<tr>
							<th colspan="4">상품정보</th>
						</tr>
						
						<tr>
							<th>카테고리</th>
							<td><%=prodsavedto.getCate() %></td>
							<th>상품코드</th>
							<td><%=prodsavedto.getCode() %></td>
						</tr>

						<tr>
							<th>상품명</th>
							<td colspan="3"><input type="hidden" name="name" value="<%=prodsavedto.getName() %>"><%=prodsavedto.getName() %></td>
						</tr>

						<tr>
							<th colspan="4">옵 션</th>
						</tr>

						<tr>
							<th style="width: 115px;">사이즈</th>
							<td style="width: 125px;">
								<select name="size">
										<%for(int i=1; i<op_size.length; i++){ %>
										<option>
											<%=op_size[i] %>
										</option>
										<%} %>
								</select>
							</td>

							<th style="width: 115px;">색 상</th>
							<td style="width: 215px;">
								<select name="color">
										<%for(int i=1; i<op_color.length; i++){ %>
										<option>
											<%=op_color[i] %>
										</option>
										<%} %>
								</select>
							</td>
						</tr>

						<tr>
							<th>수 량</th>
							<td colspan="3">
								<div class="quantity">
									<span>-</span>
									<input type="hidden" value="1" name =quantity>
									<p>1</p>
									<span>+</span>
								</div>
								
							</td>
						</tr>
						
						<tr>
							<th>배 송 비</th>
							<td colspan="3">2,500 원<br><span style="font-size: 11px;">(총 결제 금액이 50,000원 미만시 배송비 2,500원 이 청구 됩니다.)</span></td>
						</tr>
						
						<tr>
							<th>금 액</th>
							<td colspan="3" Style="padding:25px 0;">
								<b style="font-weight: bold; color: red; font-size: 18px;"><input type="hidden" name="price" value="<%=prodsavedto.getPrice() %>"><%=prodsavedto.getPrice() %></b>
							</td>
						</tr>
					</table>
					<input type="submit" value="장바구니" style="margin-bottom:5px;">
					<input type="submit" value="구매하기">
				</figcaption>
			</figure>
		</form>
		<%=prodsavedto.getDetail() %>
	</section>
</article>
</body>
</html>