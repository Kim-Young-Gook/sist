<%@page import="sist.com.bean.ZipCodeBean"%>
<%@page import="sist.com.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
 <style type="text/css">
	*{
		margin:0;
		padding:0;
	}
	a{
	text-decoration: none;
		color:black;
	}
	a:hover{
	font-weight: 900;
	}
	form{
	border:3px solid #00b2d6;
	width:450px;
	height:400px;
	}
	#searchFrm_div{
	margin-top: 30px;
    margin-left: 20px;
	}
	input#dong {
    margin-top: 20px;
    }
    #search_txt{
    margin-top:20px;
        text-align: center;
    }
    #searchfind_table{
        margin-top: 10px;
    }
    #address_txt{
    margin-top:20px;
     width:400px;
     height:25px;
     text-align:center;
 background-color:#EAEAEA;
        }

	#searchfind_txt{
	padding-left: 25px; 
	width: 200px;
}
#search_table{
 width:100%;
 height:120px;
 border:0px;
 background-color:#FFFFFF;
}
.search_div{
height:210px;
width:400px;
overflow:auto;
}
</style>

<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script  src="/webPro/scriptPro/addressJS.js" charset="utf-8"></script>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String dong=request.getParameter("dong");
	//out.println(dong);
	List<ZipCodeBean>list = null;
	if(dong!=null){
		list = MemberDao.selectZipCode(dong);
	//	out.print(list);
	}

%>
	<form action="" name="searchFrm" method="post">
	<div id="searchFrm_div">
		<table>
			<tr>
				<td id="search_txt">
				찾고자 하는 지역의 읍,면,동 이름을 입력하세요<br> 예: 구의동일 경우, '구의' 로 검색하세요.
				</td>
			</tr>
			<tr>
				<td align="center">주소검색<input type="text" name="dong" id="dong" size="20">
						<button onclick="searchDong()">검색</button>
			</tr>
			<tr>
				<td>
					<table id="searchfind_table">
						<tr>
							<td id="address_txt">해당주소를 선택해주세요</td>
						</tr>
					</table>
					<div class="search_div">
						<table id="search_table"> 
					<%
							if(dong!=null){
								for(int i=0;i<list.size();i++){
									ZipCodeBean zbean = list.get(i);
							
						%>
						<tr>
							<td id="searchfind_txt">
								<a href="javascript:SendAddPost('<%=zbean.getZipcode() %>','<%=zbean.getSido()+zbean.getGugun()+zbean.getDong() %>')">
											<%=zbean.getZipcode() %><%=zbean.getSido()+zbean.getGugun()+zbean.getDong() %></a>
							</td>
						</tr>
						<%	}
							} %>
						</table>
					</div>
				</td>
			</tr>
		</table>
		</div>
	</form>
</body>
</html>