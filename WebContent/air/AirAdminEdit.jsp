<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>관리자 관리페이지</title>
</head>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
 <link rel="stylesheet" type="text/css" href="/webPro/air/css/header.css">
 <link rel="stylesheet" type="text/css" href="/webPro/air/css/main.css">
 <link rel="stylesheet" type="text/css" href="/webPro/air/css/footer.css">
 
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
top: 800px;
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

 .to select {
border: none;
background-color: #ddd;

}
</style>
<body> 

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



<div class="con_list">
	<p>예약 관리/목록 수정</p>
	</div>
	
	<div class="btns">
		<input type="button" value="수정완료">
	</div>
    
<div class="clear"></div>
	
  <form action="" method="post">
	<table id="customers">
	
 
 <tr>
  <th>예매번호</th>
  <td><input type="text" placeholder="예매번호를 입력하세요"> </td>
</tr> 

 <tr>
 <th>이름</th>
 <td><input type="text" placeholder="이름을 입력하세요"></td>
</tr> 

 <tr>
  <th>여권번호</th>
 <td><input type="text" placeholder="여권번호을 입력하세요"></td>
</tr> 

 <tr>
 <th>출발지</th>
 <td><input type="text" placeholder="출발지를 입력하세요"></td>
</tr> 

 <tr>
 <th>도착지</th>
 <td><input type="text" placeholder="도착지를 입력하세요"></td>
</tr> 

 <tr>
 <th>출발시간</th>
  <td><input type="text" placeholder="출발시간을 입력하세요"></td>
</tr> 

 <tr>
 <th>도착시간</th>
 <td><input type="text" placeholder="도착시간을 입력하세요"></td>
</tr> 

 <tr>
  <th>가격</th>
 <td><input type="text" placeholder="가격을 입력하세요"></td>
</tr> 

 <tr>
  <th>좌석</th>
 <td>
 	<select>
 		<option>좌석을 선택하세요</option>
 		<option>일반석</option>
 		<option>프리미엄</option>
 	</select>
 </td>
</tr> 

<tr>
  <th>동승자</th>
 <td>
 	<select class="to">
 		<option>동승자 수</option>
 		<%for(int i = 0; i <= 10; i ++){ %>
 			
 			<option><%=i %></option>
 			
 		<%	} %>
 		
 		
 	</select>
 	명
 </td>
</tr> 

 <tr>
  <th>마일리지</th>
 <td><input type="text" placeholder="포인트를 입력하세요"></td>	
</tr> 

</table>
</form>	
</div>
</body>
</html>