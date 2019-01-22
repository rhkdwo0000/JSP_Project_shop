<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<jsp:useBean id="dao" class="DAODTO.ReviewDAO" scope = "page"></jsp:useBean>   
	
<%
	if(session.getAttribute("id") == null){
	%>
 <script type="text/javascript">
	 	alert("로그인한 회원만 사용할 수 있습니다.")	
		location.href = "/shop/main/index.jsp"; 
</script>	
<%		
	}else{
		
	}
%>
<script type="text/javascript">

//이미지 파일 업로드시 이미지 미리보기
var loadFile = function(event,a) {
    var output = document.getElementById('output' + a);
    output.src = URL.createObjectURL(event.target.files[0]);
  };
  
  var request = new XMLHttpRequest();
  
  var temp = "";
  function clickResponse(a){
	temp = a;
	  
	var title = document.getElementById('j_TextTitle' + a);
	var content = document.getElementById('j_TextContent'+ a);
	var file = document.getElementById('j_File'+ a);
		if (file.getAttribute("disabled")!=null) {
			file.removeAttribute("disabled");
			content.removeAttribute('readonly');
			title.removeAttribute('readonly');  
		
		}else{
			 if(((document.getElementById("j_TextTitle" + a)).value == "") || ((document.getElementById("j_TextContent" + a)).value == "")){
				alert("제목이나 내용을 입력해주세요")
			}else{ 
				tmep = "";
				var formId = 'form' +a ;
				var sendData =  new  FormData(document.getElementById(formId));
				/*
				ex)단일 태그의 값만 ajax를 통해 넘기고 싶을때
				var b = new FormData();
				var a = document.getElementById("알수없음");
				var a2 = a.files;
				sendData.append("a",a2[0]);
				*/
		request.open("Post","/shop/ReviewUpdateServlet", false);
		request.onreadystatechange = updateReview;
	    request.send(sendData);
		
		file.setAttribute("disabled","disabled");
		content.setAttribute('readonly','readonly');
		title.setAttribute('readonly','readonly');
	}
  }
  }
 
  function updateReview(){
	  if(request.readyState == 4 && request.status == 200){
		 var result = request.responseText;	
		 if(result == '1'){
			 alert("업데이트성공");
		 }else{
			 alert("업데이트실패");
		 }
	 }
  }
  
  
  function deleteReview(count,form) {
		request.open("Post","/shop/ReviewDeleteServlet?num=" + document.getElementById("j_Num" + count ).value, false);
		request.onreadystatechange = deleteReview1;
	    request.send(null);
	  while (form.firstChild) {
			form.removeChild(form.firstChild);
		}
 } 

  function deleteReview1() {
	  if(request.readyState == 4 && request.status == 200){
			var result = request.responseText;	
			if (result == 1) {
				alert("삭제 성공 ")
			}else{
				alert("삭제 실패 ")
			}
	 	 }
 	 }
  
</script>

<article class="wrap">
<h2>리 뷰 게 시 판</h2>
<section class = "j_section">
		<% if(dao.selectId((String)session.getAttribute("id")).size() == 0){%>
		<b>리뷰가 존재지않습니다</b>
		<input type="button" onclick="location.href='reviewboard.jsp'" value="리뷰작성하러가기">
	<%}else{
	for(int i =0; i < dao.selectId((String)session.getAttribute("id")).size(); i++){%>   
		<form  method="post" enctype="multipart/form-data" id="form<%=i%>">
		<input type="hidden" name = "j_Num" id = "j_Num<%=i %>" value ="<%= dao.selectId((String)session.getAttribute("id")).get(i).getNum() %>">
		<table id = "j_table">
		<tr>
			<td rowspan=4 style="width:210px;">
				<input class ="j_c_file" id ="j_File<%= i %>" disabled="disabled" type="file" name="j_thum" accept="image/*" style="width: 78px; "  onchange="loadFile(event,'<%= i %>')" > 
				<img style="width:300px; height: 200px; "  id="output<%=i %>" src="../fileUpload/<%=dao.selectId((String)session.getAttribute("id")).get(i).getImg()%>" onerror="myFunction(this);">
			</td>
			<th>no</th>
			<td><%= i+1 %></td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td><%= dao.selectId((String)session.getAttribute("id")).get(i).getId() %></td>
		</tr>
		
		<tr>
			<th>상품명</th>
			<td><%= dao.selectId((String)session.getAttribute("id")).get(i).getName()%></td>			
		</tr>
		
		<tr>
			<th>별 점</th>
			<td>
				<ul>
					<% for(int j =0; j < Integer.parseInt(dao.selectId((String)session.getAttribute("id")).get(i).getGrade()); j++){ %> 
						<li style="float: left; width: 30px; height: 30px">
							<IMG id=j_image1 src="../img/star.png">
						</li>
					<% }%> 
				</ul>
			</td>			
		</tr>
		
		<tr>
			<th colspan="2">제 목</th>
			<td>
				<textarea class = "j_c_title" name = "j_TitleName" id = "j_TextTitle<%= i %>"  readonly="readonly"><%=dao.selectId((String)session.getAttribute("id")).get(i).getTitle()%>
				</textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="3" style="height:100px;">
				<textarea name = "j_ContentName" id = "j_TextContent<%= i %>"  readonly="readonly"><%=dao.selectId((String)session.getAttribute("id")).get(i).getContent()%>
				</textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="3">
				<input type="button" value="수 정" style="width:49%; margin-right:2%; float:left;" onclick="clickResponse('<%=i %>');">
				<input type="button" value="삭 제" style="width:49%; margin-right:0%; float:left;" onclick="deleteReview(<%=i %>,document.getElementById('form<%=i%>'))">
			</td>
		</tr>
	</table>
	</form>

		<% }
	}%>

</section>
</article>
<script type="text/javascript">
	/*이미지가 프로젝트 내부에 refresh가 안되어서 업로드를 못할때  refresh될때까지 while문을 continue로 계속 반복해준다 */
	function myFunction(img) {
				img.src = img.src;
	}
</script>
</body>
</html>