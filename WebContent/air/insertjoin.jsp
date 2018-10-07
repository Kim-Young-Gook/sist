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
	Member member = new Member();
	member.setNo(MemberDao.getSequence());
	member.setZipcode(request.getParameter("naddress"));
	member.setName(request.getParameter("name"));
	member.setId(request.getParameter("id"));
	member.setPassword(request.getParameter("pass2"));
	member.setBirthday(request.getParameter("birth"));
	member.setAddress(request.getParameter("textaddress"));
	member.setEmail(request.getParameter("email"));
	member.setTel(request.getParameter("tel"));
	member.setCp(request.getParameter("cp"));
	member.setAdmin(request.getParameter("admin"));
	MemberDao.insertMember(member);
	response.sendRedirect("AirLogin.jsp");
%>
</body>
</html>