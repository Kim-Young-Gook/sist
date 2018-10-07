<%@page import="sist.com.bean.AirSchedule"%>
<%@page import="java.util.List"%>
<%@page import="sist.com.dao.LineDao"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>어디로가야하오</title>
<style type="text/css">
 .re_search{
	position:absolute; left:170px; top:100px;
	background-image: url("/webPro/air/img/airplane.jpg");
	height: 300px;
    padding: 24px;
    width: 100%;
    background-size: cover;
    background-position: 40% 70%;
    background-repeat: no-repeat;
    margin: 80px; auto;
    
    }


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
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	width: 50px;
	-webkit-transition-duration: 0.4s; /* Safari */
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

.ad {
	border: 1px solid red;
	width: 50px;
	height: 30px;
	position: absolute;
	top: 158px;
	left: 80px;
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


 #ta{
	position:relative; left:400px; top:550px;
	border: 1px solid #D8D8D8;
    border-radius: 15px;
    text-align: center;
    font-weight: bold;
}


#dott{
border: none;
background-image: url("/webPro/air/img/dotted-line.png");
background-repeat: repeat-y;
 padding: 10px;
 margin: 0px;
 width: 180px;
}

#dott2{
border: none;
background-image: url("/webPro/air/img/dotted-line.png");
background-repeat: repeat-y;
 padding: 40px;
}

#trip_img{
position: absolute;
bottom: 65px;
right: 650px;
}


#trip_img2{
position: absolute;
bottom: 5px;
right: 650px;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/webPro/air/css/header.css">
<link rel="stylesheet" type="text/css" href="/webPro/air/css/main.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
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
	
	$(function() {
		$("table").mouseover(function() {
			$("table").css({'box-shadow': '0 5px 5px 0 rgba(37,32,31,.5)'});
		});
		
		$("table").mouseleave(function() {
			$("table").css({'box-shadow':'none'});
		});
		
		$("table").click(function() {
			location.href='InfoSearch.jsp?';
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


<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	HashMap<String, Object> map = new HashMap<String, Object>();

	String departure = request.getParameter("departure");
	String arrival = request.getParameter("arrival");
	String datepicker1 = request.getParameter("datepicker1");
	String datepicker2 = request.getParameter("datepicker2");
	String persons = request.getParameter("persons");
	int totalRow = 0;

	map.put("departure", departure);
	map.put("arrival", arrival);
	map.put("datepicker1", datepicker1);
	map.put("persons", persons);
	totalRow = LineDao.getTotalRow(map);

	int pageScale = 10;
	int currentPage = 1;
	int totalPage = totalRow % pageScale == 0 ? (totalRow / pageScale) : (totalRow / pageScale) + 1;
	if (totalRow == 0)
		totalPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("page"));
	} catch (Exception e) {

	}

	int end = currentPage * pageScale;
	int start = end - pageScale + 1;

	int blockScale = 2;
	int currentBlock = currentPage % blockScale == 0 ? (currentPage / blockScale)
			: (currentPage / blockScale) + 1;
	int endPage = blockScale * currentBlock;
	int startPage = endPage - blockScale + 1;
	if (totalPage <= endPage) {
		endPage = totalPage;
	}

	int beforePage = currentPage - 1;
	if (beforePage == 0) {
		beforePage = 1;
	}
	int nextPage = currentPage + 1;
	if (nextPage == totalPage + 1) {
		nextPage = totalPage;
	}

	map.put("start", start);
	map.put("end", end);

	List<AirSchedule> list = null;
	List<AirSchedule> list2 = null;
	list = LineDao.selectSchedule(map);
	if (request.getParameter("way") != null && request.getParameter("way").equals("roundtrip")) {
		HashMap<String, Object> map2 = new HashMap<String, Object>();

		map2.put("datepicker1", datepicker2);
		map2.put("persons", persons);
		map2.put("departure", arrival);
		map2.put("arrival", departure);
		map2.put("start", start);
		map2.put("end", end);

		list2 = LineDao.selectSchedule(map2);
	}
%>
<body bgcolor="#ffffff">
	<div id="wrap">
		<header> <nav id="top_menu">
		<ul>
			<li><a href="AirLogin.jsp">로그인</a></li>
			<li><a href="AirLogin.jsp">로그아웃 </a></li>
		</ul>
		</nav> <nav id="main_menu">
		<ul>
			<li><a href="company.html">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회사소개</a></li>
			<li><a href="lantal.html">예약</a></li>
			<li><a href="local.html">지역</a></li>
			<li><a href="#">안내</a></li>
			<li><a href="#">마이페이지</a></li>
		</ul>
		</nav> 
		
	</header>
	<div class="re_search">
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
							<span>항공권 재검색</span>
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
					<hr style="border-bottom: 1px solid #ddd; position: relative; top: 95px; width: 100%;"></hr>
					<li id="chice"><a href="#">선택완료</a></li>
				</ul>

			</div>
		</form>

	</div>
	</div>
	<!-- 상단부 끝 검색 결과 시작 -->
	
	<form action="">
	<table id="ta">
		<colgroup>
			<col width="130" />
			<col width="130" />
			<col width="130" />
			<col width="130" />
			<col width="130" />
			<col width="130" />
			<col width="130" />
			<col width="130" />
		</colgroup>
		<thead>
			<tr>
				<th>항공사명</th>
				<th>출발공항</th>
				<th>출발시간</th>
				<th>소요시간</th>
				<th>도착공항</th>
				<th>도착시간</th>
				<th><div class="dott" id="dott"></div><!-- <img src="/webPro/air/img/dotted-line.png" width="150"> --> </th>
				<th>가격</th>
			</tr>
		</thead>

		<tbody id="tb">
			<%
				for (int i = 0; i < list.size(); i++) {
					AirSchedule as = new AirSchedule();
					as = list.get(i);
					if (request.getParameter("way") != null && request.getParameter("way").equals("roundtrip")) {
						for (int j = 0; j < list2.size(); j++) {
							AirSchedule as2 = new AirSchedule();
							as2 = list2.get(i);
			%>
			<!-- 항공사명/출발공항/출발시간/소요시간/도착시간/도착공항/가격 -->
			
			<tr style="text-align:center; font-weight:bolder;">
				
			
				
				<td><%=as.getAL_NO()%><br><br><br><%=as2.getAL_NO()%></td>
				<td><%=as.getAP_NO()%><br><br><br><%=as2.getAP_NO()%></td>
				<td><%=as.getARRIVALTIME()%><br><br><br><%=as2.getARRIVALTIME()%></td>
				<td><%=as.getLEAD()%><br><br><br><%=as2.getLEAD()%><img id="trip_img" src="/webPro/air/img/travel.png" width="30" height="30"></td>
			
				<td><%=as.getAP_NO2()%><br><br><br><%=as2.getAP_NO2()%></td>
				<td><%=as.getDEPARTTIME()%><br><br><br><%=as2.getDEPARTTIME()%></td>
				<td><img src="/webPro/air/img/dotted-line.png" width="150"></div></td>
				<td><%=as.getCOST()%><br><br><br><%=as2.getCOST()%></td>
			
				
			</tr>
			
			<%
				}
					} else {
			%>
			
			

			<tr>
				
				
				<td><%=as.getAL_NO()%></td>
				<td><%=as.getAP_NO()%></td>
				<td><%=as.getARRIVALTIME()%></td>
				<td><%=as.getLEAD()%><img id="trip_img2" src="/webPro/air/img/travel.png" width="30" height="30"></td>
				<td><%=as.getAP_NO2()%></td>
				<td><%=as.getDEPARTTIME()%></td>
				<td><div class="dott2" id="dott2"></div></td>
				<td><%=as.getCOST()%></td>
				
			</tr>

			<%
				}
				}
			%>
		</tbody>
	</table>
</form>
</body>
</html>