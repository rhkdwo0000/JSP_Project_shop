<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>    
    
<!-- header & 최근본상품목록  -->
<%@ include file="/main/header.jsp"%>
<%@ include file="/main/viewlist.jsp"%>

<% if(session.getAttribute("id") != null){ %>
		 <script type="text/javascript">
				location.href = "/shop/main/index.jsp";
		</script>   

<%} %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<article class="wrap">
	<h2>L O G I N</h2>
	<section class="c_login">
		<form action="/shop/member/loginok.jsp" method="post">
			<table>
	            <tr>
	               <th>아이디</th>
	               <td><input type="text" name="id" placeholder="4~10자리입력" required></td>
	            </tr>
	            <tr>
	               <th>비밀번호</th>
	               <td><input type="password" name="pw" placeholder="4~10자리입력"></td>
	            </tr>
	         </table>
	
	         <ul>
	            <li><a href="/shop/member/memberfind.jsp">아이디&비밀번호 찾기</a></li>
	            <li><a href="/shop/member/join.jsp">회 원 가 입</a></li>
	         </ul>
	         <input type="submit" value="로 그 인">
		</form>
			
		<div class="c_snslogin" style="text-align:center;">
		    <%//네이버 버튼 생성
			    String clientId = "e3FTvfu7uRnuSq28hSPF";//애플리케이션 클라이언트 아이디값";
			    String redirectURI = URLEncoder.encode("http://localhost:7777/shop/member/callback.jsp", "UTF-8");
			    SecureRandom random = new SecureRandom();
			    String state = new BigInteger(130, random).toString();
			    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
			    apiURL += "&client_id=" + clientId;
			    apiURL += "&redirect_uri=" + redirectURI;
			    apiURL += "&state=" + state;
			    session.setAttribute("state", state);
		    %>
		    <a href="<%=apiURL%>" style="display:inline-block; width:49%; float:left; margin-right:2%;">
		       	<img src="/shop/images/naverlogin.png"/>
		   </a> 
	   
	         <!-- 카카오 버튼 생성 -->
	         <a id="kakao-login-btn" style="display:inline-block; width:49%; float:left;"></a> 
	         <a href="http://developers.kakao.com/logout"></a>
	         <script type='text/javascript'>
	            //<![CDATA[
	            // 사용할 앱의 JavaScript 키를 설정해 주세요.
	            Kakao.init('a3ad685f1776c39d25d14cf85937fa94');
	            // 카카오 로그인 버튼을 생성합니다.
	            Kakao.Auth.createLoginButton({
	               container : '#kakao-login-btn',
	               success : function(authObj) {
	                  //로그인 성공시 ,API를 호출합니다
	                  Kakao.API.request({
	                     url : '/v1/user/me',
	                     success : function(res) {
	                        //alert(JSON.stringify(res)); res에 담겨있는 json값을 모두 볼 수 있다.
	                        /* alert(res.properties.nickname+'님 환영합니다'); */
	
	                    	 location.href = "/shop/main/index.jsp?id=kakao_" + res.properties.nickname; 
	                     },
	                     fail : function(error) {
	                        alert(JSON.stringify(error));
	                     }
	                  });
	               },
	               fail : function(err) {
	                  alert(JSON.stringify(err));
	               }
	            });
	            //]]>
	         </script>
		</div>
	</section>
</article>

</body>
</html>