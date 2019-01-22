<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<%@page import="DAODTO.AdminBoardDAO"%>
<%@page import="DAODTO.AdminBoardDTO"%>

<%@page import="DAODTO.AdminBoardComDAO"%>
<%@page import="DAODTO.AdminBoardComDTO"%>

<%@page import="java.util.ArrayList"%>

<script type="text/javascript">
	$(document).ready(function(){
		/*작성일에 오늘 날짜 넣어주기*/
		var now = new Date();
		var year= now.getFullYear();
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
		var chan_val = year + '-' + mon + '-' + day;
		$("#date").append("<input type='hidden' name='date' value='"+chan_val+"'>" + chan_val);
		
		/*댓글 등록 버튼 클릭시*/
		$("#replybtn").click(function(){
			if($(f.cont).val().length == 0){
				alert("내용은 필수 입력 사항 입니다.");
			}else{
				$(f).submit();
			}
		});
	});
</script>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int num =(Integer.parseInt(request.getParameter("num")));

	AdminBoardDAO adminboarddao = new AdminBoardDAO();
	AdminBoardDTO adminboarddto = new AdminBoardDTO();
	
	ArrayList<AdminBoardDTO> list = adminboarddao.adminBoardView(num);
	
	AdminBoardComDTO adminboardcomdto = new AdminBoardComDTO();
	AdminBoardComDAO adminboardcomdao = new AdminBoardComDAO();
	ArrayList<AdminBoardComDTO> list2 = adminboardcomdao.adminboardcomlist(num);
%>
<article class="wrap">
	<h2>공 지 사 항</h2>
	<section class="c_adminboard">
		<table>
			<tr>
				<th>카테고리</th>
				<td><%=list.get(0).getCategory() %></td>

				<th>작성일</th>
				<td><%=list.get(0).getDate() %></td>

				<th>작성자</th>
				<td><%=list.get(0).getName() %></td>
			</tr>

			<tr>
				<th>제 목</th>
				<td colspan="5"><%=list.get(0).getTitle() %></td>
			</tr>

			<tr>
				<th style="height: 500px;">내 용</th>
				<td colspan="5"><%=list.get(0).getCont() %></td>
			</tr>
		</table>
	</section>

	<%if(id == null){%>
	<section class="c_adminreply">
		<h3>댓 글</h3>
		<p>로그인 후 댓글 작성이 가능 합니다.</p>
	</section>
	<%}else{ %>
	<section class="c_adminreply">
		<h3>댓 글</h3>
		<form name="f" method="post" action="/shop/board/adminboardcom.jsp?num=<%=num %>">
			<table>
				<tr>
					<th>작성일</th>
					<td id="date" colspan="2"></td>
					<th>작성자</th>
					<td colspan="2"><input type="hidden" name="name" value="<%=id %>"><%=id %></td>
				</tr>
				<tr>
					<td colspan="6"><textarea style="width: 100%; height: 80px; resize: none; box-sizing: border-box;" name="cont"></textarea></td>
				</tr>
				<tr>
					<td colspan="6" style="text-align: right;"><input type="reset" value="초기화"> <input type="button" value="댓글등록" id="replybtn"></td>
				</tr>

				<%
				int n = 1;
				for(int i = list2.size()-1; i >= 0; i--){
					adminboardcomdto = list2.get(i);%>
				<tr>
					<th>글번호</th>
					<td><%=n%></td>
					<th>작성자</th>
					<td><%= adminboardcomdto.getName()%></td>
					<th>작성일</th>
					<td><%=adminboardcomdto.getDate()%></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="5" style="height:50px;"><%=adminboardcomdto.getCont()%></td>
				</tr>
				<%
					n++;
				}%>
			</table>
		</form>
	</section>
	<%}%>
</article>
</body>
</html>