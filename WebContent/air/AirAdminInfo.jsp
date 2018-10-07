<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>관리자 관리페이지</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
left:1450px;
top: 175px;
}

.btns input[type="button"]{
background-color: black;
border: none;
color: white;
width:70px;
height:50px;
box-shadow: 50px;
margin-bottom: 10px;
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
	<p>예약 관리/목록 상세보기</p>
	</div>
	
	<div class="btns">
		<a href="AirAdminEdit.jsp"><input type="button" value="수정"></a>
	</div>
    
<div class="clear"></div>
	
  <form action="" method="post">
	<table id="customers">
	
 <tr>
 	 <th>No</th>
    <td>1</td>
 </tr> 
 
 <tr>
  <th>예매번호</th>
  <td>123132</td>
</tr> 

 <tr>
 <th>이름</th>
 <td>심유석</td>
</tr> 

 <tr>
  <th>여권번호</th>
 <td>14-15465465</td>
</tr> 

 <tr>
 <th>출발지</th>
 <td>인천</td>
</tr> 

 <tr>
 <th>도착지</th>
 <td>제주도</td>
</tr> 

 <tr>
 <th>출발시간</th>
  <td>12:55</td>
</tr> 

 <tr>
 <th>도착시간</th>
 <td>23:55</td>
</tr> 

 <tr>
  <th>가격</th>
 <td>850,000</td>
</tr> 

 <tr>
  <th>좌석</th>
 <td>일반석</td>
</tr>

 <tr>
  <th>동승자</th>
 <td>없음</td>	
</tr>  

 <tr>
  <th>마일리지</th>
 <td>5,000P</td>	
</tr> 

</table>
</form>	
</div>
</body>
</html>