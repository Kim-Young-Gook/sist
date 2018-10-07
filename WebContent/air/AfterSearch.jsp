<%@page import="sist.com.bean.AirSchedule"%>
<%@page import="java.util.List"%>
<%@page import="sist.com.dao.LineDao"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ΰ����Ͽ�</title>
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
		var availableTags = [ "��õ", "����", "����", "���ֱ�������", "û�ֱ�������", "�뱸��������",
				"���ȱ�������", "��籹������"

		];
		$("#departure").autocomplete({
			source : availableTags
		});
	});

	$(function() {
		var availableTags = [ "��õ", "����", "����", "���ֱ�������", "û�ֱ�������", "�뱸��������",
				"���ȱ�������", "��籹������"

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
				alert('���̻� ���ϼ� �����ϴ�.');
				num = 1;
				$("#cityclick").val(num + ' �°�');
			} else {
				$('#numberUpDown').text(num);
				$("#cityclick").val(num + ' �°�');
			}

		});
		$('.plus').click(function(e) {
			e.preventDefault();
			var stat = $('#numberUpDown').text();
			var num = parseInt(stat, 10);
			num++;

			if (num > 3) {
				alert('���̻� �ø��� �����ϴ�.');
				num = 3;
			}

			$('#numberUpDown').text(num);
			$("#cityclick").val(num + ' �°�');
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

			$("#datepicker2").val('��');
			$("#datepicker2").attr("disabled", true);
		});

		$(".rd-radio").click(function() {
			$("#datepicker2").val('���� ��¥');
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
				alert('��� ������ �Է����ּ���.');
				return false;
			}
			if (obj.arrival.value == "") {
				alert('���� ������ �Է����ּ���.');
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
			<li><a href="AirLogin.jsp">�α���</a></li>
			<li><a href="AirLogin.jsp">�α׾ƿ� </a></li>
		</ul>
		</nav> <nav id="main_menu">
		<ul>
			<li><a href="company.html">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ȸ��Ұ�</a></li>
			<li><a href="lantal.html">����</a></li>
			<li><a href="local.html">����</a></li>
			<li><a href="#">�ȳ�</a></li>
			<li><a href="#">����������</a></li>
		</ul>
		</nav> 
		
	</header>
	<div class="re_search">
		<form class="reservation" action="AfterSearch.jsp" name="reser" method="post" >

			<p>
				<input class="rd-radio" type="radio" id="way" name="way"
					value="roundtrip" checked> <label id="rdlabel">�պ�</label>
			</p>

			<p>
				<input class="ow-radio" type="radio" id="way" name="way"
					value="oneway"> <label id="owlabel">��</label>
			</p>

			<div class=total>

				<input type="text" class="departure" aria-invalid="false"
					autocomplete="off" id="departure" placeholder="����, ���� �Ǵ� ����"
					name="departure">
				<button class="btn" id="btn">
					<img id="img" src="img/exchange.png">
				</button>
				</input>
				<!-- ajax-->


				<input type="text" class="arrival" aria-invalid="false"
					autocomplete="off" id="arrival" placeholder="����, ���� �Ǵ� ����"
					name="arrival">
				<!-- ajax-->


				<input type="text" class="departure" aria-invalid="false"
					autocomplete="off" id="datepicker1" placeholder="��� ��¥"
					name="datepicker1">
				<!-- ajax-->

				<input type="text" class="departure" aria-invalid="false"
					autocomplete="off" id="datepicker2" placeholder="���� ��¥"
					name="datepicker2">
				<!-- ajax-->

				<input type="button" class="seat" id="cityclick"
					aria-invalid="false" autocomplete="off" id="origin-fsc-search"
					name="" value="1 �°�">
				<!--onclick-->
				<input type="hidden" id="personsHidden" name="persons" value="1">
				<div class="sub">
					<p>
						<button type="button" class="submit" id="" name=""
							onclick="searchTicket()">
							<span>�װ��� ��˻�</span>
						</button>
						<!--onclick-->
					</p>



				</div>
			</div>

			<div class="dropmid">
				<ul>
					<li><p
							style="text-align: center; font-weight: bold; font-size: 20px;">�¼�
							���</p></li>
					<li><p
							style="background-color: #ddd; font-size: small; border-radius: 10px; height: 60px; margin: 10px;">
							&nbsp;&nbsp;&nbsp;<b>�˻��Ͻ� �뼱�� �Ϲݼ� ���ݸ� ���� �帱 �� �ֽ��ϴ�.</b><br>�ϵ
							�ɼ��� ������ ��Ȯ�� ��¥ ��/�Ǵ� ������ ���� �̸��� �˷��ּ���.
						</p></li>
					<li><label
						style="font-weight: bold; font-size: 20px; margin-left: 23px;">����</label>
						<button class="plus">
							<p class="p">+</p>
						</button> <span id="numberUpDown">0</span>
						<button class="minus">
							<p class="m">-</p>
						</button></li>

					<li
						style="font-size: 10px; color: gray; position: relative; top: 80px;">
						���� �� ž�°��� ���̴� ����� ���� ���ֿ� �����ؾ� �մϴ�. �װ���� �� 18�� �̸��� �ܵ� ���� ž�°��� ����
						������ �ֽ��ϴ�.</li>
					<hr style="border-bottom: 1px solid #ddd; position: relative; top: 95px; width: 100%;"></hr>
					<li id="chice"><a href="#">���ÿϷ�</a></li>
				</ul>

			</div>
		</form>

	</div>
	</div>
	<!-- ��ܺ� �� �˻� ��� ���� -->
	
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
				<th>�װ����</th>
				<th>��߰���</th>
				<th>��߽ð�</th>
				<th>�ҿ�ð�</th>
				<th>��������</th>
				<th>�����ð�</th>
				<th><div class="dott" id="dott"></div><!-- <img src="/webPro/air/img/dotted-line.png" width="150"> --> </th>
				<th>����</th>
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
			<!-- �װ����/��߰���/��߽ð�/�ҿ�ð�/�����ð�/��������/���� -->
			
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