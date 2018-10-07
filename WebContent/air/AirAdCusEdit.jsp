<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>관리자 관리페이지</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <link rel="stylesheet" type="text/css" href="/air/air/css/header.css">
 <link rel="stylesheet" type="text/css" href="/air/air/css/main.css">
 <link rel="stylesheet" type="text/css" href="/air/air/css/footer.css">
 <script src="../air/scriptPro/member.js" charset="utf-8"></script>
 
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

<body> 
<% %>
  </div>
	<div id="wrap">
		<header>
		
			<a href="alltoy.html"></a>

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
			  <div class="btns">
		<input type="button" value="수정완료" onclick="javascript:injectionMember()">
	</div>
			  </nav>
			
			
	</header>

   


<div class="con_list">
	<p>고객정보 관리/목록 수정</p>
	</div>
	
	
    
<div class="clear"></div>
	
  <form action="AirAdCus.jsp" method="post" name="joinFrm">
	<table id="customers">
	
 
 <tr>
  <th>회원번호</th>
  <td><input type="text" name="no"  onblur="membernum()"> </td>
</tr> 

 <tr>
 <th>이름</th>
 <td><input type="text" name="name" onblur="nameCheck()"></td>
</tr> 

 <tr>
  <th>생년월일</th>
 <td>
 <select name="birth1" id="year" onchange="birthDayCheck()">
       <%for(int i=2018; i>=1900; i--){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
     </select>년&nbsp;&nbsp;&nbsp;
     <select name="birth2" id="month" onchange="birthDayCheck()">
       <%for(int i=1; i<=12; i++){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
     </select>월&nbsp;&nbsp;&nbsp;
     <select name="birth3" id="day" onchange="birthDayCheck()">
       <%for(int i=1; i<=31; i++){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
     </select>일
 <input type="text" name="birth" class="inputText" size="10" onblur="birthDayCheck()" />
 </td>
 
</tr> 

 <tr>
 <th>주소</th>
 <td>
										<p>
											<input type="text" name="post1" class="inputText" size="10" /> - <input type="text" name="post2" class="inputText" size="10" /> <span class="buttonFuc"><a href="javascript:postCheck()">우편번호</a></span>
										    <input type="text" name="zipcode" class="inputText" size="20">
										</p>
										<p>
											<input type="text" name="post3" class="inputText" size="50" />
											<input type="text" name="post4" class="inputText" size="50" />
											<input type="text" name="address" class="inputText" size="50"/>
										</p>
									</td>
</tr> 

 <tr>
 <th>아이디</th>
 <td><input type="text" name="id" onblur="sendId()"></td>
</tr> 
 <tr>
 <th>비밀번호</th>
  <td><input type="text" name="password" onblur="passWordCheck()"></td>
</tr> 
<tr>
<th>비밀번호 확인</th>
<td><input type="text" name="repassword" onblur="repasscheck()"></td>
</tr>

 <tr>
 <th>이메일</th>
 <td><input type="text" name="email1" class="inputText" size="20"  onblur="emailcheck()"/>@
									<input type="text" name="email2" disabled="disabled"/>
										<input type="text" name="email"/>
									<select id="email3" name="email3" onblur="emailChange()"> 
									
									<option selected="selected" value="empty">선택하세요 </option>
									<option value="direct">직접입력 </option>
									<option value="naver.com">naver.com </option>
									<option value="nate.com">nate.com </option>
									<option value="gmail.com">daum.net </option>
									<option value="gmail.com">gmail.com </option>
								
									</select>
									</td>
</tr> 

 <tr>
  <th>권한</th>
 <td>
									<select name="admin" id="admins" onchange="adminvalue()">
									<option id="no">일반회원</option>
									<option id="no">관리자</option>
									</select>
									
									<input type="text" name="admines"  size="5" onblur="adminvalue()"></input>
									</td>
</tr> 
<!-- <tr>
									<th>마일리지</th>
									<td><input type="text" name="mileage"  class="inputText"
										size="10" onblur="mileagevalue()" /></td>
								</tr> -->
</table>
</form>	
</div>
</body>
</html>