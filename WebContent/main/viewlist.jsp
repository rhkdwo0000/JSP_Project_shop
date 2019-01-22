<!-- 최근본 상품 목록  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="DAODTO.ProdSaveDAO" %>
<%@page import="DAODTO.ProdSaveDTO"%>    
 
<script type="text/javascript">
	$(document).ready(function(){
		var width = $(window).width()/2 + 550;
		$('.c_viewlist').css("left",width +"px");
	});
</script>

<section class="c_viewlist">
	<%	
		Cookie[] cookies = request.getCookies();
		
		if(cookies == null){%>												<!-- 프로그램 처음 시작시 -->
		<%="<p>최근 본 상품이 없습니다.</p>" %>
	<%	}else{										/* 최근본상품의 갯수가 5개 이하일때  */ 
		int cnt = cookies.length;	
		
		if(cnt < 6){ %>
				
				<%="<p>최근 본 상품</p>" %>
				<%
					for(int i=cnt-1; 0 < i && i <= cnt-1; i--){
					
					ProdSaveDAO prodSaveDAO = new ProdSaveDAO();
					ProdSaveDTO prodSaveDTO = new ProdSaveDTO();
					prodSaveDTO = prodSaveDAO.prod_viewlist(cookies[i].getValue());%>
					<a href="/shop/product/detail.jsp?code=<%=cookies[i].getValue() %>">
						<img src="/shop/fileUpload/<%=prodSaveDTO.getThum() %>">
					</a>
				 <%
					}
				
			}else{%>
				<%="<p>최근 본 상품</p>" %>
				<%for(int i=cnt-1; cnt-6 < i&& i <= cnt-1; i--){
				ProdSaveDAO prodSaveDAO = new ProdSaveDAO();
				ProdSaveDTO prodSaveDTO = new ProdSaveDTO();
				prodSaveDTO = prodSaveDAO.prod_viewlist(cookies[i].getValue());%>
				<a href="/shop/product/detail.jsp?code=<%=cookies[i].getValue() %>">
					<img src="/shop/fileUpload/<%=prodSaveDTO.getThum() %>">
				</a>
				<%}
			}
	}%>
</section>
