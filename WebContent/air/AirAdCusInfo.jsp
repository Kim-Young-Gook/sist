<%@page import="sist.com.bean.Board"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="sist.com.dao.BoardDao"%>
<%@page import="sist.com.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>������ ����������</title>
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
<jsp:useBean id="board" class="sist.com.bean.Board" scope="page" />
<jsp:setProperty property="*" name="board" />
<body> 

  </div>
	<div id="wrap">
		<header>
		
			

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
	<p>������ ����/��� �󼼺���</p>
	
	</div>
	
	<div class="btns">
		<a href="AirAdCusEdit.jsp"><input type="button" value="����"></a>
	</div>
    
<div class="clear"></div>
	<%
	 int num=Integer.parseInt(request.getParameter("no"));
	   String a= request.getParameter("name");
	   String b=request.getParameter("birth");
	   String c=request.getParameter("address");
	   String d=request.getParameter("id");
	   String e=request.getParameter("password");
	   String f=request.getParameter("email");
	   String g=request.getParameter("admin");
	%>
  <form action="" method="post">
	<table id="customers">
	 
 <tr>
  <th>ȸ����ȣ</th>
  <td><%=board.getNo() %></td>
</tr> 

 <tr>
 <th>�̸�</th>
 <td><%=a %></td>
</tr> 

 <tr>
  <th>�������</th>
 <td><%=b %></td>
</tr> 

 <tr>
 <th>�ּ�</th>
 <td><%=c %></td>
</tr> 

 <tr>
 <th>���̵�</th>
 <td><%=d %></td>
</tr> 

 <tr>
 <th>��й�ȣ</th>
  <td><%=e %></td>
</tr> 

 <tr>
 <th>�̸���</th>
 <td><%=f %></td>
</tr> 

 <tr>
  <th>����</th>
 <td><%=g %></td>
</tr> 


</table>
</form>	
</div>
</body>
</html>