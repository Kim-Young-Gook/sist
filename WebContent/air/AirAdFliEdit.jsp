<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>������ ����������</title>
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
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>		<!-- �����˻��� ���� �ҽ� �ҷ����°�/ -->
<script src="../air/scriptPro/AirAdFliEdit.js" charset="utf-8"></script>		<!-- ���Է¶��� ���������� AirAdFliEdit.js�� --> 
 <link rel="stylesheet" type="text/css" href="../air/css/header.css">
 <link rel="stylesheet" type="text/css" href="../air/css/main.css">
 <link rel="stylesheet" type="text/css" href="../air/css/footer.css">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script>
$(function(){
	var alNoList=["5550101/�ƽþƳ��װ�","5550201/�����װ�","5550302/�Ƹ޸�ī�װ�","5550402/������Ƽ���װ�"];
	var pNoList=["6660101/����737/�ƽþƳ��װ�","6660102/����777/�����װ�","6660201/�������320/�Ƹ޸�ī�װ�","6660202/�������340/������Ƽ���װ�"];
	var apNoList=["444010101/��õ��������/��õ/���ѹα�","444020101/��õ��������/��õ/���ѹα�","444030201/������������/����/���ѹα�",
				  "444040201/������������/����/���ѹα�","444060302/�ν�����������������/�ν���������/�̱�","444070302/�պ�ġ��������	/�ν���������/�̱�",	
				  "444080402/�������ý��ڱ�������/�������ý���/�̱�","444090402/��Į�ν���������/�������ý���/�̱�"]

	

	
	
	
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


<div class="con_list" >
	<p>�������� ����/��� ����</p> 
	</div>
	
 
    
<div class="clear"></div>
	
  <form action="AirAdFli.jsp?insert=<%=insert%>&modify=<%=modify%>&modifysNo=<%=modifysNo %>" name="editForm" method="post">		

	<input type="button" value="�Ϸ�" onclick="insertCheck()">

<table id="customers">
 <tr>
 <th>���׹�ȣ</th>
 <td><input type="text" name="sNo" id="sNo" placeholder="���׹�ȣ�� �Է��ϼ��� " onclick="sNoCheck1()" onblur="sNoCheck2()"></td>
</tr> 

<tr>
 <th>�װ����ڵ�</th>
 <td>
 <input type="text" class="alNo1" id="alNo1" name="alNo1"  aria-invalid="false" autocomplete="off" placeholder="�װ����ڵ� 555���Է��Ͻø� ���� ���ϰ� �Է� ����." onblur="airLineCheck()">
 <input type="text" class="alNo" id="alNo" name="alNo">
 </td>
</tr> 

 <tr>
 <th>������ڵ�</th>
 <td>
 <input type="text" class="pNo1" id="pNo1" name="pNo1"  aria-invalid="false" autocomplete="off" placeholder="������ڵ� 666���Է��Ͻø� ���� ���ϰ� �Է� ����." onblur="airPlaneCheck()">
 <input type="text" class="pNo" id="pNo" name="pNo">
 </td>
</tr> 

 <tr>
 <th>��߰����ڵ�</th>
 <td>
 <input type="text" class="apNo1" id="apNo1" name="apNo1"  aria-invalid="false" autocomplete="off" placeholder="�����ڵ�444���Է��Ͻø� ���� ���ϰ� �Է� ����.">
 <input type="text" class="apNo" id="apNo" name="apNo">
 </td>
</tr> 

 <tr>
 <th>���������ڵ�</th>
 <td>
 <input type="text" class="apNo21" id="apNo21" name="apNo21"  aria-invalid="false" autocomplete="off" placeholder="�����ڵ�444���Է��Ͻø� ���� ���ϰ� �Է� ����." onblur="airPortCheck()">
 <input type="text" class="apNo2" id="apNo2" name="apNo2">
 </td>
</tr> 

 <tr>
  <th>��߽ð�</th>
 <td><input type="text" id="departTime" name="departTime" placeholder="�ð���  00:00�� �������� �Է��ϼ��� "></td>
</tr>
 
 <tr>
  <th>�����ð�</th>
 <td><input type="text" id="arrivalTime" name="arrivalTime" placeholder="�ð��� 00:00�� �������� �Է��ϼ���" onblur="timeCheck()"></td>
</tr> 

<tr>
<th>�ҿ�ð�</th>
 <td><input type="text" id="lead" name="lead" placeholder="�ҿ�ð��� �Է��ϼ���"></td>
</tr> 

<tr>
<th>����</th>
 <td><input type="text" id="cost" name="cost" placeholder="������ �Է��ϼ���"></td>
</tr>

<tr>
<th>�¼���</th>
 <td><input type="text" id="seat" name="seat" placeholder="�¼����� �Է��ϼ���" readonly="readonly"></td>
</tr>

</table>
</form>	
</div>
</body>
</html>