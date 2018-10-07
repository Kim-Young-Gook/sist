<%@page import="sist.com.dao.BoardDao"%>
<%@page import="sist.com.bean.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	String pw = request.getParameter("cp");
	String job = request.getParameter("job"); 
	//int pnum = Integer.parseInt(request.getParameter("pnum"));
	int no = Integer.parseInt(request.getParameter("no"));
	//int ref = Integer.parseInt(request.getParameter("ref"));
	//int step = Integer.parseInt(request.getParameter("step"));
	//String dbpass=BoardDao.getPassWord(no);
	//board.setPnum(pnum);

	Board board = (Board)BoardDao.selectInfoBoard(no);
	board.setJob(job);
	board.setNo(no);

	if (pw.trim().equals(request.getParameter("cp")) && pw != null) {
		if(job.equals("delete")){
		BoardDao.deleteBoard(board);
		BoardDao.updateReply(board);
		BoardDao.updateStep(board);
		System.out.println("비번성공");
		System.out.println(board.getJob());
		response.sendRedirect("AirBoardList.jsp");
		}else{
			response.sendRedirect("AirEdit.jsp?no="+no+"&job="+job);
		}
	} else {
		System.out.println("비번실패");
	}

	/*  if(dbPass.trim().equals(cp)){
	     if(job.equals("delete")){  
	BoardDao.upateReply(new Board(pnum,job));              
	BoardDao.updateStep(new Board(ref,step,"delete"));
	     }
	  } */
%>
<body>

</body>
</html>