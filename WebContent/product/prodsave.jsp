<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>    
<script type="text/javascript" src="SE2/js/service/HuskyEZCreator.js"charset="UTF-8"></script>   
<script type="text/javascript">
	$(document).ready(function(){
		/* 옵션추가버튼 클릭 스크립트 */
		var cnt = 6;
		var cnt2 = 6;

		$('#coloradd').click(function() {
		if(cnt <= 10){
			$('#color').append($('<br><input type="text" style="margin-bottom:10px;" name="color'+ cnt +'">'));
		}else if(cnt == 11){
			alert("더 이상 추가할수 없습니다.");
		}
		cnt++;
		});

		$('#sizeadd').click(function() {
		if(cnt2 <= 10){
		$('#size').append($('<br><input type="text" style="margin-bottom:10px;" name="size'+ cnt2 +'">'));
		}else{
		alert("더 이상 추가할수 없습니다.");
		}
		cnt2++;
		});
		
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "smartEditor",
		sSkinURI : "SE2/SmartEditor2Skin.html",//SmartEditor2Skin.html 파일이 존재하는 경로
		htParams : {
		bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : false, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
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
			var check3 = false;
			var check4 = false;
			var check5 = false;
			var check6 = false;
			var check7 = false;
			var check8 = false;

			//유효성검사

			if($("form [type=file]").val().length == "0"){
				$(".thumerr").slideDown();
			}else{
				$(".thumerr").slideUp();
				check1 = true;
			}

			if($('form [name="code"]').val().length == 0){
				$('.codeerr').slideDown();
			}else{
				$('.codeerr').slideUp();
				check2 = true;
			}

			if($('form [name="cate"]').val().length == 0){
				$('.cateerr').slideDown();
			}else{
				$('.cateerr').slideUp();
				check3 = true;
			}

			if($('form [name="name"]').val().length == 0){
				$('.nameerr').slideDown();
			}else{
			$('.nameerr').slideUp();
				check4 = true;
			}

			if($('form [name="price"]').val().length == 0){
				$('.priceerr').slideDown();
			}else{
			$('.priceerr').slideUp();
				check5 = true;
			}

			if($('form [name="color1"]').val().length == 0){
				$(".colorerr").slideDown();
			}else{
				$(".colorerr").slideUp();
				check6 = true;	
			}

			if($('form [name="size1"]').val().length == 0){
				$(".sizeerr").slideDown();
			}else{
				$(".sizeerr").slideUp();
				check7 = true;
			}

			if($('#smartEditor').val() == "<p><br></p>" || $('#smartEditor').val() == "" || $('#smartEditor').val().length == 0){
				alert("내용을 입력하세요");
			}else{
				check8 = true;
			}
			
			if(check1 && check2 && check3 && check4 && check5 && check6 && check7 && check7){
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
		});

		$('select').click(function(){
			$('input').not($('#submitBoardBtn')).each(function(){
				if($(this).val().length !=0){
					$(this).siblings('.err').slideUp();
				}
			});
		});

	
	});
	
</script>    
<article class="wrap">
	<h2>상 품 등 록</h2>
	<section class="c_prodsave">
		<form method="post" enctype="multipart/form-data" action="prodsavech.jsp">
			<table>
				<tr>
					<td rowspan="8" style="width: 40%;">
						<input type="file" name="thum">
						<span class="thumerr err" style="display:none;">상품이미지는 필수 입력 사항 입니다.</span>
					</td>
					
					<th style="width: 15%;">상품코드</th>
					<td colspan="2">
						<input type="text" name="code" id="code">
						<span class="codeerr err" style="display:none;">상품코드는 필수 입력사항입니다.</span>
					</td>
				</tr>

				<tr>

					<th style="width: 15%;">카테고리</th>
					<td colspan="2">
						<select name="cate">
							<option value="TOP">TOP</option>
							<option value="BOTTOM">BOTTOM</option>
						</select>
						<span class="caterr err" style="display:none;">카테고리 선택은 필수 입니다.</span>
					</td>
				</tr>

				<tr>
					<th style="width: 15%;">상품명</th>
					<td colspan="2">
						<input type="text" name="name">
						<span class="nameerr err" style="display:none;">상품명은 필수 입력사항입니다.</span>
					</td>
				</tr>

				<tr>
					<th style="width: 15%;" name="prod_price">가 격</th>
					<td colspan="2">
						<input type="text" name="price">
						<span class="priceerr err" style="display:none;">가격은 필수 입력사항입니다.</span>
					</td>
				</tr>

				<tr>
					<th rowspan="4" style="width: 15%;">옵션</th>
					<th rowspan="2" style="width: 15%;">색상</th>
					<td id="color">
						<input type="text" style="margin-bottom: 10px;"name="color1"><br> 
						<input type="text" style="margin-bottom: 10px;" name="color2"><br>
						<input type="text" style="margin-bottom: 10px;" name="color3"><br>
						<input type="text" style="margin-bottom: 10px;" name="color4"><br>
						<input type="text" style="margin-bottom: 10px;" name="color5">
						<span class="colorerr err" style="display:none; margin-top:0;">색상옵션은 필수 입력사항입니다.</span>
					</td>
				</tr>

				<tr>
					<td><input type="button" value="추가" id="coloradd"></td>
				</tr>

				<tr>
					<th rowspan="2"
						style="width: 15%;">사이즈</th>
					<td id="size">
						<input type="text" style="margin-bottom: 10px;"name="size1"><br>
						<input type="text" style="margin-bottom: 10px;" name="size2"><br>
						<input type="text" style="margin-bottom: 10px;" name="size3"><br>
						<input type="text" style="margin-bottom: 10px;" name="size4"><br>
						<input type="text" style="margin-bottom: 10px;" name="size5">
						<span class="sizeerr err" style="display:none; margin-top:0;">사이즈옵션은 필수 입력사항입니다.</span>
					</td>
				</tr>

				<tr>
					<td><input type="button" value="추가" id="sizeadd"></td>
				</tr>

				<tr>
					<td colspan="4">
						<textarea style="height: 500px;" name="smartEditor" id="smartEditor"></textarea>
					</td>
				</tr>

				<tr>
					<td colspan="4"><input type="button" value="상품등록" id="submitBoardBtn"></td>
				</tr>
			</table>
		</form>
	</section>
</article>
</body>
</html>