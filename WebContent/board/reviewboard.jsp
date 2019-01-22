<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAODTO.ProdSaveDTO" %>
<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="dao" class="DAODTO.ProdSaveDAO" scope = "page"></jsp:useBean>
<jsp:useBean id="reviewDAO" class="DAODTO.ReviewDAO" scope = "page"></jsp:useBean>
    
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>
  
      <%  
			int check = 0;
			ArrayList<ProdSaveDTO> dto = dao.select((String)session.getAttribute("id"));
		/* 	int reviewCount = 0;
			if(reviewDAO.selectAll().size() == 0){
				reviewCount = 0;
			}else{
				reviewCount = reviewDAO.selectAll().size() + 1;
			}
		*/
	
		  if(session.getAttribute("id")==null){%> 
			 <script type="text/javascript">
				alert("로그인한 회원만 이용할 수 있습니다.");
				location.href = "/shop/member/login.jsp";
			</script>   
		
		<%}%> 
	
	
<script type="text/javascript">
function comboSelect(obj) {/*매개변수 (obj)가 오브젝트말하는거인듯 잘모르겠지만 ㅇㅇ  */
	<% 
	if(dto.size() != 0){
	 %>
	
	var select = document.getElementById('j_select');
	while(select.firstChild) {
		select.removeChild(select.firstChild);//선택 태그의 첫번째자식을 지운다.
	}

	 var nameList = new Array();
		<%for (int i = 0; i < dto.size(); i++) {%>
		nameList.push('<%=dto.get(i).getName() %>');
		<%}%>
		if (obj.value == 'top') {
			<% for (int j = 0; j <  dto.size(); j++) {
				if (dto.get(j).getCate().equals("Top")) {%>
				var option = document.createElement("option");
				option.innerHTML = nameList['<%= j %>'];
				document.getElementById("j_select").appendChild(option);
				<%	
				}
				
			}
			%>
		}else if(obj.value == 'bottom'){
			
			<% for (int j = 0; j <  dto.size(); j++) {
				if (dto.get(j).getCate().equals("Bottom")){%>
				var option = document.createElement("option");
				option.innerHTML = nameList['<%=j%>'];
				document.getElementById("j_select").appendChild(option);
				<%}
			}%>
		}
		
		
	 <%}else{
	 }%>	
		
	 
	//out.write(i);화면에 출력
	//console.log(i);F12에 출력


	}

	//별점 기능
	var locked = 0;
	function mouseIn(imagenr) {
		var image;
		var el;

		if (document.getElementById('j_grade').value != "") {
			for (var i = 1; i <= 5; i++) {
				image = 'j_image' + i;
				el = document.getElementById(image);
				el.src = "../img/unstar.png";
			}
			for (var i = 1; i <= imagenr; i++) {
				image = 'j_image' + i;
				el = document.getElementById(image);
				el.src = "../img/star2.png";
			}
			/*  document.getElementById("j_grade").value = "";  */
		} else {
			for (var i = 1; i <= 5; i++) {
				image = 'j_image' + i;
				el = document.getElementById(image);
				el.src = "../img/unstar.png";
			}
			for (var i = 1; i <= imagenr; i++) {
				image = 'j_image' + i;
				el = document.getElementById(image);
				el.src = "../img/star2.png";
			}
		}
	}

	function trueClick(imagenr) {
		for (var i = 1; i <= 5; i++) {
			image = 'j_image' + i;
			el = document.getElementById(image);
			el.src = "../img/unstar.png";
		}
		for (var i = 1; i <= imagenr; i++) {
			image = 'j_image' + i;
			el = document.getElementById(image);
			el.src = "../img/star.png";
		}
	}

	function mouseOut(imagenr) {

		if (locked) {
			locked = 0;
			return;
		}
		var a;
		var el;

		if (document.getElementById("j_grade").value == "") {
			for (var i = 1; i <= imagenr; i++) {
				a = 'j_image' + i;
				el = document.getElementById(a);
				el.src = "../fileUpload/unstar.png";
			}
		} else {
			for (var i = 1; i <= 5; i++) {
				image = 'j_image' + i;
				el = document.getElementById(image);
				el.src = "../fileUpload/unstar.png";
			}
			for (var i = 1; i <= document.getElementById("j_grade").value; i++) {
				a = 'j_image' + i;
				el = document.getElementById(a);
				el.src = "../fileUpload/star.png";
			}
		}
	}

	function clicked(imagenr) {
		document.getElementById("j_grade").value = imagenr;
		trueClick(imagenr);
		locked = 1;
	}
	//공백 체크
	function writeCheck() {
		var formCheck = document.j_form;
		if(document.getElementById("j_select").value == null){
			alert("상품내역을 선택해주세요");
		}else if (formCheck.j_grade.value == "") {
			alert("별점을 체크해주세요");
		} else if (formCheck.j_TextName.value == "") {
			alert("제목을 입력해주세요");
		} else if (formCheck.j_contentName.value == "") {
			alert("내용을 입력해주세요");
		} else {
			formCheck.action = "reviewboardch.jsp";
			formCheck.submit();
		}
	}

	//이미지 파일 업로드시 이미지 미리보기
	var loadFile = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
	};
	
	
	function name() {
		
		
		return function () {
			
			
			return function () {
				
			};
		};
	}
	
</script>
<!--태그생성 및 dom 구성  -->
<!-- function add() {
		var h3 = document.createElement("h3");//태그만드는 방법 (h3태그) h태그는 무조건 한줄을 차지해서 밑에줄로 내려간다
		var text = document.createTextNode("나는 텍스트 노드입니다.");
		h3.appendChild(text);//태그를 만든다음에 트리구조에 맞게 부모를 설정해준다 
		document.body.appendChild(h3);//마찬가지
	}
 -->
<body>
<article class="wrap">
	<h2>리뷰 게시판</h2>
	<section class="j_review_br">
		<form name = "j_form" method="post" enctype="multipart/form-data">
			<%-- <input type="hidden" name = "j_num" value = "<%= reviewCount %>"> --%>
			<table>
				<tr>
					<td rowspan="4" style="width:200px;">
						<input type="file" name="j_thum" accept="image/*" onchange="loadFile(event)" style="margin:10px 0 15px;">
						<img id="output" style="width:100px; height:100px; margin-bottom:10px;">
					</td>
					
					<th>대분류</th>
					<td>
						<select name="j_firstName" onchange="comboSelect(this)">
							<option value = "top">top</option>
							<option value = "bottom">bottom</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>구매상품내역</th>
					<td>
						<select name="j_SecondName" id ="j_select">
							<% 
								if(dto.size() != 0){
								for (int i = 0; i < dto.size(); i++) {
									if(dto.get(i).getCate().equals("Top")){%>
									<option><%= dto.get(i).getName() %></option>
									<%}
								}
							}%>			 
						</select>
					</td>
				</tr>
				
				<tr>
					<th>별 점</th>
					<td>
						<ul>
							<li><IMG id=j_image1 onmouseover= "mouseIn(1)"  onmouseout="mouseOut(1)" onclick=clicked(1) src="../fileUpload/unstar.png"></li>
   							<li><IMG id=j_image2 onmouseover= "mouseIn(2)"  onmouseout="mouseOut(2)" onclick=clicked(2) src="../fileUpload/unstar.png"></li>
    						<li><IMG id=j_image3 onmouseover= "mouseIn(3)"  onmouseout="mouseOut(3)" onclick=clicked(3) src="../fileUpload/unstar.png"></li>
    						<li><IMG id=j_image4 onmouseover= "mouseIn(4)"  onmouseout="mouseOut(4)" onclick=clicked(4) src="../fileUpload/unstar.png"></li>
    						<li><IMG id=j_image5 onmouseover= "mouseIn(5)"  onmouseout="mouseOut(5)" onclick=clicked(5) src="../fileUpload/unstar.png"></li>
    					</ul>
    					<input type="hidden" name = "j_grade" id = "j_grade" value ="">
					</td>
				</tr>
				
				<tr>
					<th>제 목</th>
					<td><input type = "text" name = "j_TextName" id = "j_TextName"></td>
				</tr>
				
				<tr>
					<th colspan="3" style="padding:15px;">리뷰작성하기</th>
				</tr>
				
				<tr>
					<td colspan="3" style="padding:10px;">
						<textarea name="j_contentName"></textarea>
						<input type = "button" value = "글 올리기" onclick="writeCheck()"><!-- style="float: right" 오른쪽으로 붙임 -->
					</td>
				</tr>
			</table>
		</form>
	</section>
</article>	

</body>
</html>