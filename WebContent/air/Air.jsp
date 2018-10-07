<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>어디로가야하오</title>
<style type="text/css">
.dropmid {
	position: relative;
	left: 800px;
	bottom: 163px;
	border: 1px solid #ddd;
	border-radius: 15px;
	width: 400px;
	height: 300px;
	background-color: white;
}

.plus {
	background-color: #4CAF50;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	width: 50px;
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	cursor: pointer;
	border-radius: 35px;
	position: absolute;
	top: 150px;
	left: 20px;
}

.plus p {
	font-size: 40px;
}

#numberUpDown {
	border: none;
	width: 50px;
	height: 30px;
	position: absolute;
	top: 158px;
	left: 80px;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}

.minus {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	width: 50px;
	height: 48px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
	border-radius: 25px;
	position: absolute;
	top: 150px;
	left: 140px;
}

.minus p {
	font-size: 40px;
	text-align: center;
	margin-bottom: 20px;
}

#chice {
	text-align: right;
	position: relative;
	top: 95px;
	margin-top: 10px;
}

#chice a {
	text-decoration: none;
	color: #00B4DB;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/webPro/air/css/header.css">
<link rel="stylesheet" type="text/css" href="/webPro/air/css/main.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script>
	$(function() {
		var availableTags = [ "인천", "도쿄", "뉴욕", "제주국제공항", "청주국제공항", "대구국제공항",
				"무안국제공항", "양양국제공항"

		];
		$("#departure").autocomplete({
			source : availableTags
		});
	});

	$(function() {
		var availableTags = [ "인천", "도쿄", "뉴욕", "제주국제공항", "청주국제공항", "대구국제공항",
				"무안국제공항", "양양국제공항"

		];
		$("#arrival").autocomplete({
			source : availableTags
		});

	});

	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : 'yy-mm-dd'
		});

		$("#datepicker2").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});

	$(function() {
		$('.minus').click(function(e) {
			e.preventDefault();
			var stat = $('#numberUpDown').text();
			var num = parseInt(stat, 10);
			num--;
			if (num <= 0) {
				alert('더이상 줄일수 없습니다.');
				num = 1;
				$("#cityclick").val(num + ' 승객');
			} else {
				$('#numberUpDown').text(num);
				$("#cityclick").val(num + ' 승객');
			}

		});
		$('.plus').click(function(e) {
			e.preventDefault();
			var stat = $('#numberUpDown').text();
			var num = parseInt(stat, 10);
			num++;

			if (num > 3) {
				alert('더이상 늘릴수 없습니다.');
				num = 3;
			}

			$('#numberUpDown').text(num);
			$("#cityclick").val(num + ' 승객');
			$("#personsHidden").val(num);
		});
	});

	$(function() {
		$(".dropmid").hide();
		$("#cityclick").click(function() {
			$(".dropmid").show("slow");

		});

		$("#chice").click(function(e) {
			if (!$(e.target).is("#cityclick") && !$(e.target).is(".dropmid")) {
				$(".dropmid").slideUp();
			}
		});
	});

	$(function() {
		$(".ow-radio").click(function() {
			$("#datepicker2").val('편도');
			$("#datepicker2").attr("disabled", true);
		});

		$(".rd-radio").click(function() {
			$("#datepicker2").val('오는 날짜');
			$("#datepicker2").attr("disabled", false);
		});

	});
</script>
<script type="text/javascript">
function searchTicket() {
	var obj = document.reser;
	if (obj.departure.value != "" && obj.arrival.value != "") {
		obj.submit();
	} else {
		if (obj.departure.value == "") {
			alert('출발 공항을 입력해주세요.');
			return false;
		}
		if (obj.arrival.value == "") {
			alert('도착 공항을 입력해주세요.');
			return false;
		}
	}
}
</script>
<body>
	<div id="wrap">
		<header > 
			<nav id="top_menu">
			<ul>
				<li><a href="AirLogin.jsp">로그인</a></li>
				<li><a href="AirLogin.jsp">로그아웃 </a></li>
			</ul>
			</nav> 
			
			<nav id="main_menu">
				<ul>
					<li><a href="company.html">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회사소개</a></li>
					<li><a href="lantal.html">예약</a></li>
					<li><a href="local.html">지역</a></li>
					<li><a href="#">안내</a></li>
					<li><a href="#">마이페이지</a></li>
				</ul>
			</nav> 
		</header>
	</div>
	<div id="dot">
		<form class="reservation" action="AfterSearch.jsp" name="reser" method="post" >

			<p>
				<input class="rd-radio" type="radio" id="way" name="way"
					value="roundtrip" checked> <label id="rdlabel">왕복</label>
			</p>

			<p>
				<input class="ow-radio" type="radio" id="way" name="way"
					value="oneway"> <label id="owlabel">편도</label>
			</p>

			<div class=total>
				<input type="text" class="departure" aria-invalid="false"
					autocomplete="off" id="departure" placeholder="국가, 도시 또는 공항"
					name="departure">
				<button class="btn" id="btn">
					<img id="img" src="img/exchange.png">
				</button>
				</input>
				<!-- ajax-->


				<input type="text" class="arrival" aria-invalid="false"
					autocomplete="off" id="arrival" placeholder="국가, 도시 또는 공항"
					name="arrival">
				<!-- ajax-->


				<input type="text" class="departure" aria-invalid="false"
					autocomplete="off" id="datepicker1" placeholder="출발 날짜"
					name="datepicker1">
				<!-- ajax-->

				<input type="text" class="departure" aria-invalid="false"
					autocomplete="off" id="datepicker2" placeholder="도착 날짜"
					name="datepicker2">
				<!-- ajax-->

				<input type="button" class="seat" id="cityclick"
					aria-invalid="false" autocomplete="off" id="origin-fsc-search"
					name="" value="1 승객">
				<!--onclick-->
				<input type="hidden" id="personsHidden" name="persons" value="1">
				<div class="sub">
					<p>
						<button type="button" class="submit" id="" name=""
							onclick="searchTicket()">
							<span>항공권 검색</span>
						</button>
						<!--onclick-->
					</p>



				</div>
			</div>

			<div class="dropmid">
				<ul>
					<li><p
							style="text-align: center; font-weight: bold; font-size: 20px;">좌석
							등급</p></li>
					<li><p
							style="background-color: #ddd; font-size: small; border-radius: 10px; height: 60px; margin: 10px;">
							&nbsp;&nbsp;&nbsp;<b>검색하신 노선은 일반석 가격만 보여 드릴 수 있습니다.</b><br>일등석
							옵션을 보려면 정확한 날짜 및/또는 도착지 도시 이름을 알려주세요.
						</p></li>
					<li><label
						style="font-weight: bold; font-size: 20px; margin-left: 23px;">성인</label>
						<button class="plus">
							<p class="p">+</p>
						</button> <span id="numberUpDown">0</span>
						<button class="minus">
							<p class="m">-</p>
						</button></li>

					<li
						style="font-size: 10px; color: gray; position: relative; top: 80px;">
						여행 시 탑승객의 나이는 예약된 연령 범주에 부합해야 합니다. 항공사는 만 18세 미만의 단독 여행 탑승객에 대한
						제한이 있습니다.</li>
					<hr
						style="border-bottom: 1px solid #ddd; position: relative; top: 95px; width: 100%;"></hr>
					<li id="chice"><a href="#">선택완료</a></li>
				</ul>

			</div>
		</form>

	</div>


	<div id="new">
		<!-- new product -->
		<h2>
			<span>여행</span> <span id="product">추천 패키지</span>
		</h2>

		<div class="busan_div">
			<a href="/webPro/air/AirBoardList.jsp?category=busan"><img src="img/busan.jpg" alt="Avatar" class="busan_image"
				style="width: 100%"></a>
			<div class="middle_busan_txt">
				<div class="busan_txt">부산여행코스추천</div>
			</div>
		</div>
		<div class="busan_div">
			<img src="img/busanfood.png" alt="Avatar" class="busan_image"
				style="width: 100%">
			<div class="middle_busan_txt">
				<div class="busan_txt">부산 맛집BEST</div>
			</div>
		</div>
		<div class="busan_div">
			<img src="img/busanfestival.jpg" alt="Avatar" class="busan_image"
				style="width: 100%">
			<div class="middle_busan_txt">
				<div class="busan_txt">부산축제</div>
			</div>
		</div>

		<div class="Seoul_div">
			<a href= "/webPro/air/AirBoardList.jsp?category=seoul" >
			<img src="img/Seoul.jpg" alt="Avatar" class="Seoul_image" style="width: 100%">
			<div class="middle_Seoul_txt">
				<div class="Seoul_txt">서울여행코스추천</div>
			</div>
			
		</div>
		<div class="Seoul_div">
			<img src="img/Seoulfood.jpg" alt="Avatar" class="Seoul_image"
				style="width: 100%">
			<div class="middle_Seoul_txt">
				<div class="Seoul_txt">서울맛집BEST</div>
			</div>
		</div>
		<div class="Seoul_div">
			<img src="img/Seoulfestival.jpg" alt="Avatar" class="Seoul_image"
				style="width: 100%">
			<div class="middle_Seoul_txt">
				<div class="Seoul_txt">서울축제</div>
			</div>
		</div>


		<div class="jeju_div">
			<a href="/webPro/air/AirBoardList.jsp?category=jeju"><img src="img/jeju.jpg" alt="Avatar" class="jeju_image"
				style="width: 100%">
			<div class="middle_jeju_txt">
				<div class="jeju_txt">제주도여행코스</div>
			</div>
		</div>
		<div class="jeju_div">
			<img src="img/jejufood.jpg" alt="Avatar" class="jeju_image"
				style="width: 100%">
			<div class="middle_jeju_txt">
				<div class="jeju_txt">제주도맛집BEST</div>
			</div>
		</div>
		<div class="jeju_div">
			<img src="img/jejufestival.png" alt="Avatar" class="jeju_image"
				style="width: 100%">
			<div class="middle_jeju_txt">
				<div class="jeju_txt">제주도축제</div>
			</div>
		</div>

		<div class="clear"></div>

		<div class="contents_footer">

			<div id="footer_txt">
				<h3>탐색</h3>
				<ul id="ftxt1">
					<li><a href="#">도시</a></li>
					<li><a href="#">주말여행</a></li>
					<li><a href="#">공항</a></li>
					<li><a href="#">항공사</a></li>
					<li><a href="#">항공권</a></li>
				</ul>
			</div>
			<div id="footer_txt">
				<h3>회사</h3>
				<ul id="ftxt1">
					<li><a href="#">회사소개</a></li>
					<li><a href="#">회사정보</a></li>
					<li><a href="#">개인정보처리방침</a></li>
					<li><a href="#">서비스약관</a></li>
					<li><a href="#">서비스정책</a></li>
				</ul>
			</div>
			<div id="footer_txt">
				<h3>탐색</h3>
				<ul id="ftxt1">
					<li><a href="#">도시</a></li>
					<li><a href="#">주말여행</a></li>
					<li><a href="#">공항</a></li>
					<li><a href="#">항공사</a></li>
					<li><a href="#">항공권</a></li>
				</ul>
			</div>
			<div id="footer_txt">
				<h3>탐색</h3>
				<ul id="ftxt1">
					<li><a href="#">도시</a></li>
					<li><a href="#">주말여행</a></li>
					<li><a href="#">공항</a></li>
					<li><a href="#">항공사</a></li>
					<li><a href="#">항공권</a></li>
				</ul>
			</div>
			<div id="footer_txt">
				<h3>탐색</h3>
				<ul id="ftxt1">
					<li><a href="#">도시</a></li>
					<li><a href="#">주말여행</a></li>
					<li><a href="#">공항</a></li>
					<li><a href="#">항공사</a></li>
					<li><a href="#">항공권</a></li>
				</ul>
			</div>
		</div>



	</div>
</body>
</html>