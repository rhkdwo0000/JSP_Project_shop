<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header & 최근본상품목록  -->
<%@ include file="header.jsp"%>
<%@ include file="viewlist.jsp"%> 

<%@page import="org.apache.catalina.startup.Tomcat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>   
<%@page import="DAODTO.ReviewDTO"%>

<jsp:useBean id="memberDao" class="DAODTO.MemberDAO" scope = "page"></jsp:useBean>
<jsp:useBean id="reviewDAO" class="DAODTO.ReviewDAO" scope="page"></jsp:useBean>
<jsp:useBean id="productDAO" class="DAODTO.ProdSaveDAO" scope="page"></jsp:useBean>


<!-- Best상품 영역 -->
		<%
		ArrayList<ProdSaveDTO> bottomList = productDAO.prodlistAll("bottom");
		ArrayList<ReviewDTO> bottomReviewList = reviewDAO.selectGrade("bottom");
	

		String bottomArray[] = new String[bottomList.size()];
		String reviewBottomArray[] = new String[bottomReviewList.size()];
		double bottomGradeTemp[] = new double[bottomList.size()];
		int bottomGrade = 60;

		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < bottomList.size(); j++) {
				if (bottomList.get(j).getColor().equals(i + 1 + "")) {
					bottomArray[j] = bottomList.get(j).getName();
					bottomArray[j] += "," + bottomGrade;
				}
			}
			bottomGrade -= 5;
		}

		for (int i = 0; i < bottomReviewList.size(); i++) {
			reviewBottomArray[i] = bottomReviewList.get(i).getName();
			if (bottomReviewList.get(i).getTempGrade() != 0) {
				reviewBottomArray[i] += "," + (bottomReviewList.get(i).getTempGrade() * 40) / 5;
			}
		}
		
		for (int i = 0; i < bottomArray.length; i++) {
			for (int j = 0; j < reviewBottomArray.length; j++) {
				if (bottomArray[i].split(",")[0].equals(reviewBottomArray[j].split(",")[0])) {
					bottomGradeTemp[i] = Integer.parseInt(bottomArray[i].split(",")[1]);
					bottomGradeTemp[i] += Double.parseDouble(reviewBottomArray[j].split(",")[1]);
				}
			}

			if (bottomGradeTemp[i] == 0) {
				bottomGradeTemp[i] = Integer.parseInt(bottomArray[i].split(",")[1]);
			}
		}

		for (int i = 0; i < bottomArray.length; i++) {
			bottomArray[i] += "," + bottomGradeTemp[i];
		}

	 	//for (int i = 0; i < topArray.length; i++) {
		//	System.out.println(topArray[i]);
		//} 

		String bottomTempList = "";
		for (int i = 0; i < bottomArray.length; i++) {
			for (int j = i; j < bottomArray.length; j++) {
				if (Double.parseDouble(bottomArray[i].split(",")[2]) < Double.parseDouble(bottomArray[j].split(",")[2])) {
					bottomTempList = bottomArray[i];
					bottomArray[i] = bottomArray[j];
					bottomArray[j] = bottomTempList;
				}
			}
		}
		ArrayList<ProdSaveDTO> resultBottomList = productDAO.bestSelect(bottomArray);
		System.out.println(resultBottomList.size());

		
		
		
		
		
		
		/*top best상품 */
		ArrayList<ProdSaveDTO> topList = productDAO.prodlistAll("top");
		ArrayList<ReviewDTO> topReviewList = reviewDAO.selectGrade("top");

		String topArray[] = new String[topList.size()];
		String reviewArray[] = new String[topReviewList.size()];
		double gradeTemp[] = new double[topList.size()];
		int topGrade = 60;

		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < topList.size(); j++) {
				if (topList.get(j).getColor().equals(i + 1 + "")) {
					topArray[j] = topList.get(j).getName();
					topArray[j] += "," + topGrade;
				}
			}
			topGrade -= 5;
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
		ArrayList<ProdSaveDTO> resultTopList = productDAO.bestSelect(topArray);
		System.out.println(resultTopList);
	%>





	<!-- 베스트상품 리스트 영역 -->
<article class="wrap">	
	<section class="c_prodbest">
		<h3>TOP</h3>
		<a href="/shop/main/best.jsp" style="text-align:right; display:inline-block; margin-bottom:20px;">more</a>
		<ul>
			<%for(int i = 0; i < 5; i++){ %>
			<li>
				<a href="/shop/product/detail.jsp?code=<%=resultTopList.get(i).getCode()%>" >
				<div class="rank"><%=i+1 %><span>위</span></div>
				<img style="width: 180px; height: 190px;" src="/shop/fileUpload/<%=resultTopList.get(i).getThum()%>">
					<%=resultTopList.get(i).getCate()%><br>
					<p><%=resultTopList.get(i).getName()%></p> 
					<b><%=resultTopList.get(i).getPrice()%>원</b><br>
				</a>
			</li>
			<%} %>
		</ul>
		<h3>BOTTOM</h3>
		<a href="/shop/main/best.jsp" style="text-align:right; display:inline-block; margin-bottom:20px;">more</a>
		<ul>
			<%for(int i = 0; i < 5; i++){ %>
			<li>
				<a href="/shop/product/detail.jsp?code=<%=resultBottomList.get(i).getCode()%>" >
				<div class="rank"><%=i+1 %><span>위</span></div>
				<img style="width: 180px; height: 190px;" src="/shop/fileUpload/<%=resultBottomList.get(i).getThum()%>">
				<%=resultBottomList.get(i).getCate()%><br>
					<p><%=resultBottomList.get(i).getName()%></p> 
					<b><%=resultBottomList.get(i).getPrice()%>원</b><br>
				</a>
			</li>
			<%} %>
		</ul>
	</section> 
</article>
</body>
</html>