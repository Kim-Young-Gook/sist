<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>관리자 관리페이지</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	function infoShow() {
		location.href='AirAdCusInfo.jsp';
	}
	
	function addInsert() {
		location.href='AirAdCusEdit.jsp';
	}


</script>

 <link rel="stylesheet" type="text/css" href="/webPro/air/css/header.css">
 <link rel="stylesheet" type="text/css" href="/webPro/air/css/main.css">
 
 <style type="text/css">
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
    position: absolute; 
    top:320px;
    left:250px;
    text-align: center;
    
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #008299;}

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
left:1300px;
top: 200px;
}

.btns input[type="button"]{
background-color: black;
border: none;
color: white;
width:70px;
box-shadow: 50px;
margin-bottom: 10px;
}

.search{
position: absolute;
top:288px;
left:250px;

}

.search input[type="text"]{
position: relative;
bottom: 3.5px;
padding: 0px;
margin: 0px;
}
</style>
<body> 

  </div>
	<div id="wrap">
		<header>
		
		

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
	<p>고객정보 관리/목록</p>
	</div>
	
	<div class="btns">
		<input type="button" value="조회">
		<input type="button" value="삭제">
		<input type="button" value="추가" onclick="addInsert()">
	</div>
    
<div class="clear"></div>
	
	<div class="search">
		<select>
			<option>선택하세요</option>
			<option>회원번호</option>
			<option>이름</option>
			<option>아이디</option>
		</select>
		
		<input type="text">
	</div>
	<form action="" method="post">
	<table id="customers">
	
  <tr>
    <th width="5">
    	<input type="checkbox">
    </th>
    <th>No</th>
    <th>회원번호</th>
    <th>이름</th>
    <th>생년월일</th>
    <th>주소</th>
    <th>아이디</th>
    <th>비밀번호</th>
    <th>이메일</th>
    <th>권한</th>
     <th>Info</th>
  </tr>
  <tr>
   <td>
    	<input type="checkbox">
    </td>
    <td>1</td>
    <td>123132</td>
    <td>이쿠요</td>
     <td>1996/12/12</td>
     <td>인천 어쩌구</td>
     <td>ecu</td>
     <td>1234</td>
     <td>ecu@naver.com</td>
     <td>일반회원</td>
     <td>
     	<input type="button" value="상세보기" style="border: none; background-color: #B1B1B1; color: white; width: 100%; height: 20px;" onclick="infoShow()" />
     	
     </td>
    
  </tr>
  
</table>
</form>	
</div>
</body>
</html>