<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="org.apache.catalina.startup.Tomcat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAODTO.ProdSaveDTO"%>
<%@page import="DAODTO.ReviewDTO"%>

<jsp:useBean id="memberDao" class="DAODTO.MemberDAO" scope = "page"></jsp:useBean>
<jsp:useBean id="reviewDAO" class="DAODTO.ReviewDAO" scope="page"></jsp:useBean>

<!-- 등록된 상품 목록 가져오기 -->
<jsp:useBean id="productDAO" class="DAODTO.ProdSaveDAO" scope="page"></jsp:useBean>
<jsp:useBean id="productDTO" class="DAODTO.ProdSaveDTO" scope="page"></jsp:useBean>

<%	/* 카카오톡 아이디 */
	String kakaoId = request.getParameter("id");
	if(kakaoId !=null){
		if(memberDao.idCheck(kakaoId).equals(kakaoId)){
			session.setAttribute("id", kakaoId);
		}else{
		memberDao.kakaoLogin(kakaoId);
		session.setAttribute("id", kakaoId);
		}
	}
%>
  
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<%
	/*등록된 모든 상품 가져오기*/
	ProdSaveDAO prodsavedao = new ProdSaveDAO();
	ProdSaveDTO prodsavedto = new ProdSaveDTO();
	ArrayList<ProdSaveDTO> prodlist =  prodsavedao.prodlist();
%>
<article class="wrap">
	<!-- 이미지 슬라이드 -->
	<section class="c_index_slide">
		<ul class="imgSet">
			<li><a href="#"> <img src="/shop/images/img_slide01.jpg" alt="img_slide01">
			</a></li>
			<li><a href="#"> <img src="/shop/images/img_slide02.jpg"alt="img_slide02">
			</a></li>
			<li><a href="#"> <img src="/shop/images/img_slide03.jpg"alt="img_slide03">
			</a></li>
		</ul>

		<div class="arrow">
			<span></span>
		</div>
		<ul class="menuSet">
			<li>1</li>
			<li>2</li>
			<li>3</li>
		</ul>
		<span class="prevBtn"><img src="/shop/images/pre.png" alt="pre" /></span>
		<span class="nextBtn"><img src="/shop/images/next.png" alt="next" /></span>
	</section>
	
	<!-- Best상품 영역 -->
		<%
		ArrayList<ProdSaveDTO> topList = productDAO.prodlistAllBest();
		ArrayList<ReviewDTO> topReviewList = reviewDAO.selectGradeBest();

		String topArray[] = new String[topList.size()];
		String reviewArray[] = new String[topReviewList.size()];
		double gradeTemp[] = new double[topList.size()];
		int grade = 60;

		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < topList.size(); j++) {
				if (topList.get(j).getColor().equals(i + 1 + "")) {
					topArray[j] = topList.get(j).getName();
					topArray[j] += "," + grade;
				}
			}
			grade -= 5;
		}
		
		for (int i = 0; i < topReviewList.size(); i++) {
			reviewArray[i] = topReviewList.get(i).getName();
			if (topReviewList.get(i).getTempGrade() != 0) {
				reviewArray[i] += "," + (topReviewList.get(i).getTempGrade() * 40) / 5;
			}
		}
		
		for (int i = 0; i < topArray.length; i++) {
			for (int j = 0; j < reviewArray.length; j++) {
				if (topArray[i].split(",")[0].equals(reviewArray[j].split(",")[0])) {
					gradeTemp[i] = Integer.parseInt(topArray[i].split(",")[1]);
					gradeTemp[i] += Double.parseDouble(reviewArray[j].split(",")[1]);
				}
			}

			if (gradeTemp[i] == 0) {
				gradeTemp[i] = Integer.parseInt(topArray[i].split(",")[1]);
			}
		}

		for (int i = 0; i < topArray.length; i++) {
			topArray[i] += "," + gradeTemp[i];
		}

	 	//for (int i = 0; i < topArray.length; i++) {
		//	System.out.println(topArray[i]);
		//} 

		String tempList = "";
		for (int i = 0; i < topArray.length; i++) {
			for (int j = i; j < topArray.length; j++) {
				if (Double.parseDouble(topArray[i].split(",")[2]) < Double.parseDouble(topArray[j].split(",")[2])) {
					tempList = topArray[i];
					topArray[i] = topArray[j];
					topArray[j] = tempList;
				}
			}
		}
		ArrayList<ProdSaveDTO> list = productDAO.bestSelect(topArray);
		System.out.print(list.size()); 
	%>
	
	
	<!-- 베스트상품 리스트 영역 -->
	<section class="c_prodbest">
		<h3>베 스 트 상 품</h3>
		<a href="/shop/main/best.jsp" style="text-align:right; display:inline-block; margin-bottom:20px;">more</a>
		<ul>
			<%for(int i = 0; i < 5; i++){ %>
			<li>
				<a href="/shop/product/detail.jsp?code=<%=list.get(i).getCode()%>" >
				<div class="rank"><%=i+1 %><span>위</span>
				</div>
				
					<%-- <%=list.get(i).getCate()%><br>
					<p><%=list.get(i).getName()%></p> 
					<b><%=list.get(i).getPrice()%>원</b><br> --%>
					
					<img src="/shop/fileUpload/<%=list.get(i).getThum()%>">
					</a>
			</li>
			<%} %>
		</ul>
	</section>
	
	<!-- 상품리스트 영역  -->
	<section class="c_prodlist">
		<ul>
			<%for(int i=prodlist.size()-1; i>=0; i--){%>
			<%prodsavedto = prodlist.get(i); %>
			<li>
				<a href="/shop/product/detail.jsp?code=<%=prodsavedto.getCode() %>">
					<img src="/shop/fileUpload/<%=prodsavedto.getThum()%>"> <%=prodsavedto.getCate() %><br>
					<p style="height:40px;"><%=prodsavedto.getName() %></p>
					<b><%=prodsavedto.getPrice() %> 원</b><br>
				</a>
			</li>
			<%}%>
		</ul>
	</section>

</article>
</body>
</html>