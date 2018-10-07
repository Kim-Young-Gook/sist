<%@page import="sist.com.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDao.updateHit(no);
		response.sendRedirect("info.jsp?no="+no);
	%>

</body>
</html>