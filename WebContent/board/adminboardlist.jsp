<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>  

<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<%@page import="DAODTO.AdminBoardDTO"%>
<%@page import="DAODTO.AdminBoardDAO"%>

<%	
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>


<%
	AdminBoardDAO adminboarddao = new AdminBoardDAO();
	AdminBoardDTO adminboarddto = new AdminBoardDTO();
	ArrayList<AdminBoardDTO> boardlist = adminboarddao.adminboardlist();
	
	//현재 페이지넘버 받기
	int pn = 0;
	if(request.getParameter("pn") == null){
		pn = 1;
	}else{
		pn = Integer.parseInt(request.getParameter("pn"));
	}
	
	int pagecnt = 0;
%>
<article class="wrap">
	<h2>공 지 사 항</h2>
	<section class="c_adminboardlist">
		<!-- 페이지 수 구하기 -->
			<% 
			if(boardlist.size()<=10){
				pagecnt=1;
			}else if(boardlist.size()%10 == 0){			 		//모든페이지의 게시물의 갯수가 10개일 경우
				pagecnt = boardlist.size()/10;					//전체페이지의 수
			}else{
				pagecnt = boardlist.size()/10+1;				//전체페이지의 수
			}
			%>
		<table>
			<tr>
				<th style="width:10%;">글번호</th>
				<th style="width:65%;">제 목</th>
				<th style="width:15%;">작성자</th>
				<th style="width:15%;">작성일</th>
			</tr>	
			<%
				int j=1;
				int start = boardlist.size() - (pn-1)*10;	//시작한 게시물의 번호
				int lastcnt = 0;		//마지막 페이지의 게시물 갯수
				
				if(boardlist.size()<=10){
					lastcnt=boardlist.size();
				}else{
					lastcnt=boardlist.size()%10;
				}
				
				
				if(pn == pagecnt){
					System.out.println(start + " " + (lastcnt));
					for(int i=start; j<=lastcnt; i--){
						System.out.println(i);
						adminboarddto = boardlist.get(i-1);
			%>
					<tr>
						<td><%=i %></td>	
						
						<td><a href="/shop/board/adminboardview.jsp?num=<%=adminboarddto.getNum() %>" style="width:690px; display:block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; border:0; padding-top:3px;"><%=adminboarddto.getTitle() %></a></td>
						<td><%=adminboarddto.getName() %></td>
						<td><%=adminboarddto.getDate() %></td>
					</tr>
			<%		j++;}
				}else{
					for(int i=start; i>=start-9; i--){
						adminboarddto = boardlist.get(i-1);	
			%>
					<tr>
						<td><%=i %></td>
						<td><a href="/shop/board/adminboardview.jsp?num=<%=adminboarddto.getNum() %>" style="width:690px; display:block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; border:0; padding-top:3px;"><%=adminboarddto.getTitle() %></a></td>
						<td><%=adminboarddto.getName() %></td>
						<td><%=adminboarddto.getDate() %></td>
					</tr>
			<%
					j++;}
				}
			%>
			</table>
	</section>
	
	<section class="page">
		<%
			for(int i=1; i<=pagecnt; i++){
				if(i==pn){%>
					<a href="/shop/board/adminboardlist.jsp?pn=<%=i %>" style="font-weight: bold; font-size: 15px;"><%=i %></a>
		<%		}else{%>
			<a href="/shop/board/adminboardlist.jsp?pn=<%=i %>"><%=i %></a>			
		<% 
				}		
			}
		%>
	</section>
</article>

</body>
</html>