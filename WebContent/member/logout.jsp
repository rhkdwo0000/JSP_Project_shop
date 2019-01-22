<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%if(((String)session.getAttribute("id")).split("_")[0].equals("naver")){ 
		session.removeAttribute("id");%>
 			<iframe style="width: 0px;height: 0px" src="https://nid.naver.com/nidlogin.logout?returl=https://www.naver.com/" onload="logOutFinish();"></iframe>
  				 <script type="text/javascript">
   					function logOutFinish() {
	  					 alert('로그아웃 되었습니다.');
      				location.href = '/shop/main/index.jsp';
   					}
   				</script>
 
 <%}else if(((String)session.getAttribute("id")).split("_")[0].equals("kakao")){ 
  		 session.removeAttribute("id");%>
 			<iframe style="width: 0px;height: 0px" src="https://accounts.kakao.com/xlogout?continue=http://pubg.game.daum.net/pubg/index.daum" onload="logOutFinish();"></iframe>
  				 <script type="text/javascript">
  					 function logOutFinish() {
	  					 alert('로그아웃 되었습니다.');
      				location.href = '/shop/main/index.jsp';
  					 }
  				 </script>
 <%}else{
	 session.removeAttribute("id");
 %>
	 <%="<script>"%>
		<%="alert('로그아웃 되었습니다.');" %>
		<%="location.href='/shop/main/index.jsp';"%>
	<%="</script>"%> 
	  
  <%} %>
