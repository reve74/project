<%@page import="nboard.nboardDTO"%>
<%@page import="nboard.nboardDAO"%>
<%@page import="board.rvboardDAO"%>
<%@page import="board.rvboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="../css/login.css" rel="stylesheet" type="text/css">
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>


	<!-- 헤더 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더 -->
		<div id="body" class="contact">
			<div class="header">
				<div>
					<h1>REVIEW</h1>
				</div>
			</div>
<%
	request.setCharacterEncoding("utf-8");
	
	//세션 아이디 값
	String id = (String)session.getAttribute("id");

	int num = Integer.parseInt(request.getParameter("num"));
	
	String nowPage = request.getParameter("nowPage");

	nboardDAO rvdao = new nboardDAO();
	
	rvdao.readCount(num);
	
	nboardDTO rvdto = rvdao.getBoard(num);
	
	int rvnum = rvdto.getNum();
	
	int rvreadcount = rvdto.getReadcount();
	
	String rvid = rvdto.getId();
	
	String rvsubject = rvdto.getSubject();
	
	String rvcontent = rvdto.getContent();

	String rvfile = rvdto.getFile();
	
		
%>	
			
			<div class="body">

			</div>
			<div class="footer">
				<div class="contact">
					<h1>리뷰 게시판 글수정 하기</h1>
					<form action="nrewritePro.jsp" method="post" name=""  enctype="multipart/form-data">
						<input type="hidden" name="num" value="<%=num%>">
						<input type="text" name="id" value="<%=id%>" readonly="readonly">
						<input type="text" name="subject" value="<%=rvsubject%>">
						
						<input id="fileinput" type="file" name="file" style="display:none;"/>
						<table>
						<tr><td><input type = "button" id="falseinput" value = "선택" style="width: 10em;"/></td>
						<td>
						<%if(rvfile==null){ %>
						<span id="selected_filename">선택된 파일이 없습니다.</span>
						<%}else{
							%>
						<span id="selected_filename"><%=rvfile%></span>
						<% }%>
						
						</td></tr></table>
						<input type="hidden" name="file1" value="<%=rvfile%>">
						
						
					<script type="text/javascript">
					$(document).ready( function() {
					$('#falseinput').click(function(){
					$("#fileinput").click();
					});
					});
					$('#fileinput').change(function() {
					$('#selected_filename').text($('#fileinput')[0].files[0].name);
					});
					</script>
						
						
						
				<textarea name="content" cols="50" rows="7" ><%=rvcontent%></textarea>
						<input type="submit" value="수정완료" id="submit"> 
						<a href="notice_main.jsp"><input type="button" value="취소" id="btn"></a>
					</form>
				</div>
			</div>

			

		</div>
		<!--푸터 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!--푸터 -->
	
</body>
</html>
