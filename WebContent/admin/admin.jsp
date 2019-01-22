<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<%@page import="DAODTO.AdminBoardDAO"%>      
<%@page import="DAODTO.AdminBoardDTO"%>


<%@page import="DAODTO.ProdSaveDAO"%>      
<%@page import="DAODTO.ProdSaveDTO"%>  

<%@page import="java.util.ArrayList"%> 
<%
	//관리자 게시판 목록 가져오기
	AdminBoardDAO adminboarddao = new AdminBoardDAO();
	AdminBoardDTO adminboarddto = new AdminBoardDTO();
	ArrayList<AdminBoardDTO> boardlist = adminboarddao.adminboardlist();
	
	//등록된 상품 목록 가져오기
	ProdSaveDAO prodsavedao = new ProdSaveDAO();
	ProdSaveDTO prodsavedto = new ProdSaveDTO();
	
	ArrayList<ProdSaveDTO> prodlist = prodsavedao.prodlist();
	
%>


<article class="wrap">
	<h2>관 리 자 페 이 지</h2>
	<section class="c_admin">
		<h3>상품목록</h3>
		<p><a href="/shop/product/prodsave.jsp">상품등록</a></p>
		<div>
			<table>
			<tr>
				<th>선 택</th>
				<th>상품이미지</th>
				<th>상품코드</th>
				<th>상 품 명</th>
				<th>가 격</th>
			</tr>
			
			<%
				if(prodlist.size() == 0){
			%>
					<tr>
						<td colspan="5" style="font-weight:bold;">
							등록된 상품이 없습니다.
						</td>
					</tr>
			<%			
				}else{
					for(int i=prodlist.size()-1; i>=0; i--){
						prodsavedto = prodlist.get(i);
			%>
				
					<tr>
						<td>
							<input type="checkbox" value="<%=prodsavedto.getCode()%>">
						</td>
						<td>
							<img src="/shop/fileUpload/<%=prodsavedto.getThum() %>" style="width:100px; height:100px;">
						</td>
						<td>
							<a href="/shop/product/detail.jsp?code=<%=prodsavedto.getCode()%>"><%=prodsavedto.getCode() %></a>
						</td>
						<td>
							<%=prodsavedto.getName() %>
						</td>
						<td>
							<%=prodsavedto.getPrice() %>
						</td>
					</tr>
			<%
					}
				}
			%>
		</table>
		
		</div>
		
	</section>
	
	<section class="c_admin">
		<h3>관리자 게시판</h3>
		<p><a href="/shop/board/adminboard.jsp">글쓰기</a></p>
		<div>
			<table>
				<tr>
					<th>선 택</th>
					<th>번 호</th>
					<th>카테고리</th>
					<th style="width:500px;">제 목</th>
					<th>작성일</th>
					<th>작성자</th>
				</tr>
				
				<%
					int j = 1;
					for(int i=boardlist.size()-1; i>=0; i--){
					adminboarddto = boardlist.get(i);
				%>
					<tr>
						<td><input type="checkbox" value="<%=adminboarddto.getNum() %>"></td>
						<td><%=j %></td>
						<td><%=adminboarddto.getCategory() %></td>
						<td><a href="/shop/board/adminboardview.jsp?num=<%=adminboarddto.getNum() %>" style="width:500px; display:block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; border:0; padding-top:3px;"><%=adminboarddto.getTitle() %></a></td>
						<td><%=adminboarddto.getDate() %></td>
						<td><%=adminboarddto.getName() %></td>
					</tr>
				<% 
					j++;}
				%>
			</table>
		</div>
	</section>
</article>
</body>
</html>