<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="DAODTO.BasketDTO"%>
<%@page import="DAODTO.BasketDAO"%>    
      
<%
	String delete[] = request.getParameterValues("check");
	String id = request.getParameter("id");
	String sql = "";
	
	/* 선택한 상품의 번호 가져오기 */
	if(delete == null){%>
		<script>
			alert("상품을 선택하세요.");
			history.back();
		</script>
	<%}else{
		for(int i=0; i<delete.length; i++){
			if(i == delete.length-1){
				sql = sql + "num='" + delete[i] +"'";
			}else{
				sql = sql + "num='" +delete[i] +"' or ";
			}
		}
		/* 선택 상품 삭제하기 */
		BasketDAO basketdao = new BasketDAO();
		boolean result = basketdao.basketdel(id , sql);
		if(result){
			response.sendRedirect("/shop/product/basket.jsp");
		}
	}
	
%>    
