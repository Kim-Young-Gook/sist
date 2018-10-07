<%@page import="sist.com.dao.BoardDao"%>
<%@page import="sist.com.bean.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
<%
	Board board = (Board) BoardDao.selectInfoBoard(Integer.parseInt(request.getParameter("no")));
%>
<script>
	function deleteboard(reply, no, job, pnum) {
		/*alert(reply+" "+no+" "+job);
		}	 *//* 들어오는지 확인을 하고 다음 단계로 넘어가야한다!!!!!!!!! */
		if (reply > 0) {
			alert('자식글이 있습니다..');
			return false;
		} else {
			document.location.href = 'confirm.jsp?no='+no+'&job='+job+'&pnum='+pnum;
		}
	}
/* 	function responeboard(category){
		
		if(category = 'jeju'){
		document.location.href = 'AirBoardList.jsp?category=jeju';
		}
		if(category = 'seoul'){
			document.location.href = 'AirBoardList.jsp?category=seoul';
		}
		if(category = 'busan'){
			document.location.href = 'AirBoardList.jsp?category=busan';
		} */
</script>
</head>
<body>
<%=board %>
	<div id="wrapper">
		<!-- wrpper -->
		<div id="container">
			<!-- container -->
			<div id="contentsWrap" class="contentsWrap">
				<!-- contentsWrap -->
				<div class="contents">
					<!-- contents -->
					<div class="w3-container w3-teal w3-margin-bottom">
						<div id="header">
							<div class="topInfoWrap">
								<div class="topInfoArea clfix">
									<div class="loginWrap"
										style="text-align: right; padding-top: 10px; padding-right: 10px; padding-bottom: 10px;">
										<span class="fir" text-align:right>2012.05.17</span> <span
											text-align:right>13:30:22</span> <span text-align:right><em>OOO</em>Have
											a nice day.</span> <a href="" class="btnLogout"> <img
											src="/webPro/air/img/img/common/btn_logout.gif" alt="로그아웃" /></a>
									</div>
								</div>
							</div>
							<div class="gnbSubWrap"></div>
						</div>
					</div>

					<div class="w3-row-padding ">
						<div class="w3-twothird">
							<div style="width: 100%; text-align: center;">
								<img src="/webPro/air/upload/<%=board.getFileName()%>"
									width="410" height="330" style="text-align: center;" />
							</div>
							<h2>이용후기 상세정보</h2>
							<table class="w3-table w3-striped w3-bordered w3-border">
								<tr>
									<td style="width: 30%">No</td>
									<td><%=board.getNo()%></td>
								</tr>

								<tr>
									<td>writer</td>
									<td><%=board.getWriter()%></td>
								</tr>

								<tr>
									<td>Title</td>
									<td><%=board.getTitle()%></td>
								</tr>

								<tr>
									<td>Date</td>
									<td><%=board.getRegdate()%></td>
								</tr>

								<tr>
									<td>Hit</td>
									<td><%=board.getHit()%></td>
								</tr>
							</table>
						</div>

						<div class="w3-third">
							<h1>Travel review</h1>
						</div>
						<%=board.getContents()%>
					</div>
				</div>
			</div>
			<p>
				<button class="w3-btn w3-yellow"
					onclick="location.href='confirm.jsp?job=modify&no=<%=board.getNo()%>'">수정</button>
				<button class="w3-btn w3-red"
					onclick="javascript:deleteboard(<%=board.getReply()%>,<%=board.getNo()%>,'delete',<%=board.getPnum()%>)">삭제</button>

				<!-- <button class="w3-btn w3-green" onclick="location.href='AirBoardList.jsp?'">목록</button> -->
				<%-- 	<button class="w3-btn w3-green" onclick="javascript:responeboard(<%=board.getCategory()%>)">목록</button> --%>
				<button class="w3-btn w3-green"
					onclick="location.href='AirBoardList.jsp?no=<%=board.getNo()%>'">목록</button>
				<button class="w3-btn w3-round w3-blue"
					onclick="location.href='AirEdit.jsp?job=reply&ref=<%=board.getRef()%>&lev=<%=board.getLev()%>&step=<%=board.getStep()%>&pnum=<%=board.getNo()%>'">답글</button>
			</p>
		</div>
	</div>
	</div>
	</div>
</body>
</html>
