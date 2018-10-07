<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="sist.com.bean.Board"%>
<%@page import="sist.com.dao.BoardDao"%>
<%@page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>������</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<link href="../css/contents.css" rel="stylesheet" type="text/css" />

<style>
#tTitle.ti {
	text-align: left;
}
</style>


<script>
	function logoutPage() {
		alert('logoout');
		location.href = 'logoutPro.jsp';
	}
	function searchCheck() {
		var obj = document.searchFrm;
		if (obj.query.value == 'empty' || !(obj.data.value)) {
			alert('Query or Data Check!');
			obj.query.selectedIndex = 0;
			obj.data.value = '';
			obj.query.focus();
		} else {
			obj.submit();
		}

	}
</script>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
	String query = request.getParameter("query");
	String data = request.getParameter("data");
	String category = request.getParameter("category") == null ? "" : request.getParameter("category");
	HashMap<String, Object> map = new HashMap<String, Object>();
	int totalRow = 0;
	if (query != null && data != null) {
		map.put("query", query);
		map.put("data", data);
		map.put("category",category);
		totalRow = BoardDao.getTotalRow(map);
	} else {
		totalRow = BoardDao.getTotalRow(null);
	}
	int pageScale = 2;
	//int totalRow=BoardDao.getTotalRow();
	int currentPage = 1;
	int totalPage = totalRow % pageScale == 0 ? (totalRow / pageScale) : (totalRow / pageScale) + 1;
	if (totalRow == 0)
		totalPage = 1;

	try {
		currentPage = Integer.parseInt(request.getParameter("page"));
	} catch (Exception e) {

	}

	//currentPage���� start,end�� ����
	int start = pageScale * (currentPage - 1) + 1;
	int end = pageScale + (currentPage - 1) * pageScale;

	int currentBlock = currentPage % pageScale == 0 ? (currentPage / pageScale)
			: (currentPage / pageScale) + 1; /* 1 10 1 11 20 2 ; */
	int startPage = 1 + (currentBlock - 1) * pageScale;
	int endPage = pageScale + (currentBlock - 1) * pageScale;

	if (totalPage <= endPage) {

		endPage = totalPage;
	}

	int prevPage = currentPage - 1;
	if (prevPage == 0) {
		prevPage = 1;
	}

	int nextPage = currentPage + 1;

	if (nextPage == totalPage + 1) {
		nextPage = totalPage;
	}
	/*start   end */
	map.put("start", start);
	map.put("end", end);

	List<Board> list = null;
	list = BoardDao.selectBoard(map);
%>

<body>
	<div id="wrapper">
		<div id="header">
			<div class="topInfoWrap">
				<div class="topInfoArea clfix">
					<div class="loginWrap">
						<span class="fir">2012.05.17</span> <span>13:30:22</span> <span><em>��</em>
							���� �Ϸ� �Ǽ���</span> <a href="javascript:logoutPage()" class="btnLogout"><img
							src="../img/common/btn_logout.gif" alt="�α׾ƿ�" /> </a>
					</div>
				</div>
			</div>
			<div class="gnbSubWrap"></div>
		</div>
		<div id="container">
			<div id="contentsWrap" class="contentsWrap">
				<div class="contents">
					<h1 class="title">�Խ��� ����Ʈ</h1>
					<div class="btnSet clfix mgb15">
						<span class="fr"> <span class="button"><a
								href="javascript:searchCheck()">�˻�</a></span> <span class="button"><a
								href="boardList.jsp">���ΰ�ħ</a></span> <span class="button"><a
								href="edit.jsp">�۾���</a></span> <span class="button"><a
								href="edit.jsp">�� ��</a></span>
						</span>
					</div>


					<form action="" method="post" name="searchFrm">
						<table class="bbsWrite mgb35">
							<caption></caption>
							<colgroup>
								<col width="30" />
								<col width="120" />
								<col width="120" />
								<col width="120" />
								<col width="120" />
								<col width="120" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th>�˻�</th>
									<td><select id="query" name="query">
											<option selected="selected" value="empty">�����ϼ���</option>
											<option value="title">����</option>
											<option value="writer">�ۼ���</option>
											<option value="contents">����</option>
									</select> <input type="text" name="data" class="inputText" size="30" /></td>
								</tr>
							</tbody>
						</table>
					</form>

					<table class="bbsList">
						<colgroup>
							<col width="30" />
							<col width="120" />
							<col width="120" />
							<col width="120" />
							<col width="120" />
							<col width="120" />
							<col width="120" />

						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="fir">NO</th>
								<th scope="col">IMG</th>
								<th scope="col">TITLE</th>
								<th scope="col">WRITER</th>
								<th scope="col">HIT</th>
								<th scope="col">REGDATE</th>
								<th scope="col">REPLY</th>
							</tr>
						</thead>

						<tbody>
							<%
								for (int i = 0; i < list.size(); i++) {
									Board board = list.get(i);
							%>
							<tr>
								<td class="fir"><%=board.getRm()%></td>
								<td class="fir"><a href="hit.jsp?no=<%=board.getNo()%>">
										<img src="/webPro/air/upload/<%=board.getFileName()%>"
										width="50" height="50" />
								</a></td>
								<td id="tTitle" class="ti">
									<%
										if (board.getLev() == 0) {
									%> <img src="/webPro/air/img/new.gif" width="20" height="20" />
									<%
										} else {
												for (int j = 0; j < board.getLev(); j++) {
									%> &nbsp;&nbsp; <%
 										} //for
 									%> <img src="/webPro/air/img/reply.png" width="15"
									height="15" /> <%
 										} //else
									 %> <%=board.getTitle()%>

								</td>
								<td class="fir"><%=board.getWriter()%></td>
								<td class="fir"><%=board.getHit()%></td>
								<td class="fir"><%=board.getRegdate()%></td>
								<td class="fir"><%=board.getReply()%></td>

							</tr>
							<%
								}
							%>

						</tbody>
					</table>



					<div class="paging">
						<a href="AirBoardList.jsp?page=1"><img
							src="../img/button/btn_first.gif" alt="ó��������" /></a>
						<%
							if (currentBlock > 1) {
						%>
						<a href="boardList.jsp?page=<%=startPage - 1%>"><img
							src="../img/button/btn_prev.gif" alt="����" /></a>

						<%
							} else {
						%>

						<a href="#"><img src="../img/button/btn_prev.gif" alt="����" /></a>
						<%
							}
						%>
						<%
							if (currentPage > 1) {
						%>
						<a href="AirBoardList.jsp?page=<%=currentPage - 1%>">Before</a>
						<%
							} else {
						%>
						Before
						<%
							}
						%>
						<%
							for (int i = startPage; i <= endPage; i++) {
								if (i == currentPage) {
						%>
						<a href="#"><font size="2" color="red">[<%=i%>]
						</font></a>
						<%
							} else {
						%>
						<span><a href="AirBoardList.jsp?page=<%=i%>"><%=i%></a> <%
 						}
 						%> <%
 					}
 					%> <%
 					if (endPage < totalPage) {
					 %> <a href="AirBoardList.jsp?page=<%=currentPage + 1%>">Next</a> <%
 					} else {
 				%> <a href="#">Next</a> <%
 				}
 			%> <%
 			if (endPage > totalPage) {
 		%> <a href="AirBoardList.jsp?page=<%=endPage + 1%>"><img
								src="../img/button/btn_next.gif" alt="����" /></a> <%
 		} else {
 	%> <a href="#"><img src="../img/button/btn_next.gif" alt="����" /></a> <%
 	}
 %> <a href="AirBoardList.jsp?page=<%=totalPage%>"><img
								src="../img/button/btn_last.gif" alt="������������" /></a> </span>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>