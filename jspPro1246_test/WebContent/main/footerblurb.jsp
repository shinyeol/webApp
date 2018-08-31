<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a27e653bf84259ee0ddb7bdbbe399134"></script>
	
	<script type="text/javascript">
		$(function() {
			 var mapContainer = document.getElementById('map'),
			    mapOption = { 
			        center: new daum.maps.LatLng(37.535820, 127.133773),
			        level: 5
			    };
			var map = new daum.maps.Map(mapContainer, mapOption);
		
			var markerPosition  = new daum.maps.LatLng(37.535820, 127.133773);
		
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});
			marker.setMap(map);
		
		});
	</script>	
	
<div id="footerblurb-inner">
	<div class="column">
		<h2>
			자바빈즈 <span>대표전화</span>
		</h2>
		<h2>
			<span style="color: #BCCE98;">02-0000-0000</span>
		</h2>
			<p>업무시간 : AM 10:00 ~ PM 5:30 <br>
				주말, 공휴일 휴무</p>
			<p>문의메일 : mail@javabeans.com</p>
			<p>fax : 02-0000.0001</p>
		
	</div>

	<div class="column">
		<h2>
			무통장입금 <span>계좌번호</span>
		</h2>
		<p>
			기업	00 - 0000 - 000<br>
			국민	000000 -00 - 000000<br>
			하나	000 - 000000 - 00000<br>
			신한	000 - 000 - 000000<br>
			우리	0000 - 000 - 000000<br>
			농협	000 - 0000 - 0000 - 00<br><br>
			예금주 (주)자바빈즈
		</p>
		<p>
			입금확인시간<br>
			AM 09:00 | PM 01:00<br>
			AM 10:30 | PM 03:00
		</p>
	</div>

	<div class="column">
		<h2>
			자바빈즈 <span>위치</span>
		</h2>
		<p>
			서울특별시 강동구 천호대로 1095 현대코아 3층
		</p>
		<div id="siteMap">
			<div id="map" style="width: auto; height: 252px;"></div>
		</div>
	</div>

	<div class="clr"></div>
</div>