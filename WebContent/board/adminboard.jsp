<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<% request.setCharacterEncoding("utf-8"); %>
<script type="text/javascript" src="SE2/js/service/HuskyEZCreator.js"charset="UTF-8"></script>
<!-- 스마트 에디터 -->
<script type="text/javascript">
	$(document).ready(function() {
		/*작성일에 오늘 날짜 넣어주기*/
		var now = new Date();
	    var year= now.getFullYear();
	    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	    var chan_val = year + '-' + mon + '-' + day;
	   	 $("#date").append("<input type='hidden' name='date' value='"+chan_val+"'> "+ chan_val);
	   	 
	   	var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "smartEditor",
			sSkinURI : "SE2/SmartEditor2Skin.html",//SmartEditor2Skin.html 파일이 존재하는 경로
			htParams : {
				bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			},

			fOnAppLoad : function() {
			//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			oEditors.getById["smartEditor"].exec("PASTE_HTML", [ "" ]);},
			fCreator : "createSEditor2"
		});

		//네이버 에디터 작성 데이터 전송하기 
		$("#submitBoardBtn").click(
			function() {oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		});

		$("#submitModifyBoardBtn").click(
			function() {oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		});
		
		$("#submitBoardBtn").click(function(){
			var check1 = false;
			var check2 = false;
			var chect3 = false;
			//유효성검사

				if($("form [name=category]").val() == "[전 체]"){
					$('.cateerr').slideDown();
				}else{
					$(".cateerr").slideUp();
					check1 = true;
				}
				
				if($("form [name=title]").val().length == 0){
					$('.titleerr').slideDown();
				}else{
					$(".titleerr").slideUp();
					check2 = true;
				}

				if($('#smartEditor').val() == "<p><br></p>" || $('#smartEditor').val() == "" || $('#smartEditor').val().length == 0){
					alert("내용을 입력하세요");
				}else{
					check3 = true;
				}
			
			if(check1 && check2 && check3){
				$("form").submit();
			}
		});
		
		//입력완료되면 에러창 없애기
		$('input').not($('#submitBoardBtn')).focus(function(){
			$('input').not($('#submitBoardBtn')).each(function(){
				if($(this).val().length !=0){
					$(this).siblings('.err').slideUp();
				}
			});
			
			$('select').each(function(){
				if($(this).val() != "[전 체]"){
					$(this).siblings('.err').slideUp();
				}
			});
		});
		
		//초기화 버튼 클릭시 스마트에디터 초기화
		$("#reset").click(function(){
			oEditors.getById["smartEditor"].exec("SET_IR",['']);
		});
	});
</script>



<article class="wrap">
	<h2>관 리 자 게 시 판</h2>
	<section class="c_adminboard">
			<form method="post" action="/shop/board/adminboardch.jsp">
				<table>
				<tr>
					<th>카테고리</th>
					<td style="width:191px;">
						<select name="category">
							<option>[전 체]</option>
							<option>[배송정보]</option>
							<option>[휴무일안내]</option>
							<option>[제품정보]</option>
							<option>[기타공지사항]</option>
						</select>
						<span class="cateerr err" style="margin-bottom:0;">카테고리를 선택해 주세요.</span>
					</td>
					
					<th>작성일</th>
					<td id="date"></td>
					
					<th>작성자</th>
					<td><input type="hidden" name="name" value="관리자">관리자</td>
				</tr>
				
				<tr>
					<th>제 목</th>
					<td colspan="5">
						<input type="text" name="title" id="title">
						<span class="titleerr err" style="margin-bottom:0;">제목을 입력해 주세요.</span>
					</td>
				</tr>
	
				<tr>
					<td colspan="6">
						<textarea style="height:500px;" name="smartEditor" id="smartEditor"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="6">
						<input type="reset" value="초 기 화" id="reset">
						<input type="button" value="게시물등록" id="submitBoardBtn">
					</td>
				</tr>
			</table>
			</form>
			
	</section>
</article>

</body>
</html>