  <%@page import="sist.com.bean.AirSchedule"%>
<%@page import="sist.com.dao.AirAdFilDao"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>������ ����������</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <link rel="stylesheet" type="text/css" href="../air/css/header.css">
 <link rel="stylesheet" type="text/css" href="../air/css/main.css">
 <link rel="stylesheet" type="text/css" href="../air/css/footer.css">
 
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
<%

AirSchedule Schedule=null;
Schedule=(AirSchedule)AirAdFilDao.selectScheduleInfo(Integer.parseInt(request.getParameter("sNo"))); 
%>
<body> 
  
	<div id="wrap">
		<header>
		
			<a href="alltoy.html"><img id= "logo" src="img/logo.png"></a>

				<nav id="top_menu">
					<ul>
						<li><a href="AirLogin.jsp">�α���</a></li> 
						<li><a href="AirLogin.jsp">�α׾ƿ� </a></li>
					</ul>
				</nav>	

			<nav id="main_menu"> 
			<ul>
			   <li><a href="AirAdmin.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� ����/���</a></li>
			   <li><a href="AirAdCus.jsp">�� ���� ����/���</a></li>
			   <li><a href="AirAdFli.jsp">���� ���� ����/���</a></li>
			  </ul>
			  </nav>
			
			
	</header>


<div class="con_list">
	<p>�������� ����/��� �󼼺���</p>
	</div>
	
	<div class="btns">
		<a href="AirAdFliEdit.jsp?modify=modify&modifysNo=<%=Schedule.getS_NO()%>"><input type="button" value="����"></a>
	</div>
    
<div class="clear"></div>
	
  <form action="" method="post">
	<table id="customers">
	
 <tr>
 	 <th>���׹�ȣ</th>
    <td><%=Schedule.getS_NO() %> </td>
 </tr> 
 
 <tr>
  <th>�װ����ڵ�</th>
  <td><%=Schedule.getAL_NO() %></td>
</tr> 

 <tr>
 <th>������ڵ�</th>
 <td><%=Schedule.getP_NO()%></td>
</tr> 

 <tr>
 <th>��߰����ڵ�</th>
 <td><%=Schedule.getAP_NO()%> </td>
</tr> 

 <tr>
  <th>���������ڵ�</th>
 <td><%=Schedule.getAP_NO2()%> </td>
</tr> 

 <tr>
  <th>��߽ð�</th>
 <td><%=Schedule.getDEPARTTIME() %> </td>
</tr> 

 <tr>
<th>�����ð�</th>
  <td> <%=Schedule.getARRIVALTIME()%></td>
</tr> 

<tr>
<th>�ҿ�ð�</th>
  <td> <%=Schedule.getLEAD()%></td>
</tr> 

<tr>
<th>����</th>
  <td> <%=Schedule.getCOST()%></td>
</tr> 

<tr>
<th>�¼���</th>
  <td> <%=Schedule.getSEAT()%></td>
</tr> 


</table>
</form>	
</div>
</body>
</html>  