<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>
<script>
	var request = new XMLHttpRequest();

	/* 임시비밀번호+@ 서블릿 send */
	function sendTemporary() {
		temporary();
		request.open("Post","/shop/SendTemporaryPassword?k_temporary="
			+ encodeURIComponent(document.getElementById('k_temporary').value)
			+ "&k_title="+ encodeURIComponent(document.getElementById('k_title').value)
			+ "&k_content="+ encodeURIComponent(document.getElementById('k_content').value)
			+ "&k_from="+ encodeURIComponent(document.getElementById('k_from').value)
			+ "&k_id="+ encodeURIComponent(document.getElementById('k_id').value)
			+ "&k_name="+ encodeURIComponent(document.getElementById('k_name').value)
			+ "&k_email="+ encodeURIComponent(document.getElementById('k_email').value), true);
		request.onreadystatechange = sendEmail;
		request.send();
	}

	var tempCode;

	function sendEmail() {
		if (request.readyState == 4 && request.status == 200) {
			tempCode = request.responseText;
			alert(request.responseText);
			if (tempCode == "비밀번호 찾기가 실패 되었습니다.") {
				alert("정보를 다시 확인해주시기바랍니다.");
			} else if (tempCode == "임시비밀번호가 전송되었습니다.") {
				location.href = "/shop/member/findall.jsp";
			}
		}
	}

	/* 임시비밀번호생성 */
	function temporary() {
		var total = "";
		var randomNumber = "";
		var temporarySecret = "";
		var rand = "";
		var specialCharacters = "";
		for (var i = 0; i < 3; i++) {
			specialCharacters = Math.floor(Math.random() * 8);
			rand = Math.floor(Math.random() * 100) + 1;
			switch (specialCharacters) {
			case 0:
				specialCharacters = "!";
				break;
			case 1:
				specialCharacters = "@";
				break;
			case 2:
				specialCharacters = "#";
				break;
			case 3:
				specialCharacters = "$";
				break;
			case 4:
				specialCharacters = "%";
				break;
			case 5:
				specialCharacters = "^";
				break;
			case 6:
				specialCharacters = "&";
				break;
			case 7:
				specialCharacters = "*";
				break;
			}
			randomNumber = randomNumber + rand;
			temporarySecret = temporarySecret + specialCharacters;
			total = randomNumber + temporarySecret;
		}
		document.getElementById('k_temporary').value = total;
	}
</script>

<article class="wrap">
	<h2>비 밀 번 호 찾 기</h2>

	<section class="memberfind">
		<p style="font-size: 13px; text-align: center; margin-bottom:20px; line-height: 18px;">
		회원가입 시, 입력하신 회원정보 또는 본인인증으로 아이디와 비밀번호를 확인할 수 있습니다.<br>
		비밀번호는 가입 시 적어주신 이메일로 보내드립니다.</p>
		<form>
			<table>
				<tr>
					<td style="display: none"><input type="hidden"
						name="temporaryName" id="k_temporary"> <input type="hidden"
						name="titleName" id="k_title" value="회원님의 임시비밀번호입니다."> <input
						type="hidden" name="contentName" id="k_content"
						value=" 임시비밀번호로 로그인후에 비밀번호를 변경해주세요  "> <input type="hidden"
						name="fromName" id="k_from" value="khr1287@naver.com"></td>
				</tr>
				<tr style="padding-left: 150px">
					<th>아이디</th>
					<td><input type="text" name="idName" id="k_id"></td>
				</tr>
				<tr>
					<th>이 름</th>
					<td><input type="text" name="nameName" id="k_name"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text"
						style="width: 150; align-content: center" name="emailName"
						id="k_email"></td>
				</tr>
			</table>
			
			<div>
				<input type="reset" value="초기화">
				<input type="button" value="다음" onclick="sendTemporary()">
			</div>
		</form>
	</section>
</article>

</body>
</html>