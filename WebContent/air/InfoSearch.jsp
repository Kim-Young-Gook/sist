<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="sist.com.bean.AirSchedule"%>
<%@page import="java.util.List"%>
<%@page import="sist.com.dao.LineDao"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	$("table").mouseover(function() {
		$("table").css({'box-shadow': '0 5px 5px 0 rgba(37,32,31,.5)'});
	});
	
	$("table").mouseleave(function() {
		$("table").css({'box-shadow':'none'});
	});
	
	 $( "#accordion" ).accordion({
	      collapsible: true
	    });
	 
	 $("p").hide();
	 $( "#up_arrow" ).hide();
	 $("#ul_contents").hide();
	 $( "#down_arrow" ).click(function() {
		 $("p").show();
		 $( "#up_arrow" ).show();
		 $( "#down_arrow" ).hide();
		 $("#ul_contents").show();
	});
	 
	 $( "#up_arrow" ).click(function() {
		 $("p").hide();
		 $( "#up_arrow" ).hide();
		 $( "#down_arrow" ).show();
		 $("#ul_contents").hide();
	});
	 
	 
	 
});

</script>

<style type="text/css">

header ul {
border-bottom: 1px solid darkturquoise;
box-shadow: 0 5px 5px 0 rgba(37,32,31,.5);
height: 50px;
}

li{
    padding-left: 400px;
    display: inline;
    font-weight: bold;
    font-size: 20px;
    color: darkcyan;
    
}

li a{
text-decoration:  none;
color: darkcyan;
}

li a:hover{
 text-decoration:  none;
 color: black;
}

#ul_contents li{
	display: list-item;
	color: black;
	padding: 0px;
	font-size: 13px;
}


 table{
	position:relative;
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

div #accordion{
position: relative;
left: 500px;
}


.ui-accordion .ui-accordion-content {
    padding: 1em 2.2em;
    border-top: 0;
    overflow: auto;
    width: 750px;
}

.ui-accordion .ui-accordion-header {
    display: block;
    cursor: pointer;
    position: relative;
    margin: 2px 0 0 0;
    padding: .5em .5em .5em .7em;
    font-size: 100%;
    width: 800px;
}

.ui-widget {
    font-family: Arial,Helvetica,sans-serif;
    font-size: 1em;
    margin-left: 550px;
}

h2{
margin-left: 550px;
}

#accordion2{
	margin-left: 550px;
    border-bottom: 1px solid black;
    border-top: 1px solid black;
    width: 820px;
}

#down_arrow{
    position: absolute;
    left: 1350px;
    top: 450px;
}

#up_arrow{
    position: absolute;
    left: 1350px;
    top: 450px;
}


</style>
</head>
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
<body>
	<header>
		<nav>		
			<ul id="head_ul">
				<li><a href="Air.jsp">돌아가기</a></li>
				<li>세부정보</li>
				<li><a href="AfterSearch.jsp">X</a></li>
			</ul>
		</nav>
	</header>


		<!-- 상단부 끝 검색 결과 시작 -->
<div id="accordion">
  <h3>가는날 출발시간</h3>
  <div draggable="false">
  	<table id="ta">
		<colgroup>
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
				<td><%=as.getLEAD()%><br><br><br><%=as2.getLEAD()%></td>
			
				<td><%=as.getAP_NO2()%><br><br><br><%=as2.getAP_NO2()%></td>
				<td><%=as.getDEPARTTIME()%><br><br><br><%=as2.getDEPARTTIME()%></td>
				
				
			
			</tr>
			
			<%
				}
					} else {
			%>
			
			

			<tr>
				
				<td><%=as.getAL_NO()%></td>
				<td><%=as.getAP_NO()%></td>
				<td><%=as.getARRIVALTIME()%></td>
				<td><%=as.getLEAD()%></td>
				<td><%=as.getAP_NO2()%></td>
				<td><%=as.getDEPARTTIME()%></td>
				
				
			</tr>

			<%
				}
				}
			%>
		</tbody>
	</table>
  </div>
  <h3>오는날 출발시간</h3>
  <div>
    <table id="ta">
		<colgroup>
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
				<td><%=as.getLEAD()%><br><br><br><%=as2.getLEAD()%></td>
			
				<td><%=as.getAP_NO2()%><br><br><br><%=as2.getAP_NO2()%></td>
				<td><%=as.getDEPARTTIME()%><br><br><br><%=as2.getDEPARTTIME()%></td>
				
				
			
			</tr>
			
			<%
				}
					} else {
			%>
			
			

			<tr>
				
				<td><%=as.getAL_NO()%></td>
				<td><%=as.getAP_NO()%></td>
				<td><%=as.getARRIVALTIME()%></td>
				<td><%=as.getLEAD()%></td>
				<td><%=as.getAP_NO2()%></td>
				<td><%=as.getDEPARTTIME()%></td>
				
				
			</tr>

			<%
				}
				}
			%>
		</tbody>
	</table>
  </div>
</div>
 <img id="down_arrow" src="/webPro/air/img/down-arrow.png" width="20" height="20">
 <img id="up_arrow" src="/webPro/air/img/up-arrow.png" width="20" height="20">
<h2>티켓을 예매하세요</h2>
<div id="accordion2">
  <h6>예약 전 읽어보기</h6>
 
  <div id="context">
    <p>
    	표시된 요금에는 모든 세금 및 수수료가 포함되어 있으나, 예약 전에 웹사이트에서 <b>티켓의 세부정보, 최종 가격, 약관</b>을 반드시 확인하시기 바랍니다.
    </p>
    <ul id="ul_contents">
    	<li> 추가 요금 확인

			일부 항공사/여행사의 경우 수하물, 보험 또는 신용 카드 사용에 대한 추가 요금을 부과합니다.항공사 수수료 보기.
		</li>
		
		<li>
			12~16세 승객에 대한 이용 약관을 확인하십시오.

			보호자를 동반하지 않고 혼자 여행하는 어린 승객에게는 제한 사항이 적용될 수 있습니다.
		
		</li>
    </ul>
  </div>
</div>

<fieldset>
 	<ul> 
 		<li style="display: list-item; padding: 0px; list-style-type: square; c"><h4>항공예약</h4></li>
 	</ul>
 	
</fieldset>

	
</body>
</html>