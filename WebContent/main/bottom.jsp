<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page import="java.util.ArrayList"%>
<%@page import="DAODTO.ProdSaveDAO"%>
<%@page import="DAODTO.ProdSaveDTO"%>
    
<!-- header & 최근본상품목록  -->
<%@ include file="header.jsp"%>
<%@ include file="viewlist.jsp"%>

<%
	ProdSaveDAO prodsavedao = new ProdSaveDAO();
	ProdSaveDTO prodsavedto = new ProdSaveDTO();
	ArrayList<ProdSaveDTO> bottomlist = prodsavedao.bottomlist();
%>	

<article class="wrap">
	<h2>BOTTOM</h2>
	<section class="c_prodlist">
		<%
			if(bottomlist.size() == 0){
		%>
			<h3>등록된 상품이 없습니다.</h3>
		<%	
			}else{
		%>
			<ul>
				<%
					for(int i=bottomlist.size()-1; i>=0; i--){ 
						prodsavedto = bottomlist.get(i);
				%>
					<li>
						<a href="/shop/product/detail.jsp?code=<%=prodsavedto.getCode() %>">
							<img src ="/shop/fileUpload/<%=prodsavedto.getThum()%>">
							<%=prodsavedto.getCate() %><br>
							<p style="height:40px"><%=prodsavedto.getName() %></p>
							<b><%=prodsavedto.getPrice() %> 원</b><br>
						</a> 	
					</li>
				<%
					}
				%>
			</ul>
		<%	
			}
		%>
	</section>	
</article>



</body>
</html>