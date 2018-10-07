<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>관리자 관리페이지</title>
 <style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
    position: absolute; 
    top:320px;
    left:250px;
    text-align: center;
    border-collapse: 0px;
    border-spacing: 0px;
    
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
    text-align: center;
}

.con_list{
position: absolute;
left:250px;
top: 250px;
width: 100%;

}

.con_list p{
border-bottom: 2px solid aqua;
padding-bottom: 5px;
font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
font-weight: bold; 
}

.btns{
position: relative;
left:970px;
top: 700px;
}

.btns input[type="button"]{
background-color: black;
border: none;
color: white;
width:200px;
height:50px;
box-shadow: 50px;
margin-bottom: 10px;
}

 input[type="text"]{
width:100%;
height:30px;
border: none;
text-align: center;
}
</style>
</head> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>		<!-- 연관검색어 띄우는 소스 불러오는것/ -->
<script src="../air/scriptPro/AirAdFliEdit.js" charset="utf-8"></script>		<!-- 각입력란의 제약조건을 AirAdFliEdit.js로 --> 
 <link rel="stylesheet" type="text/css" href="../air/css/header.css">
 <link rel="stylesheet" type="text/css" href="../air/css/main.css">
 <link rel="stylesheet" type="text/css" href="../air/css/footer.css">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script>
$(function(){
	var alNoList=["5550101/아시아나항공","5550201/대한항공","5550302/아메리카항공","5550402/유나이티드항공"];
	var pNoList=["6660101/보잉737/아시아나항공","6660102/보잉777/대한항공","6660201/에어버스320/아메리카항공","6660202/에어버스340/유나이티드항공"];
	var apNoList=["444010101/인천국내공항/인천/대한민국","444020101/인천국제공항/인천/대한민국","444030201/김포국내공항/김포/대한민국",
				  "444040201/김포국제공항/김포/대한민국","444060302/로스엔젤레스국제공항/로스엔젤레스/미국","444070302/롱비치국내공항	/로스엔젤레스/미국",	
				  "444080402/샌프란시스코국제공항/샌프란시스코/미국","444090402/샌칼로스국내공항/샌프란시스코/미국"]

	

	
	
	
	$("#alNo1").autocomplete({
		source : alNoList
	});
	
	$("#pNo1").autocomplete({
		source : pNoList
	});
	
	$("#apNo1").autocomplete({
		source : apNoList
	});
	
	$("#apNo21").autocomplete({
		source : apNoList
	});
	
	$("#departTime").autocomplete({
		source : timeList
	});
	
	$("#arrivalTime").autocomplete({
		source : timeList
	});
	
});
</script>
<script type="text/javascript">

	

</script>
<%
	String insert=request.getParameter("insert");
String modify=request.getParameter("modify");
String modifysNo=request.getParameter("modifysNo");
%>
<body> 

<%-- <%=insert %>
<%=modify %>
<%=modifysNo %> --%>
  </div>
	<div id="wrap">
		<header>
		
			<a href="alltoy.html"><img id= "logo" src="img/logo.png"></a>

				<nav id="top_menu">
					<ul>
						<li><a href="AirLogin.jsp">로그인</a></li> 
						<li><a href="AirLogin.jsp">로그아웃 </a></li>
					</ul>	
				</nav>	

			<nav id="main_menu"> 
			<ul>
			   <li><a href="AirAdmin.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약 관리/목록</a></li>
			   <li><a href="AirAdCus.jsp">고객 정보 관리/목록</a></li>
			   <li><a href="AirAdFli.jsp">운항 정보 관리/목록</a></li>
			  </ul>
			  </nav>
			
			
	</header>


<div class="con_list" >
	<p>운항정보 관리/목록 수정</p> 
	</div>
	
 
    
<div class="clear"></div>
	
  <form action="AirAdFli.jsp?insert=<%=insert%>&modify=<%=modify%>&modifysNo=<%=modifysNo %>" name="editForm" method="post">		

	<input type="button" value="완료" onclick="insertCheck()">

<table id="customers">
 <tr>
 <th>운항번호</th>
 <td><input type="text" name="sNo" id="sNo" placeholder="운항번호를 입력하세요 " onclick="sNoCheck1()" onblur="sNoCheck2()"></td>
</tr> 

<tr>
 <th>항공사코드</th>
 <td>
 <input type="text" class="alNo1" id="alNo1" name="alNo1"  aria-invalid="false" autocomplete="off" placeholder="항공사코드 555을입력하시면 보다 편리하게 입력 가능." onblur="airLineCheck()">
 <input type="text" class="alNo" id="alNo" name="alNo">
 </td>
</tr> 

 <tr>
 <th>비행기코드</th>
 <td>
 <input type="text" class="pNo1" id="pNo1" name="pNo1"  aria-invalid="false" autocomplete="off" placeholder="비행기코드 666을입력하시면 보다 편리하게 입력 가능." onblur="airPlaneCheck()">
 <input type="text" class="pNo" id="pNo" name="pNo">
 </td>
</tr> 

 <tr>
 <th>출발공항코드</th>
 <td>
 <input type="text" class="apNo1" id="apNo1" name="apNo1"  aria-invalid="false" autocomplete="off" placeholder="공항코드444을입력하시면 보다 편리하게 입력 가능.">
 <input type="text" class="apNo" id="apNo" name="apNo">
 </td>
</tr> 

 <tr>
 <th>도착공항코드</th>
 <td>
 <input type="text" class="apNo21" id="apNo21" name="apNo21"  aria-invalid="false" autocomplete="off" placeholder="공항코드444을입력하시면 보다 편리하게 입력 가능." onblur="airPortCheck()">
 <input type="text" class="apNo2" id="apNo2" name="apNo2">
 </td>
</tr> 

 <tr>
  <th>출발시간</th>
 <td><input type="text" id="departTime" name="departTime" placeholder="시간은  00:00분 형식으로 입력하세요 "></td>
</tr>
 
 <tr>
  <th>도착시간</th>
 <td><input type="text" id="arrivalTime" name="arrivalTime" placeholder="시간은 00:00분 형식으로 입력하세요" onblur="timeCheck()"></td>
</tr> 

<tr>
<th>소요시간</th>
 <td><input type="text" id="lead" name="lead" placeholder="소요시간을 입력하세요"></td>
</tr> 

<tr>
<th>가격</th>
 <td><input type="text" id="cost" name="cost" placeholder="가격을 입력하세요"></td>
</tr>

<tr>
<th>좌석수</th>
 <td><input type="text" id="seat" name="seat" placeholder="좌석수를 입력하세요" readonly="readonly"></td>
</tr>

</table>
</form>	
</div>
</body>
</html>