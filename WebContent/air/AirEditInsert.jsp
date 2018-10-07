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
	request.setCharacterEncoding("euc-kr"); /*���� �߿�.. �����͸� �޾Ƽ�  ���ڵ��Ϸ����ϸ� �ҿ��̾���. �����־���� requset�� ����Ű�°��� ���ڵ���  */
%>
<%-- <jsp:useBean id="bean" class="sist.com.bean.Board" scope="page"/> <!--session�� ���� editText setattribute�� �ʿ����.  -->
<jsp:setProperty property="*" name="bean"/> <!--name ���ƾ���.  --> --%>

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
		/*upload�ڿ� \\����� ������ �ٿ��� �˾Ƽ� ����  */
		if (FileUpload.isMultipartContent(request)) {
			DiskFileUpload diskFileUpload = new DiskFileUpload();
			diskFileUpload.setRepositoryPath(filePath);
			diskFileUpload.setSizeMax(1024 * 1024 * 10);
			List<FileItem> list = diskFileUpload.parseRequest(request);
			System.out.println(list);
			for (int i = 0; i < list.size(); i++) {
				//list.get(i); /*FileItem�̴�  */
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