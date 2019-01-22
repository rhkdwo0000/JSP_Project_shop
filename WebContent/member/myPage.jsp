<%@page import="com.mysql.fabric.xmlrpc.base.Member"%>
<%@page import="DAODTO.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAODTO.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<span id="guide" style="color: #999; display: none"></span>
<!-- 우편번호 팜업창이 선택시 자동으로 닫히게 할때 필요한 span태그  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				/* document.getElementById("sample4_roadAddress").value = roadAddr; */
				// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				if (roadAddr !== '') {
					document.getElementById("addrName").value = roadAddr
							+ extraRoadAddr;
				} else {
					document.getElementById("addrName").value = roadAddr + '';
				}

				var guideTextBox = document.getElementById("guide");
				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if (data.autoRoadAddress) {
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr
							+ ')';
					guideTextBox.style.display = 'block';

				} else if (data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr
							+ ')';
					guideTextBox.style.display = 'block';
				} else {
					guideTextBox.innerHTML = '';
					guideTextBox.style.display = 'none';
				}
			}
		}).open();
	}
</script>

<script type="text/javascript">
	function yesOrNo() {
		var indeed = confirm("탈퇴하시겠습니까??");
		if (indeed) {
			alert("탈퇴가 완료되었습니다.");
			location.href = '/shop/member/secessionProcess.jsp';
		} else {
			alert("탈퇴가 취소되었습니다.");
		}
	}

	/* 이름유효성 */
	function nameLimit() {
		/* 공백제한 */
		document.getElementById('nameName').value = document
				.getElementById('nameName').value.trim();
		/* 영문제한 */
		document.getElementById('nameName').value = document
				.getElementById('nameName').value.replace(/[A-Za-z0-9]/g, "");
		/* 특수문자제한 */
		document.getElementById('nameName').value = document
				.getElementById('nameName').value.replace(
				/[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/g, '');
	} /* 한글만입력가능한 자음,모음만따로 입력불가X */
	function kor() {
		var pattern = /([^가-힣\x20])/i;
		var name = document.getElementById('nameName').value;
		if (pattern.test(name)) {
			document.getElementById('nameName').value = "";
			alert("한글을 제대로 입력해주세요 ");
			document.update.nameName.focus();
		} else {
		}
	}

	/* 패스워드유효성 */
	function pwLimit() {
		/* 공백문자제한 */
		document.getElementById('pwName').value = document
				.getElementById('pwName').value.trim();
		document.getElementById('rePwName').value = document
				.getElementById('rePwName').value.trim();
		/* 입력할때마다글자수표시 */
		var num = document.getElementById('rePwName').value;
		var num2 = document.getElementById('pwName').value;
		switch (num.length) {
		case 0:
			cnt = 0;
			break;
		case 1:
			cnt = 1;
			break;
		case 2:
			cnt = 2;
			break;
		case 3:
			cnt = 3;
			break;
		case 4:
			cnt = 4;
			break;
		case 5:
			cnt = 5;
			break;
		case 6:
			cnt = 6;
			break;
		case 7:
			cnt = 7;
			break;
		case 8:
			cnt = 8;
			break;
		case 9:
			cnt = 9;
			break;
		case 10:
			cnt = 10;
			break;
		case 11:
			cnt = 11;
			break;
		case 12:
			cnt = 12;
			break;
		case 13:
			cnt = 13;
			break;
		case 14:
			cnt = 14;
			break;
		case 15:
			cnt = 15;
			break;
		case 16:
			cnt = 16;
			break;
		}

		if (num.length == 0) {
			document.getElementById('digit1').innerHTML = "";
			document.getElementById('digit1-2').innerHTML = "";
		} else if (num.length > 0 && num.length <= 6) {
			document.getElementById('digit1').style.color = 'red';
			document.getElementById('digit1').style.display = 'inline-block';
			document.getElementById('digit1').innerHTML = "  " + ' 위험';
			document.getElementById('digit1-2').style.display = 'inline-block';
			document.getElementById('digit1-2').innerHTML = "  " + '★';
		} else if (num.length > 6 && num.length <= 9) {
			document.getElementById('digit1').style.color = 'orange';
			document.getElementById('digit1').style.display = 'inline-block';
			document.getElementById('digit1').innerHTML = "  " + ' 적정';
			document.getElementById('digit1-2').style.display = 'inline-block';
			document.getElementById('digit1-2').innerHTML = "  " + '★★';
		} else if (num.length > 9 && num.length <= 16) {
			document.getElementById('digit1').style.color = 'blue';
			document.getElementById('digit1').style.display = 'inline-block';
			document.getElementById('digit1').innerHTML = ' 양호';
			document.getElementById('digit1-2').innerHTML = "  " + '★★★';
		}

		switch (num2.length) {
		case 0:
			cnt = 0;
			break;
		case 1:
			cnt = 1;
			break;
		case 2:
			cnt = 2;
			break;
		case 3:
			cnt = 3;
			break;
		case 4:
			cnt = 4;
			break;
		case 5:
			cnt = 5;
			break;
		case 6:
			cnt = 6;
			break;
		case 7:
			cnt = 7;
			break;
		case 8:
			cnt = 8;
			break;
		case 9:
			cnt = 9;
			break;
		case 10:
			cnt = 10;
			break;
		case 11:
			cnt = 11;
			break;
		case 12:
			cnt = 12;
			break;
		case 13:
			cnt = 13;
			break;
		case 14:
			cnt = 14;
			break;
		case 15:
			cnt = 15;
			break;
		case 16:
			cnt = 16;
			break;
		}

		if (num2.length == 0) {
			document.getElementById('digit2').innerHTML = "";

		} else if (num2.length > 0 && num2.length <= 6) {
			document.getElementById('digit2').style.color = 'red';
			document.getElementById('digit2').style.display = 'inline-block';
			document.getElementById('digit2').innerHTML = "  " + ' 위험';
		} else if (num2.length > 6 && num2.length <= 9) {
			document.getElementById('digit2').style.color = 'orange';
			document.getElementById('digit2').style.display = 'inline-block';
			document.getElementById('digit2').innerHTML = "  " + ' 적정';
		} else if (num2.length > 9 && num2.length <= 16) {
			document.getElementById('digit2').style.color = 'blue';
			document.getElementById('digit2').style.display = 'inline-block';
			document.getElementById('digit2').innerHTML = ' 양호';
		}
	}

	var same;
	/* 가입시 비밀번호 최소,최대자릿수 지정 + 특수문자,숫자,영어 들어가게하는함수 */
	function isSame() {
		var pw = document.getElementById('pwName').value;
		var rePw = document.getElementById('rePwName').value;
		/* pw의 숫자가 10이하, 16이상일때, */
		if ((pw.length < 10) || (pw.length > 16)) {
			alert('비밀번호는 10글자이상, 16글자 이하만 사용가능');
			document.getElementById('pwName').value = "";
			document.getElementById('pwName').value.focus();
		} /* pw 와 rePw 의 value 값이 하나라도 null 이 아닐때,  다른것이다.*/
		if (document.getElementById('pwName').value != ''
				&& document.getElementById('rePwName').value != '') {
			/* pw == rePw 같을때 */
			if (document.getElementById('pwName').value == document
					.getElementById('rePwName').value) {
				document.getElementById("kSame").innerHTML = "일치";
				document.getElementById('kSame').style.display = 'inline-block';
				document.getElementById("kSame").style.color = 'green';
			} else {
				document.getElementById("kSame").innerHTML = "불일치";
				document.getElementById('kSame').style.display = 'inline-block';
				document.getElementById("kSame").style.color = 'red';
				same = false;
			}
		}
	}

	/* 전화번호유효성 */
	function telLimit() {
		/* 특수문자,한글,영어,공백제한 */
		document.getElementById('telName').value = document
				.getElementById('telName').value.trim();
		document.getElementById('telName').value = document
				.getElementById('telName').value.replace(/[A-Za-z]/g, "");
		document.getElementById('telName').value = document
				.getElementById('telName').value.replace(
				/[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/g, '');
		document.getElementById('telName').value = document
				.getElementById('telName').value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '');
	}
	/* 자릿수 11자리 */
	function telMin() {
		var tel = document.getElementById('telName').value;
		if (tel.length == 11) {

			/* 전화번호자리수가 11자리가 아닐때, */
		} else {
			document.getElementById('telName').value = "";
			alert("전화번호양식에 맞춰주세요");
			document.update.telName.focus();
		}
	}

	/* 이메일유효성  한글,공백 제한*/
	function emailLimit() {
		document.getElementById('emailName').value = document
				.getElementById('emailName').value.trim();
		document.getElementById('emailName').value = document
				.getElementById('emailName').value
				.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '');
	}
	/* 이메일형식 맞춰주는 함수 */
	function emailCheck() {
		var email = document.getElementById("emailName").value;
		var exptext = /^[A-Za-z0-9]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		/* 형식에맞지않을때, */
		if (exptext.test(email) == false) {
			document.getElementById('emailName').value = "";
			alert("이메일형식이 올바르지않습니다.");
			document.join.k_email.focus();
			return false;
		}
	}

	function reEffectivenessCheck() {//회원가입 입력란을 입력하지 않았을때 경고창 기능

		/* var update = document.getElementsByName('update'); */
		var update = document.update;

		/* 이름  */
		if (document.getElementById('nameName').value != "") {

			alert("이름통과");
			/* 비밀번호 == 비밀번호확인  */
			if (document.getElementById('pwName').value == document
					.getElementById('rePwName').value) {
				alert("비밀번호통과");

				/* 주소 제대로  */
				if (document.getElementById('addrName').value != null) {
					alert("주소통과");

					update.action = "/shop/member/myPageProcess.jsp"
					update.submit();

				} else {
					alert("주소를제대로입력해주세요");
				}

			} else {
				alert("비밀번호가 다릅니다");
			}
  
		} else {
			/* 이름 == "" */
			alert("이름을 입력해주세요 ");
		}

	}
</script>

<%
	ArrayList<MemberDTO> list;
	MemberDAO dao = new MemberDAO();
	list = dao.bring(id);
%>
<article class="wrap">
	<h2>회원정보입력</h2>
	<section class="k_myPage c_mypage">
			<form name="update">
				<table>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="k_id" id="idName" value="<%=list.get(0).getId()%>"readonly>
						</td>
					</tr>
					
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="k_name" id="nameName" value="<%=list.get(0).getName()%>" required oninput="nameLimit()" onchange="kor()">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" name="k_pw" id="pwName" value="<%=list.get(0).getPw()%>" oninput="pwLimit()" onchange="isSame()">
							<span id="digit2" style="margin-top:10px;"></span>
							<span id="digit2-2" style="margin-top:10px;"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
						
						<td>
							<input type="password" name="k_repw" id="rePwName" value="<%=list.get(0).getPw()%>" oninput="pwLimit()" onchange="isSame()">
							<span id="digit1" style="margin-top:10px;"></span>
							<span id="digit1-2" style="margin-top:10px;"></span>
							<span id="kSame" style="margin-top:10px;"></span>
						</td>
					</tr>
					
					<tr>
						<th>연락처</th>
						<td>
							<input type="text" name="k_tel" id="telName" value="<%=list.get(0).getTel()%>" oninput="telLimit()" onchange="telMin()" maxlength="11">
						</td>
					</tr>
					
					<tr>
						<th>주소</th>
						<td>
							<input type="text" name="k_addr" id="addrName" value="<%=list.get(0).getAddr()%>" readonly="readonly" style="width:70%; float:left; margin-right:2%;">
							<input type="button" value="주소찾기" onclick="sample4_execDaumPostcode()"  style="width:28%; border:1px solid #cccccc; background:#dddddd; margin-bottom:0; font-weight:bold; margin-right:0;">
						</td>
					</tr>
					
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" name="k_email" id="emailName" value="<%=list.get(0).getEmail()%>" oninput="emailLimit()" onchange="emailCheck()" style="background-color: #e2e2e2;" readonly>
						</td>
					</tr>
					
					<tr>
						<th>가입일</th>
						<td>
							<input type="text" readonly="readonly" name="k_date" id="dateName" value="<%=list.get(0).getDate()%>"readonly>
						</td>
					</tr>
				</table>
				
				<input type="button"  onclick="reEffectivenessCheck()" value="변경">
				<input type="button" onclick="yesOrNo();" value="탈퇴하기">
				<input type="button" onclick="location='/shop/member/mySelectPage.jsp'" value="취 소" style="margin-right: 0;">
			</form>
			
			<b>
				<a href="/shop/board/personReview.jsp">내 게시물 확인 하러가기 ▶</a>
			</b>
	</section>

</article>
</body>
</html>