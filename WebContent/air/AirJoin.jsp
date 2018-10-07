<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
 <link rel="stylesheet" type="text/css" href="/AIR/css/footer_join.css">
 <style type="text/css">

body{width:1274px;height: 300px;}

/*------------------------------*/
h4{
	margin-top: 50px;
}
.join_div{
	width:900px;
	height:700px;
	background-color: #2BA5BA;
	margin-top: 200px;
	margin-left:50%;
	font-size: 20px;
}
#idcheck a{
	margin-left:10px;
	text-decoration: none;
	opacity: 0.7;
	color: black;
	font-size: 15px;
}
#idcheck a:hover{
	border-bottom:2px solid white; 
}
#address_check a{
	margin-left:10px;
	text-decoration: none;
	opacity: 0.7;
	color: black;
	font-size: 15px;
	
}
#address_check a:hover{
	border-bottom:2px solid white; 
}

#join_frm h4{
	font-size: 30px;
	text-align: center;
	padding-top: 30px;
	margin-bottom: 20px;
}
#join_frm table{
	margin-left: 250px;
}
.table_join tbody tr{
	margin-top: 50px;
}
.submit_div > a{
	text-decoration: none;
}
.submit_div{
	margin-left:43%;
	margin-top: 20px;
}
#Send{
	position: absolute;
}
#cancle{
	margin-left: 100px;
	position: absolute;
}
.submit_div a{
	text-decoration: none;
	color: black;
}
.submit_div a:hover{
	border-bottom:2px solid white; 
}
 </style>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script  src="../scriptPro/airjoinJS.js" charset="utf-8"></script>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
	
	<div class="join_div" >
		<form action="insertjoin.jsp" id="join_frm" name="join"  method="post">
			<table class="table_join">
			<h4>가입하기</h4>
				<tbody>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="name"></td>
						<td><input type="hidden" name="admin"></td>
						
					</tr>
					<tr>
						<th style="margin-top: 40px;">아이디</th>
						<td><input type="text" class="id" name="id"><span id="idcheck"><a href="#" onclick="idCheckFrm()">중복체크</a></span></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" id="pass" name="pass1"></td>
					</tr>
					<tr>
						<th width="150" style="margin-top: 40px;">비밀번호확인</th>
						<td>
							<input type="text" name="pass2" onblur="passCheck()">
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<input type="text" name="year" size="6">년
							<input type="text" name="month" size="6">월
							<input type="text" name="day" size="6" onblur="birthCheck()">일
							<input type="hidden" name="birth" id="birth" >
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<p>
							<input type="text" name="post1" size="10">
							<input type="text" name="post2"size="10">
							<span id="address_check">
								<a href="javascript:postCheck()">우편번호</a>
							</span>
							</p>						
							<p>
							<br>
							<input type="text" name="post3" size="40" readonly="readonly">
							<input type="text" name="post4" size="40">
							<input type="hidden" name="naddress" size="20" id="address">
							<input type="hidden" name="textaddress" size="20" id="address">
							</p>						
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" name="email1" size="6">@
							<input type="text" name="email2" size="10">
							<select name="email3" id="email3" onchange="emailCheck()">
								<option selected="selected" value="empty">선택하세요</option>
								<option value="direct">직접입력하세요</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="icloud.com">icloud.com</option>
							</select>
							<input type="hidden" name="email">
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
						<input type="text" name="tel1" size="6">
						<input type="text" name="tel2" size="6">
						<input type="text" name="tel3" size="6">
						<input type="hidden" name="tel" id="tel">
						</td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td>
						<input type="text" name="cp1" size="6">
						<input type="text" name="cp2" size="6">
						<input type="text" name="cp3" size="6">
						<input type="hidden" name="cp" id="cp">
						</td>
					</tr>
				</tbody>
				
			</table>
			
					
		</form>
			<div class="submit_div">
						<span><a id="Send" href="#" onclick="SendJoin()">가입</a></span>
						<span><a id="cancle" href="#">취소</a></span>
			</div>
	</div>
	
	<footer>
	<img id="footer_logo" src="/AIR/img/footer_logo.png">
	<span id="border">  홈  ·  회사소개  ·  이용약관  ·  개인정보보호정책  ·  이용안내</span> 
	<pre id="address">
	주소: 서울시 강남구 삼성동 1234  우 :123-1234   TEL :  031-123-1234 

	Email: wnsghrnt2@naver.com COPYRIGHT (C)2017 AllToy  ALL RIGHTS RESERVED
	</pre>
	</footer>

</body>
</html>