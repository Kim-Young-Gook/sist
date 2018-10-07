<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="sist.com.bean.Board"%>
<%@page import="sist.com.dao.BoardDao"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/webPro/air/css/header.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/>
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
<style>
.pagination{
 display:inline-block; !important;
}
</style>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
	String query = request.getParameter("query");
	String data = request.getParameter("data");
	String category1 = request.getParameter("category") == null ? "" : request.getParameter("category");
	HashMap<String, Object> map = new HashMap<String, Object>();
	int totalRow = 0;
	if (query != null && data != null) {
		map.put("query", query);
		map.put("data", data);
		map.put("category", category1);
		
		totalRow = BoardDao.getTotalRow(map);
	} else {
		totalRow = BoardDao.getTotalRow(null);
	}

	String category = null;
	category = request.getParameter("category")==null? "" : request.getParameter("category").toString();
	map.put("category", category);

	int pageScale = 10;
	//int totalRow=BoardDao.getTotalRow();
	int currentPage = 1;
	int totalPage = totalRow % pageScale == 0 ? (totalRow / pageScale) : (totalRow / pageScale) + 1;
	if (totalRow == 0)
		totalPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("page"));
	} catch (Exception e) {

	}

	//currentPage따라 start,end값 구함
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
					<div class="loginWrap" style="text-align: right;padding-top:10px;padding-right:10px;">
						<span class="fir"></span> <span>13:30:22</span> <span><em>님</em>
							좋은 하루 되세요</span> <a href="javascript:logoutPage()" class="btnLogout"><img
							src="/webPro/air/img/img/common/btn_logout.gif" alt="로그아웃" /> </a>
					</div>
				</div>
			</div>
			<div class="gnbSubWrap"></div>
		</div>
		<div id="container">
		<div class="row">
               <div class="text-center">
                   <div class="box">
                       <div class="box-content">
							<% if(category.equals("jeju")){%>
							<jsp:include page="/air/categoryContents/jeju.jsp" /> 
							<%} %>
							<% if(category.equals("busan")){%>
							<jsp:include page="/air/categoryContents/busan.jsp" /> 
							<%} %>
							<% if(category.equals("seoul")){%>
							<jsp:include page="/air/categoryContents/seoul.jsp" /> 
							<%} %>
                       </div>
                   </div>
               </div>
           </div>
<!--            <a href="ppc.html" class="btn btn-block btn-primary">Learn more</a> -->
			<div id="contentsWrap" class="contentsWrap">
				<div class="contents">
					<h1 class="title">리뷰 게시판</h1>
					<div style="width:100%;text-align:right">
						<button type="button" onclick="location.href='AirEdit.jsp'" class="btn btn-indigo btn-sm m-0 btn-primary">글쓰기</button>
						<button type="button" onclick="location.href='AirBoardList.jsp?category=<%=category %>'" class="btn btn-indigo btn-sm m-0">새로고침</button>
						<button type="button" onclick="location.href='AirEdit.jsp'" class="btn btn-indigo btn-sm m-0 btn-success">수정</button>
						<button type="button" onclick="location.href='AirEdit.jsp'" class="btn btn-indigo btn-sm m-0 btn-danger">삭제</button>
					</div>
					<span style="margin-right:10px">검색</span><select id="query" name="query" style="display:inline-block">
											<option selected="selected" value="empty">선택하세요</option>
											<option value="title">제목</option>
											<option value="writer">작성자</option>
											<option value="contents">내용</option>
											<option value="category">카테고리</option>
					</select>
					<input type="text" name="data" size="30" value="" style="display:inline" />
					<button type="button" onclick="javascript:searchCheck()" class="btn btn-indigo btn-sm m-0">검색</button> 
					<form action="" method="post" name="searchFrm">
						<table class="table">
						  <thead class="black white-text">
						    <tr>
								<th scope="col" class="fir">NO</th>
								<th scope="col">IMG</th>
								<th scope="col">TITLE</th>
								<th scope="col">WRITER</th>
								<th scope="col">HIT</th>
								<th scope="col">REGDATE</th>
								<th scope="col">REPLY</th>
								<th scope="col">CATEGORY</th>
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
								<img src="/webPro/air/upload/<%=board.getFileName()%>" width="50" height="50" />
								</a>
								</td>
								
								<td id="tTitle" class="ti">
									<%
										if (board.getLev() == 0) {
									%> <img src="/webPro/air/img/img/button/new.gif" width="20" height="20" />
									<%
										} else {
												for (int j = 0; j < board.getLev(); j++) {
									%> &nbsp;&nbsp; <%
 								} //for
	 						%> <img src="/webPro/air/img/img/button/reply.png" width="15" height="15" /> <%
				 		} //else
 						%> <%=board.getTitle()%>
								</td>
								<td class="fir"><%=board.getWriter()%></td>
								<td class="fir"><%=board.getHit()%></td>
								<td class="fir"><%=board.getRegdate()%></td>
								<td class="fir"><%=board.getReply()%></td>
								<td class="fir">
								
								<% if(board.getCategory()!=null && board.getCategory().equals("jeju")){%>
									제주도
								<%} %>
								<% if(board.getCategory()!=null && board.getCategory().equals("seoul")){%>
									서울
								<%} %>
								<% if(board.getCategory()!=null && board.getCategory().equals("busan")){%>
									부산
								<%} %>
								</td>
							</tr>
							<%
								}
							%>
							<% if(list.size() == 0){%>
								<tr>
									<td colspan="8" class="test" style="text-align: center;margin-top: 40px;padding-top: 40px;padding-bottom: 40px;font-size: 20px;">
										조회된 내용이 없습니다.
									</td>
								</tr>
							<%}
							%>
						</tbody>
						</table>
					</form>
					<div class="paging" style="text-align:center; width: 100%; padding-top: 15px;">
						<a href="AirBoardList.jsp?page=1">
							<img src="/webPro/air/img/img/button/btn_first.gif" alt="처음페이지" /></a>
						<%
						if (currentBlock > 1) {
						%>
						<a href="AirBoardList.jsp?page=<%=startPage - 1%>">
							<img src="/webPro/air/img/img/button/btn_prev.gif" alt="이전" /></a>
						<%
							} else {
						%>

						<a href="#">
							<img src="/webPro/air/img/img/button/btn_prev.gif" alt="이전" />
						</a>
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
						 %> 
 						<%	
 							}
			 				%> <%
			 				if (endPage < totalPage) {
 							%> <a href="AirBoardList.jsp?category=<%=request.getParameter("category") == null ? "" : request.getParameter("category")%>page=<%=currentPage + 1%>">Next</a> <%
 							} else {
 							%> <a href="#">Next</a> <%
 							}
 							%> <%
 							if (endPage > totalPage) {
 							%> <a href="AirBoardList.jsp?&page=<%=endPage + 1%>"><img
								src="/webPro/air/img/img/button/btn_next.gif" alt="다음" /></a> <%
 						} else {
 						%> <a href="#"><img src="/webPro/air/img/img/button/btn_next.gif" alt="다음" /></a> <%
 						}
 							%> <a href="AirBoardList.jsp?page=<%=totalPage%>">
 						<img src="/webPro/air/img/img/button/btn_last.gif" alt="마지막페이지" /></a> </span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>