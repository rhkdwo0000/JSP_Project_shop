<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<jsp:useBean id="dao" class="DAODTO.ReviewDAO" scope="page"></jsp:useBean>

<script type="text/javascript">
	function myFunction(img) {
		 img.src = img.src; 
	}
</script>

<% int tempPage = 0;
	if(request.getParameter("page")==null){
		tempPage = 1;
		System.out.print("null");
	}else{
		tempPage = Integer.parseInt(request.getParameter("page"));
	}
%>

<article class="wrap">
<h2>리 뷰 게 시 판</h2>
<section class = "j_section">
<%if(dao.selectAll().size() == 0){%>
<b>리뷰가 존재하지않습니다</b>
	<input type="button" onclick="location.href='reviewboard.jsp'" value="리뷰작성하기" style="margin-bottom:20px; float: right;">
	<%}else{ %>
	<input type="button" onclick="location.href='reviewboard.jsp'" value="리뷰작성하기" style="margin-bottom:20px; float: right;">
	<%  if(tempPage == 0 || tempPage ==1){
		if(dao.selectAll().size() <= 10){
		   for(int i =0; i < dao.selectAll().size(); i++){%>    
	<table>
		<tr>
			<td rowspan=4 style="width:210px;">
				<img src="/shop/fileUpload/<%=dao.selectAll().get(i).getImg()%>" onerror="myFunction(this);"> 
			</td>
			<th>no</th>
			<td><%= i+1 %></td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td><%= dao.selectAll().get(i).getId() %></td>
		</tr>
		
		<tr>
			<th>상품명</th>
			<td><%= dao.selectAll().get(i).getName() %></td>			
		</tr>
		
		<tr>
			<th>별 점</th>
			<td>	
				<ul>
				 <% for(int j =0; j < Integer.parseInt(dao.selectAll().get(i).getGrade()); j++){ 
					 System.out.println(dao.selectAll().get(i).getGrade());
				 %> 
					<li style="float: left;">
						<IMG style="width: 30px; height: 30px;"  id=j_image1 src="../fileUpload/star.png">
					</li>
				<% }%> 
				</ul>
			</td>			
		</tr>
		
		<tr>
			<th colspan="2">제 목</th>
			<td ><%= dao.selectAll().get(i).getTitle() %></td>
		</tr>
		
		<tr>
			<td colspan="3" style="height:100px;">
				<%=dao.selectAll().get(i).getContent() %>
			</td>
		</tr>
	</table>
			<%}
		}else{
	  			for(int i =0; i < 10; i++){%>    
	<table>
		<tr>
			<td rowspan=4 style="width:210px;">
				<img src="/shop/fileUpload/<%=dao.selectAll().get(i).getImg()%>" onerror="myFunction(this);"> 
			</td>
			<th>no</th>
			<td><%= i+1 %></td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td><%= dao.selectAll().get(i).getId() %></td>
		</tr>
		
		<tr>
			<th>상품명</th>
			<td><%= dao.selectAll().get(i).getName() %></td>			
		</tr>
		
		<tr>
			<th>별 점</th>
			<td>	
				<ul>
				 <% for(int j =0; j < Integer.parseInt(dao.selectAll().get(i).getGrade()); j++){ 
					 System.out.println(dao.selectAll().get(i).getGrade());
				 %> 
					<li style="float: left;">
						<IMG style="width: 30px; height: 30px;"  id=j_image1 src="../fileUpload/star.png">
					</li>
				<% }%> 
				</ul>
			</td>			
		</tr>
		
		<tr>
			<th colspan="2">제 목</th>
			<td ><%= dao.selectAll().get(i).getTitle() %></td>
		</tr>
		
		<tr>
			<td colspan="3" style="height:100px;">
				<%=dao.selectAll().get(i).getContent() %>
			</td>
		</tr>
	</table>

		<%}
	  			} 
	}else{
		if(tempPage <= (dao.selectAll().size() / 10)){
			   for(int i = (tempPage - 1 )*10; i < (tempPage * 10); i++){%>   	
		<table>
		<tr>
			<td rowspan=4 style="width:210px;">
				<img src="/shop/fileUpload/<%=dao.selectAll().get(i).getImg()%>" onerror="myFunction(this);"> 
			</td>
			<th>no</th>
			<td><%= i+1 %></td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td><%= dao.selectAll().get(i).getId() %></td>
		</tr>
		
		<tr>
			<th>상품명</th>
			<td><%= dao.selectAll().get(i).getName() %></td>			
		</tr>
		
		<tr>
			<th>별 점</th>
			<td>	
				<ul>
				 <% for(int j =0; j < Integer.parseInt(dao.selectAll().get(i).getGrade()); j++){ 
					 System.out.println(dao.selectAll().get(i).getGrade());
				 %> 
					<li style="float: left;">
						<IMG style="width: 30px; height: 30px;"  id=j_image1 src="../fileUpload/star.png">
					</li>
				<% }%> 
				</ul>
			</td>			
		</tr>
		
		<tr>
			<th colspan="2">제 목</th>
			<td ><%= dao.selectAll().get(i).getTitle() %></td>
		</tr>
		
		<tr>
			<td colspan="3" style="height:100px;">
				<%=dao.selectAll().get(i).getContent() %>
			</td>
		</tr>
	</table>

		<%} 
		}else{
			 for(int i = (tempPage - 1 )*10; i < ((tempPage - 1 )*10+(dao.selectAll().size() % 10)); i++){%>  
		<table>
		<tr>
			<td rowspan=4 style="width:210px;">
				<img src="/shop/fileUpload/<%=dao.selectAll().get(i).getImg()%>" onerror="myFunction(this);"> 
			</td>
			<th>no</th>
			<td><%= i+1 %></td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td><%= dao.selectAll().get(i).getId() %></td>
		</tr>
		
		<tr>
			<th>상품명</th>
			<td><%= dao.selectAll().get(i).getName() %></td>			
		</tr>
		
		<tr>
			<th>별 점</th>
			<td>	
				<ul>
				 <% for(int j =0; j < Integer.parseInt(dao.selectAll().get(i).getGrade()); j++){ 
					 System.out.println(dao.selectAll().get(i).getGrade());
				 %> 
					<li style="float: left;">
						<IMG style="width: 30px; height: 30px;"  id=j_image1 src="../fileUpload/star.png">
					</li>
				<% }%> 
				</ul>
			</td>			
		</tr>
		
		<tr>
			<th colspan="2">제 목</th>
			<td ><%= dao.selectAll().get(i).getTitle() %></td>
		</tr>
		
		<tr>
			<td colspan="3" style="height:100px;">
				<%=dao.selectAll().get(i).getContent() %>
			</td>
		</tr>
	</table>
		<%
			}

					}
				}

			}
		%>

</section>

<div style="text-align: center; display: inline-block; width: 100%; margin-top:10px ">
	<nav aria-label="..." style="display: inline-block;">
		<ul>
			<li style="float: left;">
				<a href="#" id="firstA"></a>
			</li>
			<li style="float: left;">
				<p id="firstB" ></p>
			</li>

			<li style="float: left;">
				<a href="#" id="firstC" ></a>
			</li>
		</ul>
	</nav>
</div>
	<script type="text/javascript">
		window.onload = function() {
			var firstBtn = document.getElementById("firstA");
			var secondBtn = document.getElementById("firstB");
			var thirdBtn = document.getElementById("firstC");
			
			var page = <%=tempPage %>;
			
	<%if(dao.selectAll().size() == 0){
	
	}else{%>
			secondBtn.innerHTML = page; 
			if (page==1) {
				firstBtn.innerHTML = "";
			}else{
				firstBtn.innerHTML = page-1;
				firstBtn.setAttribute("href",'<%= request.getRequestURI() + "?page=" + (tempPage-1) %>');
			}
			
		if (page < <%= dao.selectAll().size()/10 %> + <%= dao.selectAll().size()%10 %> && page <= <%= dao.selectAll().size()/10 %>){
				thirdBtn.innerHTML = page+1;
				thirdBtn.setAttribute("href",'<%= request.getRequestURI() + "?page=" + (tempPage+1) %>');
		}else{
				thirdBtn.innerHTML = "";
			}
		<%}%>
		}
	</script>
</article>

</body>
</html>