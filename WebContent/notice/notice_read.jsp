<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="nboard.nboardDTO"%>
<%@page import="nboard.nboardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.management.modelmbean.RequiredModelMBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="../css/login.css" rel="stylesheet" type="text/css">
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">

	<link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/reviewboard.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>


<%
	request.setCharacterEncoding("utf-8");
	
	String id = (String)session.getAttribute("id");
	
	
	//날짜 포맷형식
	SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
	//게시글 num값
	int num = Integer.parseInt(request.getParameter("num"));
	//검색어기준값
	String keyField = request.getParameter("keyField");
	//검색어
	String keyWord = request.getParameter("keyWord");
	//게시글 페이지 값
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	
	nboardDAO ndao = new nboardDAO();
	//게시글 조회수 증가 시키기
	ndao.readCount(num);
	//게시글 번호 얻기
	nboardDTO ndto = ndao.getBoard(num);
	
	int nreadcount = ndto.getReadcount();
	//게시자  id
	String nid = ndto.getId();
	
	String file = ndto.getFile();
	
	String nsubject = ndto.getSubject();
	
	Timestamp ndate = ndto.getDate();
	
	String ncontent = "";
	
	if(ndto.getContent() != null) {
		ncontent = ndto.getContent().replace("\r\n", "<br>");
	}

	String img = ndto.getFile();
	
%>
<body>
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../js/bootstrap.min.js"></script>
		
		<!-- 헤더 -->
		<div id="body" class="contact">
			<div class="header">
				<div>
					<h1>NOTICE</h1>
				</div>
			</div>
			<div class="body">
			</div>	
			
			
			
	<!-- 게시판  -->	
	
	
	
		<div class="container-fluid">
			<div class="row" style="margin-top: 80px;">
			<div class="col-md-8 col-md-offset-2" id="table-wrap">
			<table id="table2">
			<tr><td colspan="3">&nbsp;</td></tr>
			<tr class="rvTable1">
				<td style="padding-left: 30px">
					<%=ndto.getSubject() %>
				</td>
				<td rowspan="2" style="text-align: right; padding-right: 40px">
				
				<i class="fa fa-heart" style="font-size:35px;color:#ff6060"></i></td>
			</tr>	
			<tr class="rvTable2"><td colspan="2" style="padding-left: 30px">작성일 : <%=sdf.format(ndto.getDate())%> 
			&nbsp; &nbsp; | &nbsp;&nbsp;작성자 : <%=ndto.getId()%> 
			&nbsp; &nbsp; | &nbsp;&nbsp; 날짜 : <%=ndto.getDate() %> </td>		
			</tr>
			<tr>
				<td colspan="2" style="padding-left: 30px">
				조회수 : <%=ndto.getReadcount()%> 
				
				
<%
				if(ndto.getFile() != null) {
%>
				<a href="filedownload.jsp?file=<%=ndto.getFile()%>">&nbsp; &nbsp; | &nbsp;&nbsp; 파일 : <%=ndto.getFile() %></a>
<% 								
				}
%>
				</td>
			</tr>
			
	
			<tr>
			<td class="rvTable3" colspan="2"> <%=ndto.getContent().replace("\n","<br/>") %> </td>
			</tr>
			
			</table>
	
		 <%-- 이미지 파일 --%>
<%
		if(ndto.getFile() != null) {
%>
		 	<img src="../upload/<%=ndto.getFile() %>" width="75%">
<%
		}
%>
			</div>
			</div>
		</div>


	

	<div style="text-align: center" class="btn-div" id="read_btn">
	<button class="btn" id="btn" onclick="location.href='notice_main.jsp'">목록보기</button>
	
<%	

	String aid = "admin1";


	if(aid.equals(id)) {
%>		
	<input type="button" value="수정하기" class="btn" onclick="location.href='nreWrite.jsp?pagNum=<%=nowPage%>&num=<%=num%>'">
	<input type="button" value="삭제하기" class="btn" onclick="location.href='ndelete.jsp?pageNum=<%=nowPage%>&num=<%=num%>'">
<% 		
	}
%>
	
</div>
	


	<!-- 게시판 영역 -->			

		</div>
		<!--푸터 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!--푸터 -->

	
</body>
</html>
