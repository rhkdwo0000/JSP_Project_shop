<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//로그인 성공한 아이디 값을 session에 저장
	String id = (String)session.getAttribute("id");
%>
<!doctype html>
<html>
<head>
<meta content="text/html; charset=utf-8">
<title>title</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link href="/shop/css/import.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script type="text/javascript" src="/shop/js/jquery.DB_tabBanner32.min.js"></script>
<script type="text/javascript"	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"	charset="utf-8"></script>
<!-- 이미지슬라이드 스크립트 -->
<script>
	$(document).ready(function(){
		$('.c_index_slide').DB_tabBanner32({
			key:"c37080",
			motionType:"x",           
			moveSpeed:500,                
			autoRollingTime:5000 
		});

	/*.db_tab의 높이 값을 img의 높이값과 동일하게 적용*/
		var img_hei = $('.c_index_slide .imgSet li a img ').height();
		$('.c_index_slide').css('height' , img_hei);

		$('.c_index_slide .imgSet').css('height' , img_hei);

	/*pre,next over 시 화살표 보이기 , 숨기기 스크립트*/
		$('.c_index_slide').mouseenter(function(){
			$('.c_index_slide .prevBtn').animate({'left' : 0});
		});

		$('.c_index_slide').mouseenter(function(){
			$('.c_index_slide .nextBtn').animate({'right' : 0});
		});

		$('.c_index_slide').mouseleave(function(){
			$('.c_index_slide .prevBtn').animate({'left' : -70});
		});

		$('.c_index_slide').mouseleave(function(){
			$('.c_index_slide .nextBtn').animate({'right' : -70});
		});

		$('.wrap').mousemove(function(e){
			$('.follow').css({'top':e.pageY , 'left':e.pageX})
		});
	});
</script>
</head>

<body>
	<!-- header 영역 -->
	<header>
		<h1>
			<a href="/shop/main/index.jsp" style="display: inline-block; width: 100%;">
				<img src="/shop/images/logo.png" alt="logo_img">
			</a>
		</h1>
	<%	if(id == null){%>												<!-- 비로그인시 -->
		<nav>
			<ul class="header1">
				<li><a href="/shop/main/best.jsp"> BEST </a></li>
				<li><a href="/shop/main/top.jsp"> TOP </a></li>
				<li><a href="/shop/main/bottom.jsp"> BOTTOM </a></li>
				<li><a href="/shop/main/map.jsp"> STORE</a></li>
				<li><a href="/shop/board/reviewboardlist.jsp"> REVIEW </a></li>
				<li><a href="/shop/board/adminboardlist.jsp"> NOTIC </a></li>
			</ul>
		</nav>
		
		<div class="submenu1">
			<ul>
				<li><a href="/shop/member/login.jsp">LOGIN</a></li>
				<li><a href="/shop/member/join.jsp">JOIN</a></li>
				<li><a href="/shop/product/basket.jsp">BASKET</a></li>
			</ul>
		</div>
	<%}else if(id.equals("admin123")){%>										<!-- 관리자로그인시 -->
		<nav>
			<ul class="header2">
				<li><a href="/shop/main/best.jsp"> BEST </a></li>
				<li><a href="/shop/main/top.jsp"> TOP </a></li>
				<li><a href="/shop/main/bottom.jsp"> BOTTOM </a></li>
				<li><a href="/shop/main/map.jsp"> STORE</a></li>
				<li><a href="/shop/board/reviewboardlist.jsp"> REVIEW </a></li>
				<li><a href="/shop/admin/admin.jsp"> ADMIN </a></li>
			</ul>
		</nav>
		
		<div class="submenu2">
			<ul>
				<li style="font-weight: bold;">관리자님 안녕하세요.</li>
				<li><a href="/shop/member/logout.jsp">LOGOUT</a></li>
			</ul>
			
		</div>
	<%}else {%>																<!-- 회원로그인시 -->	
		<nav>
			<ul class="header1">
				<li><a href="/shop/main/best.jsp"> BEST </a></li>
				<li><a href="/shop/main/top.jsp"> TOP </a></li>
				<li><a href="/shop/main/bottom.jsp"> BOTTOM </a></li>
				<li><a href="/shop/main/map.jsp"> STORE</a></li>
				<li><a href="/shop/board/reviewboardlist.jsp"> REVIEW </a></li>
				<li><a href="/shop/board/adminboardlist.jsp"> NOTIC </a></li>
			</ul>
		</nav>
		
		<div class="submenu3">
			<ul>
				<li><%=(String)session.getAttribute("id") %> 님<br> 안녕하세요.</li>
				<li><a href="/shop/member/passwordInput.jsp">MYPAGE</a></li>
				<li><a href="/shop/product/basket.jsp">BASKET</a></li>
				<li><a href="/shop/member/logout.jsp">LOGOUT</a></li>
			</ul>
		</div>
		
	<%}%>











	
	
		
		
		
	</header>