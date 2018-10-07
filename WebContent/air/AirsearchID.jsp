<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"> 
//<![CDATA[
    function wrapWindowByMask(){
  
        //ȭ���� ���̿� �ʺ� ���Ѵ�.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
  
        //����ũ�� ���̿� �ʺ� ȭ�� ������ ����� ��ü ȭ���� ä���.
        $("#mask").css({"width":maskWidth,"height":maskHeight});  
  
        //�ִϸ��̼� ȿ�� - �ϴ� 0�ʵ��� ��İ� �ƴٰ� 60% �������� ����.
  
        $("#mask").fadeIn(0);      
        $("#mask").fadeTo("slow",0.6);    
  
        //������ ���� �� ����.
        $(".window").show();
  
    }
  
    $(document).ready(function(){
        //���� �� ����
        $(".openMask").click(function(e){
            e.preventDefault();
            wrapWindowByMask();
        });
  
        //�ݱ� ��ư�� ������ ��
        $(".window .close").click(function (e) {  
            //��ũ �⺻������ �۵����� �ʵ��� �Ѵ�.
            e.preventDefault();  
            $("#mask, .window").hide();  
        });       
  
        //���� ���� ������ ��
        $("#mask").click(function () {  
            $(this).hide();  
            $(".window").hide();  
  
        });      
  
    });
  
//]]>
</script>
<style> 
/* ����ũ �ٿ�� */
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
/* �˾����� �ߴ� ������ css  */
.window{
    display: none;
    position:absolute;  
    left:50%;
    top:50px;
    margin-left: -500px;
    width:1000px;
    height:500px;
    background-color:#FFF;
    z-index:10000;   
 }
  
</style>
</head>
<body>
	 <div id="wrap2"> 
        <div id="container">  
            <div id="mask"></div>
            <div class="window">
                <p style="width:1000px;height:500px;text-align:center;vertical-align:middle;">�˾� ���� �Է�</p>
                <p style="text-align:center; background:#ffffff; padding:20px;"><a href="#" class="close">�ݱ�X</a></p>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">       
                <tbody><tr>
                    <td align="center">
                    <a href="#" class="openMask">���̾� �˾� �߻�</a>
                    </td>
                </tr>       
            </tbody></table>
        </div>
    </div>

</body>
</html>