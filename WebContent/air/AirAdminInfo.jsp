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
<body> 

  </div>
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
	<p>���� ����/��� �󼼺���</p>
	</div>
	
	<div class="btns">
		<a href="AirAdminEdit.jsp"><input type="button" value="����"></a>
	</div>
    
<div class="clear"></div>
	
  <form action="" method="post">
	<table id="customers">
	
 <tr>
 	 <th>No</th>
    <td>1</td>
 </tr> 
 
 <tr>
  <th>���Ź�ȣ</th>
  <td>123132</td>
</tr> 

 <tr>
 <th>�̸�</th>
 <td>������</td>
</tr> 

 <tr>
  <th>���ǹ�ȣ</th>
 <td>14-15465465</td>
</tr> 

 <tr>
 <th>�����</th>
 <td>��õ</td>
</tr> 

 <tr>
 <th>������</th>
 <td>���ֵ�</td>
</tr> 

 <tr>
 <th>��߽ð�</th>
  <td>12:55</td>
</tr> 

 <tr>
 <th>�����ð�</th>
 <td>23:55</td>
</tr> 

 <tr>
  <th>����</th>
 <td>850,000</td>
</tr> 

 <tr>
  <th>�¼�</th>
 <td>�Ϲݼ�</td>
</tr>

 <tr>
  <th>������</th>
 <td>����</td>	
</tr>  

 <tr>
  <th>���ϸ���</th>
 <td>5,000P</td>	
</tr> 

</table>
</form>	
</div>
</body>
</html>