<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>�ֿ��������</title>
<link href="../sist/css/common.css" rel="stylesheet" type="text/css" />
<link href="../sist/css/user.css" rel="stylesheet" type="text/css" />
</head>

<body>
  
<div id="wrap">
	<!-- #header -->
    <div id="header"><!-- /#header01 -->
        <h1><a href="" onfocus='this.blur()'>�ֿ��������</a></h1>
       	<div class="header_login">�α��� | ȸ������</div>
  	</div>
    <!-- /#header -->
    <p id="header_img"><img src="../sist/img/sq_member.gif" width="970" height="77" alt="photo" /></p>
    
    <!-- #contents -->
  <div id="contents">
    	<!-- #left -->
        <div id="left">
            <ul id="lmenu">
            	<li class="lmenu01"><a href="">�����Խ���</a></li>
            </ul>
        </div><!-- /#left -->
        
        <!-- #right -->
        <div id="right">
          <table width="700"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="25" class="top_navi"><div align="right"><img src="../sist/img/icon_arrow_orange.gif" width="8" height="9" /> Ȩ <img src="../sist/img/icon_arrow_gray.gif" width="8" height="9" /> �Խù� ���� <img src="../sist/img/icon_arrow_gray.gif" width="8" height="9" /> �����Խ��� </div></td>
            </tr>
            <tr>
              <td height="30" class="blue14"><strong>�Խù� ����/����/ ����</strong></td>
            </tr>
            <tr>
              <td height="1" bgcolor="DDDDDD"></td>
            </tr>
            <tr>
              <td height="26">&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
          </table>
        <form action="confirmCheck.jsp" method="post" name="frm">
            <ul id="join_comp1">
            	<li><img src="../sist/img/img_key.gif" width="51" height="67" alt="Ȯ��" align="absmiddle" />&nbsp;            	
            	<input name="cp" type="password" class="input" size="20" />
            	<input type="hidden" name="no" value="<%=request.getParameter("no")%>"/>
            	<input type="hidden" name="job" value="<%=request.getParameter("job")%>"/>
            	<input type="hidden" name="pnum" value="<%=request.getParameter("pnum")%>"/>
            	
       	    &nbsp;
       	    <img src="../sist/img/btn_confirm2.gif" width="57" height="28" alt="Ȯ��"  onclick="document.frm.submit()"/> </li>
		  </ul>
              <p>* �Խù��� ��б��� ��� �Խù��� ���ñ� ���� �Խù��� ��й�ȣ�� �ʿ��մϴ�.</p>
           
         </form> 
    </div>
        <!-- /#right -->
    
  </div><!-- /#contents -->

</div><!-- /#wrap -->

<!-- #foot -->
<div id="foot">
	<div id="foot2">
    	<p id="foot_l"><strong>�ֿ��������</strong></p><!-- /#foot_l -->
        <div id="foot_m">
        	<ul>
            	<li><img src="../sist/img/smenu_foot01.gif" width="83" height="11" alt="����������޹�ħ" /></li>
                <li><img src="../sist/img/smenu_foot02.gif" width="47" height="11" alt="�̿���" /></li>
                <li><img src="../sist/img/smenu_foot03.gif" width="101" height="11" alt="�̸��� ���ܼ����ź�" /></li>
                <li><img src="../sist/img/smenu_foot04.gif" width="47" height="11" alt="��������" /></li>
            </ul>
            
        </div><!-- /#foot_m -->
        
    </div>
</div><!-- /#foot -->

</body>
</html>
