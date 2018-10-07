
<%@page import="java.util.List"%>
<%@page import="sist.com.bean.Member"%>
<%@page import="sist.com.dao.MemberDao"%>
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
request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	out.print(name+" "+email);
%>
</body>
</html>