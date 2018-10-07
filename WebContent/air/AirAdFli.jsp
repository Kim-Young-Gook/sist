<%@page import="sist.com.bean.AirSchedule"%>
<%@page import="sist.com.dao.AirAdFilDao"%>
<%@page import="java.util.List"%>

<%@page import="java.util.HashMap"%>
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
		location.href = 'AirAdFliInfo.jsp';
	}

	function addInsert() {
		location.href = 'AirAdFliEdit.jsp?insert=insert';
	}
	function searchPro() {

		var obj = document.searchForm;
		if (obj.searchOption.value == "empty") {
			alert("검색 방법을 선택해주세요.");
			obj.searchText.value = '';

		} else {
			obj.submit();
		}
	}
	
 	$(function() {
		$("input#allCheck").click(function(){
			if($(this).prop("checked")){
				$("input#seletcCheck").prop("checked",true);
				$("input#seletcCheck").each(function(){
					//alert($("input#seletcCheck").prop("checked"));
				});
				
			}else{
				$("input#seletcCheck").prop("checked",false);
			}
					
		});// 체크박스 전체 선택시 
		
		$("input#seletcCheck").click(function(){			
				$(this).attr("name",$(this).prop("value"));		
		});			
	// 체크박스 개별 선택시
	
 	});// jquery 시작&끝 
	
	
		 
		
		
	function deletePro(){
		var vv= new Array(); 
 		$("input#seletcCheck").each(function(i){
			 vv[i]= $(this).attr("name");
		});
		var a=vv[1];
		var b=1;
 		location.href = "DeleteAirAdFil.jsp";
	
	}// 삭제 버튼 클릭시  
	 
</script>

<link rel="stylesheet" type="text/css" href="../air/css/header.css">
<link rel="stylesheet" type="text/css" href="../air/css/main.css">


<style>
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
	position: absolute;
	top: 320px;
	left: 250px;
	text-align: center;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #008299;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
	text-align: center;
}

.con_list {
	position: absolute;
	left: 250px;
	top: 250px;
	width: 100%;
}

.con_list p {
	border-bottom: 2px solid aqua;
	padding-bottom: 5px;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-weight: bold;
}

.btns {
	position: relative;
	left: 1300px;
	top: 200px;
}

.btns input[type="button"] {
	background-color: black;
	border: none;
	color: white;
	width: 70px;
	box-shadow: 50px;
	margin-bottom: 10px;
}

.search {
	position: absolute;
	top: 288px;
	left: 250px;
}

.search input[type="text"] {
	position: relative;
	bottom: 3.5px;
	padding: 0px;
	margin: 0px;
}
</style>
<%
	request.setCharacterEncoding("EUC-KR");
	List<AirSchedule> list = null;
	String searchOption = request.getParameter("searchOption");
	String searchText = request.getParameter("searchText");
	System.out.println("searchOption" + searchOption);
	System.out.println("searchText" + searchText);

	HashMap<String, Object> map = new HashMap<String, Object>();
	if (searchOption != null && searchText != null) {
		map.put("searchOption", searchOption);
		map.put("searchText", searchText);
	}
	list = AirAdFilDao.selectScheduleFil(map);

	String insert = request.getParameter("insert");
	String modify = request.getParameter("modify");
	String modifysNo = request.getParameter("modifysNo");
%>
<jsp:useBean id="scheduleBean" class="sist.com.bean.AirSchedule"
	scope="page" />
<jsp:setProperty property="*" name="scheduleBean" />
<body>
	<%--  <%=modify %>
<%=modifyNoValue%> --%>
	<%=insert%>
	<%=modify%>
	<%=modifysNo%>


	</div>
	<div id="wrap">
		<header> <a href="alltoy.html"><img id="logo"
			src="img/logo.png"></a> <nav id="top_menu">
		<ul>
			<li><a href="AirLogin.jsp">로그인</a></li>
			<li><a href="AirLogin.jsp">로그아웃 </a></li>
		</ul>
		</nav> <nav id="main_menu">
		<ul>
			<li><a href="AirAdmin.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약
					관리/목록</a></li>
			<li><a href="AirAdCus.jsp">고객 정보 관리/목록</a></li>
			<li><a href="AirAdFli.jsp">운항 정보 관리/목록</a></li>
		</ul>
		</nav> </header>



		<div class="con_list">
			<p>운항정보 관리/목록</p>
		</div>

		<div class="btns">
			<input type="button" value="조회" onclick="searchPro()"> 
			<input type="button" value="삭제" onclick="deletePro()" >
				 <input type="button" value="추가" onclick="addInsert()">
		</div>

		<div class="clear"></div>
		<form action="" name="searchForm" method="post">
			<div class="search">
				<select id="searchOption" name="searchOption">
					<option value="empty">선택하세요</option>
					<option value="s_no">운항번호</option>
					<option value="p_no">비행기코드</option>
					<option value="al_no">항공사코드</option>
					<option value="ap_no">출발공항코드</option>
					<option value="ap_no2">도착공항코드</option>
				</select> <input type="text" id="searchText" name="searchText">
			</div>
		</form>
		<form action="" method="post">	
		
			<table id="customers">

				<tr>
					<th width="5"><input id="allCheck" type="checkbox"></th>
					<th>운항번호</th>
					<th>비행기코드</th>
					<th>항공사코드</th>
					<th>출발공항코드</th>
					<th>도착공항코드</th>
					<th>출발시간</th>
					<th>도착시간</th>
					<th>소요시간</th>
					<th>가격</th>
					<th>좌석수</th>

					<th>Info</th>
				</tr>

				<%
					if (insert!=null&&insert.equals("insert")) {
						AirAdFilDao.insertSchedule(scheduleBean);
						System.out.println("DAO=> INSERT");
					} else if (modify!=null&&modify.equals("modify")) {
						AirAdFilDao.modifySchedule(modifysNo, scheduleBean);
						System.out.println("DAO=> MODIFY");
					}
				for (int i = 0; i < list.size(); i++) {
					AirSchedule schedule = list.get(i);
				
				%>
				
				<tr>
					<td><input id="seletcCheck" type="checkbox"  value="<%=schedule.getS_NO()%>"></td>
					<td><%=schedule.getS_NO()%></td>
					<td><%=schedule.getP_NO()%></td>
					<td><%=schedule.getAL_NO()%></td>
					<td><%=schedule.getAP_NO()%></td>
					<td><%=schedule.getAP_NO2()%></td>
					<td><%=schedule.getDEPARTTIME()%></td>
					<td><%=schedule.getARRIVALTIME()%></td>
					<td><%=schedule.getLEAD()%></td>
					<td><%=schedule.getCOST()%></td>
					<td><%=schedule.getSEAT()%></td>
					<td><a href="AirAdFliInfo.jsp?sNo=<%=schedule.getS_NO()%>">
							<input type="button" value="상세보기" style="border: none; background-color: #B1B1B1; color: white; width: 100%; height: 20px;"></a>
							
					</td>

				</tr>
				<%
					}
				%>
			</table>
		</form>
	</div>
</body>
</html>