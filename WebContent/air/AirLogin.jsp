<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
<link href="../css/AirLogin.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function sendLogin(){
	  var obj=document.login;
	  if(obj.id.value!=null||obj.pass.value!=null){
		  obj.id.value = obj.id2.value;
		  obj.submit();		  
	  }
	  else{
		  alert('id or pass Check');
		  obj.id.value='';
		  obj.pass.value='';
		  obj.id.focus();
		 
	  }
 }
 
 function sendJoin() {
	location.href='AirJoin.jsp';
}

 function wrapWindowByMask(){
	  
     //ȭ���� ���̿� �ʺ� ���Ѵ�.
     var maskHeight = $(document).height();  
     var maskWidth = $(document).width();  

     //����ũ�� ���̿� �ʺ� ȭ�� ������ ����� ��ü ȭ���� ä���.
     $("#mask").css({"width":maskWidth,"height":maskHeight});  

     //�ִϸ��̼� ȿ�� - �ϴ� 0�ʵ��� ��İ� �ƴٰ� 60% �������� ����.

     $("#mask").fadeIn(0);      
     $("#mask").fadeTo("slow",0.6);    

     //������ ���� �� ����.
     $(".window").show();
   

 }
 
 
 function wrapWindowByMask2(){
	  
     //ȭ���� ���̿� �ʺ� ���Ѵ�.
     var maskHeight2 = $(document).height();  
     var maskWidth2 = $(document).width();  

     //����ũ�� ���̿� �ʺ� ȭ�� ������ ����� ��ü ȭ���� ä���.
     $("#mask").css({"width":maskWidth2,"height":maskHeight2});  

     //�ִϸ��̼� ȿ�� - �ϴ� 0�ʵ��� ��İ� �ƴٰ� 60% �������� ����.

     $("#mask").fadeIn(0);      
     $("#mask").fadeTo("slow",0.6);    

     //������ ���� �� ����.
     $(".window2").show();
   

 }

 $(document).ready(function(){
     //���� �� ����
     $(".openMask").click(function(e){
         e.preventDefault();
         wrapWindowByMask();
     });
     
     
   //���� �� ����
     $(".openMask2").click(function(e){
         e.preventDefault();
         wrapWindowByMask2();
     });
     
    
     


     //�ݱ� ��ư�� ������ ��
     $("input[type='button']#c_btn").click(function (e) {  
         //��ũ �⺻������ �۵����� �ʵ��� �Ѵ�.
         e.preventDefault();  
         $("#mask, .window").hide();  
     });      
     
     
   //�ݱ� ��ư�� ������ ��
     $("input[type='button']#c_btn2").click(function (e) {  
         //��ũ �⺻������ �۵����� �ʵ��� �Ѵ�.
         e.preventDefault();  
         $("#mask, .window2").hide();  
     });      

     //���� ���� ������ ��
     $("#mask").click(function () {  
         $(this).hide();  
         $(".window").hide();  

     });
     
     $("div.e_dv").hide();
     $("input[type='radio']#email").click(function() {
		$("div.n_dv").show();
		 $("div.e_dv").hide();
	});
     
     $("input[type='radio']#tel").click(function() {
    	 $("div.e_dv").show();
    	  $("div.n_dv").hide();
 	});
     
     
     
     $("div.e_dv2").hide();
     $("input[type='radio']#email2").click(function() {
		$("div.n_dv2").show();
		 $("div.e_dv2").hide();
	});
     
     $("input[type='radio']#tel2").click(function() {
    	 $("div.e_dv2").show();
    	  $("div.n_dv2").hide();
 	});
     
     
  
  
    

 });
</script>

<script type="text/javascript">
function IDsearch() {
	var obj = document.searchFrm;
	if(obj.name_id.value!=null||obj.email_id.value!=null || obj.name_id2.value!=null || obj.tel_id.value!=null){
		  obj.submit();	
		  var windowObj = window.open('AirinfoCheck.jsp','id','left=300,top=200,width=400,height=300');
		  //windowObj.document.getElementById("n_id").value = document.getElementById("name_id").value;
		  alert(windowObj);

		
	  }
	  else{
		  alert('1�����̻� �� �ּ���');
		  obj.name_id.value='';
		  obj.email_id.value='';
		  obj.name_id2.value='';
		  obj.tel_id.value='';
		  obj.id.focus();
		 
	  }
	
}


function PWsearch() {     
	var obj = document.searchFrm;
if(obj.idd_pw.value!=null||obj.name_pw.value!=null || obj.email_pw.value!=null || obj.idd_pw2.value!=null || obj.name_pw2.value!=null || obj.tel_pw.value!=null){
	  obj.submit();	
	  window.open('AirinfoCheck.jsp','dong','left=300,top=200,width=400,height=300');
  }
  else{
	  alert('1�����̻� �� �ּ���');
	  obj.idd_pw.value='';
	  obj.name_pw.value='';
	  obj.email_pw.value='';
	  obj.idd_pw2.value='';
	  obj.name_pw2.value='';
	  obj.tel_pw.value='';
	  obj.id.focus();
	 
  }
  
}





</script>

<style type="text/css">
body{
 background: url(/webPro/air/img/water.jpg) no-repeat center center fixed;
  background-size: cover;
  height: 100%;
  overflow: hidden;
}

.form{
	border: 1px solid black;
	margin: 0px 750px 0 750px;
	padding: 25px;
	border-radius:25px;
	position: absolute; top:300px; right:50px; 
	

}

#wap_content{
position: relative;

}

 #next1{
background-color:black; 
color:white;
border-color:black;
text-align:center;
font-size:14px; 
padding:20px;
width: 100px; 
border-radius:10px;
position: absolute; left:40px; bottom:40px;
}


 #next2{
background-color:black; 
color:white;
border-color:black;
text-align:center;
font-size:14px; 
padding:20px;
width: 100px; 
border-radius:10px;
position: absolute; left:180px; bottom:40px;
}


.find p {
float: left;
font-weight: bold;

}

/* ����ũ �ٿ�� */
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    right:0px;
    bottom:0px;
    
} 
/* �˾����� �ߴ� ������ css  */
.window{
	border-radius:10px;
    display: none;
    position:absolute;  
    left:1288px;
    bottom:450px;
    margin-left: -500px;
    width:300px;
    height:200px;
    background-color:#FFF;
    z-index:10000;   
 }
.dd{
position: relative;
bottom: 500px;
}

.dd #la_id{
position: relative;
left: 30px;
}

.dd .r_dv{
position: relative;
left: 66px;
}

.dd .n_dv{
margin-left: 5px;
}

.dd .n_dv input[type='text']{
position: relative;
left: 20px;
margin-top: 10px;
border:1px solid black;
border-radius: 2px;
}

.dd .e_dv{
margin-left: 5px;

}

.dd .e_dv input[type='text']{
position: relative;
left: 4px;
margin-top: 10px;
border:1px solid black;
border-radius: 2px;
}

.dd input[type='button']{
position: relative;
left: 105px;
top:20px;
border-radius: 5px;
border: 1px solid black;
background-color: black;
color: white;
padding: 10px;
}

/* ����� ���  */

.window2{
	border-radius:10px;
    display: none;
    position:absolute;  
   left:1288px;
    bottom:450px;
    margin-left: -500px;
    width:300px;
    height:200px;
    background-color:#FFF;
    z-index:10000;   
 }
.dd2{
position: relative;
bottom: 500px;
}

.dd2 #la_id{
position: relative;
left: 30px;
}

.dd2 .r_dv2{
position: relative;
left: 75px;
bottom: 21px;
}

.dd2 .n_dv2{
margin-left: 5px;

}

.dd2 .n_dv2 label{
position: relative;
bottom:15px;
}


.dd2 .n_dv2 input[type='text']{
position: relative;
left: 20px;
bottom:15px;
margin-top: 10px;
border:1px solid black;
border-radius: 2px;
}

.dd2 .e_dv2{
margin-left: 5px;

}


.dd2 .e_dv2 label{
position: relative;
bottom:15px;
}

.dd2 .e_dv2 input[type='text']{
position: relative;
left: 4px;
bottom:15px;
margin-top: 10px;
border:1px solid black;
border-radius: 2px;
}

.dd2 input[type='button']{
position: relative;
left: 105px;
bottom:10px;
border-radius: 5px;
border: 1px solid black;
background-color: black;
color: white;
padding: 10px;
}


table tr td a {
color: black;
text-decoration: none;
} 


</style>
</head>

<body>

<div id="mask"></div>

<div class="wap_content"> 


<form class="form" name="login" method="post" action="adminloginProcess.jsp">
 <table align="center" cellpadding="20" cellspacing="0">
 <tr>
 	<th>ID</th>
 	<td>
 		<input type="text" name="id2" id="id2">
 		<input type="hidden" name="id" id="id">
 	
 	</td>
 </tr>
 
 <tr>
 	<th>PW</th>
 	<td>
     	<input type="password" name="pass" id="pass">
 		
 	</td>
 
 </tr>
 
  <tr>
 	<td>
 		<input id="next1" type="button" value="�α���" onclick="sendLogin()">
 	</td>
 </tr>
 
  <tr>
 	<td>
 		<input id="next2" type="button" value="ȸ������" onclick="sendJoin()">
 	</td>
 	
 		<td>
 		<div class="forget" style="position:fixed; top:520px; right:880px; ">
 		<a href="#" class="openMask">Forget ID?</a>
        <a href="#" class="openMask2">Forget PW?</a>
        </div>
 		</td>
 	
 </tr>

 </table>

	</form>
	
</div>
<form action="" name="searchFrm" method="post">
<div class="find"> 
        <div id="container">    
            <div class="window">
            	<p style="width:1000px;height:500px;text-align:center;vertical-align:middle;">&nbsp;
            	<div class="dd">
            	<label style="position:relative; bottom: 20px; left:110px; font-weight: bold; font-size:20px;">ID ã��</label>
            	<div class="r_dv">
            	
            	<input type="radio" id="email" name="find" value="email"> �̸���
            	<input type="radio" id="tel" name="find" value="tel"> �޴��ȣ
            	</div>
            	<div class="n_dv">
            	<label id="name">�̸�</label>&nbsp;&nbsp;&nbsp;
            	<input type="text" name="name_id"><br>
            	<label title="email">�̸���</label>
            	<input type="text" name="email_id"><br>
            	</div>
            	
            	<div class="e_dv">
            	<label id="name">�̸�</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<input type="text" name="name_id2"><br>
            	<label title="tel">��ȭ��ȣ</label>
            	<input type="text" name="tel_id"><br>
            	</div>
            	
            	<a href="javascript:IDsearch()"><input type="button" id="s_btn" value="�Ϸ�"></a>
            	<input type="button" id="c_btn" value="���">
            	
            	</div>
            	
                <!-- <p style="text-align:center; background:#ffffff; padding:20px;"><a href="#" class="close">�ݱ�X</a></p> -->
            </div>
            
                 <div class="window2">
            	<p style="width:1000px;height:500px;text-align:center;vertical-align:middle;">&nbsp;
            	<div class="dd2">
            	<label style="position:relative; bottom: 27px; left:110px; font-weight: bold; font-size:20px;">PWã��</label>
            	<div class="r_dv2">
            	<input type="radio" id="email2" name="findradio" value="email"> �̸���
            	<input type="radio" id="tel2" name="findradio" value="tel"> �޴��ȣ
            	</div>
            	<div class="n_dv2">
            	<label id="name2">���̵�</label>
            	<input type="text" name="idd_pw"><br>
            	<label id="name2">�̸�</label>&nbsp;&nbsp;&nbsp; 
            	<input type="text" name="name_pw"><br>
            	<label title="email2">�̸���</label>
            	<input type="text" name="email_pw"><br>
            	</div>
            	
            	<div class="e_dv2">
            	<label id="name2">���̵�</label>&nbsp;&nbsp;&nbsp;
            	<input type="text" name="idd_pw2"><br>
            	<label id="name2">�̸�</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<input type="text" name="name_pw2"><br>
            	<label title="tel">��ȭ��ȣ</label>
            	<input type="text" name="tel_pw"><br>
            	</div>
            	
            	<a href="javascript:PWsearch()"><input type="button" id="s_btn2" value="�Ϸ�"></a>
            	<input type="button" id="c_btn2" value="���">
            	
            	</div>
                <!-- <p style="text-align:center; background:#ffffff; padding:20px;"><a href="#" class="close">�ݱ�X</a></p> -->
            </div>
          </form>
        </div>
    </div>

</body>
</html>