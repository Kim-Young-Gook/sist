<%@page import="sist.com.dao.BoardDao"%>
<%@page import="sist.com.bean.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>������</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<link href="../css/contents.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
<script>
	function sendCheck() {
		//�������
		var obj = document.bbsForm;
		if (!(obj.writer.value) || !(obj.title.value) || !(obj.password.value)
				|| !(obj.contents.value)) {
			alert('NODATA');
			clearData(obj);
		} else {
			obj.writer.focus();
			obj.submit();
		}
	}
	function clearData(obj) {
		obj.writer.value = ' ';
		obj.title.value = ' ';
		obj.password.value = ' ';
		obj.contents.value = ' ';
		obj.file.value = ' ';
		obj.category.value = ' ';

	}
	function changeImg() {
		var obj = document.bbsForm;
		obj.change.type = "hidden";
		obj.file.type = "file";
	}
</script>
<style>
.w3-input{
	max-width:450px;
}
.w3-select{
	max-width:450px;
}

</style>
</head>
<%
	String job = request.getParameter("job");
	String ref = request.getParameter("ref");
	String step = request.getParameter("step");
	String lev = request.getParameter("lev");
	String pnum = request.getParameter("pnum");
	String category =request.getParameter("category");
	job = job == null ? "new" : job;
	Board board = null;
	String no = request.getParameter("no");
	if (job.equals("modify")) {
		board = (Board) BoardDao.selectInfoBoard(Integer.parseInt(no));//�����ۿ� �����ȿ� �������� Ű���带 ������ 
	}
	request.getAttributeNames();
	request.setAttribute("test", "category");
	
	request.getCharacterEncoding();
%>

<body>
	<div id="wrapper">
		<div id="container">
			<div id="contentsWrap" class="contentsWrap">
				<div class="contents">
					<div class="w3-card-4">
					  <div class="w3-container w3-brown" style="text-align:right;padding:10px">
						<div class="loginWrap">
							<span class="fir">2012.05.17</span> <span>13:30:22</span> <span><em>OOO��</em>
								���� �Ϸ� �Ǽ���</span> <a href="" class="btnLogout"><img
								src="../img/common/btn_logout.gif" alt="�α׾ƿ�" /></a>
						</div>
						 <h2 style="text-align:center !important">�Խñ� ���</h2>
					  </div>
					  <form class="w3-container" style="margin-left:35%"
					  	id="form"  action="AirEditInsert.jsp?job=<%=job%>&no=<%=no%>" method="post" name="bbsForm" enctype="multipart/form-data">
					    <label class="w3-text-brown"><b>ī�װ�</b></label>
					    <p>      
						    <select class="w3-select w3-border" name="category">
								<option value="">���ø� �������ּ���</option>
								<option value="">----------------------</option>
								<option value="busan">���λ�</option>
								<option value="seoul">������</option>
								<option value="jeju">.���ֵ�</option>
						    </select>
					    </p>
						<input type="hidden" name="job" value="<%=job%>" /> 
						<input type="hidden" name="ref" value="<%=ref%>" /> 
						<input type="hidden" name="step" value="<%=step%>" /> 
						<input type="hidden" name="lev" value="<%=lev%>" /> 
						<input type="hidden" name="pnum" value="<%=pnum%>" /> 
						<input type="hidden" name="category" value="<%=category%>" /> 
						
					    <p>      
						    <label class="w3-text-brown"><b>�ۼ���</b></label>
						    <input class="w3-input w3-border w3-sand" name="writer" type="text" maxlength="50"/>
					    </p>
					    
					    <p>      
						    <label class="w3-text-brown"><b>����</b></label>
						    <%if (job.equals("modify")) {%>
							    <input class="w3-input w3-border w3-sand" name="title" type="text" maxlength="50" value="<%=board.getTitle()%>"/>
							<%}else{%>
							    <input class="w3-input w3-border w3-sand" name="title" type="text" maxlength="50"/>
							<%}%>
					    </p>
					    
					    <p>
						    <label class="w3-text-brown"><b>��й�ȣ</b></label>
						    <input class="w3-input w3-border w3-sand" name="password" type="password" maxlength="20"/>
					    </p>
					    
					    <p>      
						    <label class="w3-text-brown"><b>����</b></label>
						    <%if (job.equals("modify")) {%>
							    <textarea class="w3-input w3-border" name="contents" style="resize:none"><%=board.getContents() %></textarea>
   							<%}else{%>
							    <textarea class="w3-input w3-border" name="contents" style="resize:none"></textarea>
							<%}%>
					    </p>
					    
					    <p>
						    <label class="w3-text-brown"><b>���ϼ���</b></label>
						    <%if (job.equals("modify")) {%>
   								<input type="button" name="change" class="inputText" value="�̹��� ����" onclick="changeImg()" />	
							    <input type="file" name="file" class="w3-input w3-border w3-sand"/>
   							<%}else{%>
							    <input type="file" name="file" class="w3-input w3-border w3-sand"/>
							<%}%>
					    </p>
					    <p>
					    	<button class="w3-btn w3-round w3-blue" onclick="javascript:sendCheck()">����</button>
					    	<button class="w3-btn w3-yellow" onclick="javascript:sendCheck()">����</button>
					    	<button class="w3-btn w3-red" onclick="">����</button>
					    	<button class="w3-btn w3-green" onclick="<%=request.getContextPath()%>/air/AirBoardList.jsp">���</button>
					    </p>
					  </form>
					</div>				
				</div>
			</div>
		</div>
	</div>
</body>
</html>