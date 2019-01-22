<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8");%>

<%@page import="DAODTO.BasketDTO"%>
<%@page import="DAODTO.BasketDAO"%>

<%@page import="DAODTO.BuyListDTO"%>
<%@page import="DAODTO.BuyListDAO"%>

<%@page import="java.util.ArrayList"%>  

<%
	BasketDAO basketdao = new BasketDAO();
	BasketDTO basketdto = new BasketDTO();
	
	BuyListDTO buylistdto = new BuyListDTO();
	BuyListDAO buylistdao = new BuyListDAO();
	
	// 사용자가 입력한 배송정보
	buylistdto.setBname(request.getParameter("name"));  //수취인 이름
	buylistdto.setTel(request.getParameter("tel"));  	//연락처
	buylistdto.setAddr(request.getParameter("addr"));   //배송지
	buylistdto.setPay(request.getParameter("pay"));	    //결제수단
	buylistdto.setMemo(request.getParameter("memo"));	//배송메모
	buylistdto.setTotal(Integer.parseInt(request.getParameter("total")));	//결제금액
	
	/* 장바구니에서 구매를 선택한 제품의 번호값 가져오기 */
	String num[] = request.getParameterValues("num");
	
	if(num != null){
		for(int i=0; i<num.length; i++){
			//구매한 상품의 정보
			ArrayList<BasketDTO> list = new ArrayList<>();
			list = basketdao.basketinfo(num[i]);
			basketdto = list.get(0);
			buylistdto.setThum(basketdto.getThum());
			buylistdto.setPname(basketdto.getName());
			buylistdto.setSize(basketdto.getSize());
			buylistdto.setColor(basketdto.getColor());
			buylistdto.setQuantity(basketdto.getQuantity());
			buylistdto.setId(basketdto.getId());
			buylistdto.setToday(basketdto.getToday());
			
			boolean result = buylistdao.buylistsave(buylistdto);
			if(result){%>
				<script>
					alert("상품 주문이 완료되었습니다. 구매해 주셔서 감사합니다.");
					location.href="/shop/main/index.jsp";
				</script>
			<%}else{%>
				<script>
					alert("상품 주문이 실패되었습니다.");
					history.back();
				</script>
			<%}
		}	
	}
%>
