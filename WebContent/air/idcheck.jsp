<%@page import="sist.com.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̵�˻�</title>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script  src="../scriptPro/idcheckJS.js" charset="utf-8"></script>
<style type="text/css">
*{
   margin: 0;
   padding: 0;
}
   #idcheck_div{
      background-color: #008ca8;
      width: 6px;
      width: 540px;
    height: 390px;
      
   }
   input.input {
   margin-top: 130px;
    height: 30px;
    margin-left: 150px;
    font-size: 18px;
    width: 200px;
   }
   button {
    background-color: transparent;
    width: 40px;
    height: 30px;
    border: 0px;
    color: white;
    }
    button:hover{
    border: 1px solid white;
    }
    .idcheck_table{
    margin-left: 110px;
    margin-top: 30px;
    color: white;
    }
</style>
</head>
<%
   String id = request.getParameter("id");
	/* out.print(id); */
   boolean flag = false;
   if(id!=null){
      //out.print(id);
      flag=MemberDao.idCheck(id);
   }
%>
   
<body>
<div id="idcheck_div">
   
   <form action="idCheckProcess.jsp" name="idCheckFrm" method="get">
      <table class="idcheck_table">
      <%
         if(id!=null && flag){
      %>
         <tr>
            <td id="check_txt">
               �Է��Ͻ� ���̵� <%=id %>�� �̹� ������� ID�Դϴ�.
               <p>�ٸ� ID�� �Է��Ͽ� �ּ���.</p>
            </td>
         </tr>
         <%
         }else if(id!=null && !(flag)){
      %>
         <tr>
            <td id="check_txt">
               �Է��Ͻ� ���̵�<%=id %>�� ��밡���� ID�Դϴ�.<br>
               ����Ͻ÷��� <a href="#" onclick="IDSet('<%=id%>')"><strong>���⸦ Ŭ�����ּ���</strong></a>
            </td>
         </tr>
         <%} %>
         <tr>
            <div class="idcheck_tr_div">
            <input type="text" name="id" value="<%=id %>" class="input" />
         <!--    <button onclick="sendId()">�˻�</button> -->
            </div>
         </tr>
      </table>
   </form>
</div>
</body>
</html>