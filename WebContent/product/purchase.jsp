<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="DAODTO.BasketDTO"%>
<%@page import="DAODTO.BasketDAO"%>
<%@page import="java.util.ArrayList"%>
   
<%request.setCharacterEncoding("UTF-8");%>
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>


<script>
	$(document).ready(function(){
		$("form [name = purchase]").click(function(){
			var check1 = false;
			var check2 = false;
			var check3 = false;
			var check4 = false;
			
			if($("form [name=name]").val().length == 0){
				$(".nameerr").slideDown();
			}else{
				$(".nameerr").slideUp();
				check1 = true;
			}
			
			if($("form [name=tel]").val().length == 0){
				$(".telerr").slideDown();
			}else{
				$(".telerr").slideUp();
				check2 = true;
			}
			
			if($("form [name=addr]").val().length == 0){
				$(".addrerr").slideDown();
			}else{
				$(".addrerr").slideUp();
				check3 = true;
			}
			
			if($("form [name=pay]").val().length == 0){
				$(".payerr").slideDown();
				
			}else{
				console.log($("form [name=payr]").val());
				$(".payerr").slideUp();
				check4 = true;
				
			}
			

			if(check1 && check2 && check3 && check4){
				$("form").submit();
			}
		});
		
		//입력완료되면 에러창 없애기
		$('input').not($('#purchase')).focus(function(){
			$('input').not($('#purchase')).each(function(){
				if($(this).val().length !=0){
					$(this).siblings('.err').slideUp();
				}
			});
		});

		$('select').click(function(){
			$('input').not($('#purchase')).each(function(){
				if($(this).val().length !=0){
					$(this).siblings('.err').slideUp();
				}
			});
		});
		
	});
</script>


<article class="wrap">
	<h2>구 매 하 기</h2>
	<form method="post" name="p" action="/shop/product/purchasecheck.jsp">
	<section class="c_purchase">
		<table>
			<tr>
				<th style="display: none;">auto increment</th>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>사이즈</th>
				<th>색상</th>
				<th>수량</th>
				<th>가격</th>
				<th>구매자 아이디</th>
				<th>등록일</th>
			</tr>
			<%	int total = 0;
			  	String check[] = request.getParameterValues("check");
			  	if(check == null){
			  	%>
			  												<!-- 상품상세설명에서 구매하기 버튼 클릭 -->
				<jsp:useBean id="basketdto" class="DAODTO.BasketDTO">
					<jsp:setProperty property="*" name="basketdto"/>
				</jsp:useBean>
			<tr>
				<td style="display: none;" ><input type="checkbox" name="num" value="true" checked="checked">increment</td>
				<td><img src="/shop/fileUpload/<%=basketdto.getThum() %>"></td>
				<td><%=basketdto.getName() %></td>
				<td><%=basketdto.getSize() %></td>
				<td><%=basketdto.getColor() %></td>
				<td><%=basketdto.getQuantity() %></td>
				<td><%=basketdto.getPrice()*basketdto.getQuantity() %></td>
				<td><input type="hidden" name="id" value="<%=basketdto.getId() %>"><%=basketdto.getId() %></td>
				<td><%=basketdto.getToday() %></td>
			</tr>
		
			<%	total = basketdto.getPrice()*basketdto.getQuantity();
				}else{ 																/* 장바구니에서 구매하기 버튼 클릭시 */
					String id2 = request.getParameter("id");
					String sql="";
					for(int i=0; i<check.length; i++){
						if(i == check.length-1){
							sql = sql + "num='" + check[i] +"'";
						}else{
							sql = sql + "num='" +check[i] +"' or ";
						}
					}
		
					/* 상품번호로 선택한 값 가져오기  */
					BasketDAO basketdao = new BasketDAO();
					BasketDTO basketdto = new BasketDTO();
					
					ArrayList<BasketDTO> list = basketdao.purchaselist1(id2,sql);
					
					for(int i=0; i<list.size();i++){
						basketdto = list.get(i); 
			%>
					<tr>
						<td style="display:none;"><input type="checkbox" name="num" value="<%=basketdto.getNum()%>" checked="checked"></td>
						<td><img src="/shop/fileUpload/<%=basketdto.getThum() %>"></td>
						<td><%=basketdto.getName() %></td>
						<td><%=basketdto.getSize() %></td>
						<td><%=basketdto.getColor() %></td>
						<td><%=basketdto.getQuantity() %></td>
						<td><%=basketdto.getPrice()*basketdto.getQuantity() %></td>
						<td><input type="hidden" name="id" value="<%=basketdto.getId() %>"><%=basketdto.getId() %></td>
						<td><%=basketdto.getToday() %></td>	
					</tr>
		<% total = total + (basketdto.getPrice()*basketdto.getQuantity());
				}
			}%>
	</table>
	
	<div>
		<h3>합 계</h3>
		<b><input type="hidden" name="total" value="<%=total %>"><%=total %>원</b>
	</div>
	</section>
	
	
	<section class="c_purchaseinfo">
		
		<h2>배 송 정 보</h2>
		<table>
			<tr>
				<th>수취인 이름</th>
				<td>
					<input type="text" name="name">
					<span class="nameerr err">수취인 이름은 필수 입력사항 입니다.</span>
				</td>
				<th>수취인 연락처</th>
				<td>
					<input type="text" name="tel">
					<span class="telerr err">수취인 연락처 필수 입력사항 입니다.</span>
				</td>
			</tr>
			<tr>
				<th>배송지 주소</th>
				<td>
					<input type="text" name="addr">
					<span class="addrerr err">배송지를 입력하세요</span>
				</td>
				
				<th>결제 수단 선택</th>
				<td>
					<select name="pay">
						<option>카드결제</option>
						<option>가상계좌</option>
						<option>실시간 계좌이체</option>
						<option>휴대폰 결제</option>
						<option>카카오페이</option>
					</select>
					<span class="payerr err">결제수단을 선택하세요.</span>
				</td>
			</tr>
			<tr>
				<th>배송메모</th>
				<td colspan="3">
					<textarea style="resize:none;" name="memo"></textarea>
				</td>
			</tr>
		</table>
		<div>
			<input type="reset" value="초기화">
			<input type="button" name="purchase" value="구매하기" id="">
		</div>
		
	</section>
	</form>
</article>

</body>
</html>