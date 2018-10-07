<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ΰ����Ͽ�</title>
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
<body>
	<div id="wrap">
		<header > 
			<nav id="top_menu">
			<ul>
				<li><a href="AirLogin.jsp">�α���</a></li>
				<li><a href="AirLogin.jsp">�α׾ƿ� </a></li>
			</ul>
			</nav> 
			
			<nav id="main_menu">
				<ul>
					<li><a href="company.html">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ȸ��Ұ�</a></li>
					<li><a href="lantal.html">����</a></li>
					<li><a href="local.html">����</a></li>
					<li><a href="#">�ȳ�</a></li>
					<li><a href="#">����������</a></li>
				</ul>
			</nav> 
		</header>
	</div>
	<div id="dot">
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
							<span>�װ��� �˻�</span>
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
					<hr
						style="border-bottom: 1px solid #ddd; position: relative; top: 95px; width: 100%;"></hr>
					<li id="chice"><a href="#">���ÿϷ�</a></li>
				</ul>

			</div>
		</form>

	</div>


	<div id="new">
		<!-- new product -->
		<h2>
			<span>����</span> <span id="product">��õ ��Ű��</span>
		</h2>

		<div class="busan_div">
			<a href="/webPro/air/AirBoardList.jsp?category=busan"><img src="img/busan.jpg" alt="Avatar" class="busan_image"
				style="width: 100%"></a>
			<div class="middle_busan_txt">
				<div class="busan_txt">�λ꿩���ڽ���õ</div>
			</div>
		</div>
		<div class="busan_div">
			<img src="img/busanfood.png" alt="Avatar" class="busan_image"
				style="width: 100%">
			<div class="middle_busan_txt">
				<div class="busan_txt">�λ� ����BEST</div>
			</div>
		</div>
		<div class="busan_div">
			<img src="img/busanfestival.jpg" alt="Avatar" class="busan_image"
				style="width: 100%">
			<div class="middle_busan_txt">
				<div class="busan_txt">�λ�����</div>
			</div>
		</div>

		<div class="Seoul_div">
			<a href= "/webPro/air/AirBoardList.jsp?category=seoul" >
			<img src="img/Seoul.jpg" alt="Avatar" class="Seoul_image" style="width: 100%">
			<div class="middle_Seoul_txt">
				<div class="Seoul_txt">���￩���ڽ���õ</div>
			</div>
			
		</div>
		<div class="Seoul_div">
			<img src="img/Seoulfood.jpg" alt="Avatar" class="Seoul_image"
				style="width: 100%">
			<div class="middle_Seoul_txt">
				<div class="Seoul_txt">�������BEST</div>
			</div>
		</div>
		<div class="Seoul_div">
			<img src="img/Seoulfestival.jpg" alt="Avatar" class="Seoul_image"
				style="width: 100%">
			<div class="middle_Seoul_txt">
				<div class="Seoul_txt">��������</div>
			</div>
		</div>


		<div class="jeju_div">
			<a href="/webPro/air/AirBoardList.jsp?category=jeju"><img src="img/jeju.jpg" alt="Avatar" class="jeju_image"
				style="width: 100%">
			<div class="middle_jeju_txt">
				<div class="jeju_txt">���ֵ������ڽ�</div>
			</div>
		</div>
		<div class="jeju_div">
			<img src="img/jejufood.jpg" alt="Avatar" class="jeju_image"
				style="width: 100%">
			<div class="middle_jeju_txt">
				<div class="jeju_txt">���ֵ�����BEST</div>
			</div>
		</div>
		<div class="jeju_div">
			<img src="img/jejufestival.png" alt="Avatar" class="jeju_image"
				style="width: 100%">
			<div class="middle_jeju_txt">
				<div class="jeju_txt">���ֵ�����</div>
			</div>
		</div>

		<div class="clear"></div>

		<div class="contents_footer">

			<div id="footer_txt">
				<h3>Ž��</h3>
				<ul id="ftxt1">
					<li><a href="#">����</a></li>
					<li><a href="#">�ָ�����</a></li>
					<li><a href="#">����</a></li>
					<li><a href="#">�װ���</a></li>
					<li><a href="#">�װ���</a></li>
				</ul>
			</div>
			<div id="footer_txt">
				<h3>ȸ��</h3>
				<ul id="ftxt1">
					<li><a href="#">ȸ��Ұ�</a></li>
					<li><a href="#">ȸ������</a></li>
					<li><a href="#">��������ó����ħ</a></li>
					<li><a href="#">���񽺾��</a></li>
					<li><a href="#">������å</a></li>
				</ul>
			</div>
			<div id="footer_txt">
				<h3>Ž��</h3>
				<ul id="ftxt1">
					<li><a href="#">����</a></li>
					<li><a href="#">�ָ�����</a></li>
					<li><a href="#">����</a></li>
					<li><a href="#">�װ���</a></li>
					<li><a href="#">�װ���</a></li>
				</ul>
			</div>
			<div id="footer_txt">
				<h3>Ž��</h3>
				<ul id="ftxt1">
					<li><a href="#">����</a></li>
					<li><a href="#">�ָ�����</a></li>
					<li><a href="#">����</a></li>
					<li><a href="#">�װ���</a></li>
					<li><a href="#">�װ���</a></li>
				</ul>
			</div>
			<div id="footer_txt">
				<h3>Ž��</h3>
				<ul id="ftxt1">
					<li><a href="#">����</a></li>
					<li><a href="#">�ָ�����</a></li>
					<li><a href="#">����</a></li>
					<li><a href="#">�װ���</a></li>
					<li><a href="#">�װ���</a></li>
				</ul>
			</div>
		</div>



	</div>
</body>
</html>