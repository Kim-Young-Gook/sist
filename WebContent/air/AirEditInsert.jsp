<%@page import="sist.com.dao.BoardDao"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="sist.com.bean.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("euc-kr"); /*순서 중요.. 데이터를 받아서  인코딩하려고하면 소용이없다. 위에있어야지 requset가 가리키는곳을 인코딩함  */
%>
<%-- <jsp:useBean id="bean" class="sist.com.bean.Board" scope="page"/> <!--session을 쓰면 editText setattribute가 필요없다.  -->
<jsp:setProperty property="*" name="bean"/> <!--name 같아야함.  --> --%>

<%
	String job = request.getParameter("job");
	Board board = new Board();
	String fileName = "";
	if(!(job.equals("modify"))){
		board.setNo(BoardDao.getSequence());
	}else{
		board.setNo(Integer.parseInt(request.getParameter("no")));
	}
	try {
		String filePath = "C:\\work\\air_TP\\webPro\\WebContent\\air\\upload\\";
		/*upload뒤에 \\해줘야 파일을 붙여야 알아서 붙음  */
		if (FileUpload.isMultipartContent(request)) {
			DiskFileUpload diskFileUpload = new DiskFileUpload();
			diskFileUpload.setRepositoryPath(filePath);
			diskFileUpload.setSizeMax(1024 * 1024 * 10);
			List<FileItem> list = diskFileUpload.parseRequest(request);
			System.out.println(list);
			for (int i = 0; i < list.size(); i++) {
				//list.get(i); /*FileItem이다  */
				FileItem fileItem = list.get(i);
				//out.println(fileItem.getFieldName()+" "+i+" "+fileItem.isFormField()); /*isfomfiel true: text  false: file  */
				String name = fileItem.getFieldName();
				if (job.equals("reply")) {
					if (name.equals("ref")) {
						board.setRef(Integer.parseInt(fileItem.getString("EUC-KR")));
					}
					if (name.equals("step")) {
						board.setStep(Integer.parseInt(fileItem.getString("EUC-KR")));
					}
					if (name.equals("lev")) {
						board.setLev(Integer.parseInt(fileItem.getString("EUC-KR")));
					}
					if (name.equals("pnum")) {
						board.setPnum(Integer.parseInt(fileItem.getString("EUC-KR")));
					}

				}
				if (name.equals("title")) {
					board.setTitle(fileItem.getString("EUC-KR"));
				}
				if (name.equals("writer")) {
					board.setWriter(fileItem.getString("EUC-KR"));
				}
				if (name.equals("password")) {
					board.setPassword(fileItem.getString("EUC-KR"));
				}
				if (name.equals("contents")) {
					board.setContents(fileItem.getString("EUC-KR"));
				}
				if (!fileItem.isFormField()) {
					board.setFileName(fileItem.getName());
					File file = new File(filePath + board.getFileName());
					fileItem.write(file);
				}
				if (name.equals("category")) {
					board.setCategory(fileItem.getString("EUC-KR"));
				}
			} //FOR
		}else{
			DiskFileUpload diskFileUpload = new DiskFileUpload();
			diskFileUpload.setRepositoryPath(filePath);
			diskFileUpload.setSizeMax(1024 * 1024 * 10);
			List<FileItem> list = diskFileUpload.parseRequest(request);
			
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	board.setJob(job);

	if (job.equals("new")) {
		board.setRef(board.getNo());
		board.setPnum(board.getNo());
	} else if (job.equals("reply")) {
		BoardDao.updateReply(board);
		BoardDao.updateStep(board);
		board.setStep(board.getStep() + 1);
		board.setLev(board.getLev() + 1);
	}
	System.out.println(board);
	if(job.equals("modify")){
		BoardDao.updateBoard(board);
	}
	else{
		System.out.println(board);
		BoardDao.insertBoard(board);	
	}
	request.setAttribute("category", board.getCategory());
	String c =  board.getCategory() == null ? ""  : board.getCategory();
	response.sendRedirect("AirBoardList.jsp?category="+c);
%>
</head>
<body>

</body>
</html>