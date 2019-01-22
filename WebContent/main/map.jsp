<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- header & 최근본상품목록  -->
<%@ include file="header.jsp"%>
<%@ include file="viewlist.jsp"%>

<article class="wrap">
	<h2>S T O R E</h2>
	<section class="store">
		<h3>STORE - 애드원쇼핑몰</h3>
		<p>서울시 금천구 가산동 371-37 STX-V 타워 606호</p>
		<div>
			<h3>연 락 처</h3>
			<p>+82 54 857 8801~2</p>
		</div>
		
		<div style="margin-right:0;">
			<h3>영업시간</h3>
			<p>월요일 - 일요일: 10:30-21:30</p>
		</div>
		
		<h3 style="margin-bottom:10px;">소 개 글</h3>
		<p style="margin-bottom:0; line-height: 18px;">애드원쇼핑몰은 1933년 테니스 선수 르네 라코스트에 의해 설립된 프랑스의 의류 브랜드이다.
		라코스테는 클래식 스포츠 웨어 의류 브랜드와 프리미엄 캐주얼 브랜드라는 이미지를 가지고 있다.</p>
	</section>

	<section id="maparea"></section>
	<script>
    function initMap() {
        var myLatLng = {lat:  37.477245, lng: 126.883585};
   
        var map = new google.maps.Map(document.getElementById('maparea'), {
          zoom: 17,
          center: myLatLng
        });

        var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: 'KGITBANK 구로점'
        });
      }

    </script>
    
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCBBtmC9CC7euFoiLkpph0YFccqGwfjdts&callback=initMap">
    </script>
</article>

</body>
</html>