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
	String id = (String)session.getAttribute("id");
	if(id != null) {
%>	
			<div class="body">

			</div>
			<div class="footer">
				<div class="contact">
					<h1>리뷰게시판 글쓰기</h1>
					<form action="rvwritePro.jsp" method="post" enctype="multipart/form-data">
						<input type="text" name="id" value="<%=id%>" readonly="readonly">
						<input type="text" name="subject" value="제목" onblur="this.value=!this.value?'제목':this.value;" onfocus="this.select()" onclick="this.value='';"> 
						<input id="fileinput" type="file" name="file" style="display:none;"/>
						<table>
						<tr><td><input type = "button" id="falseinput" value = "선택" style="width: 10em;"/></td>
						<td><span id="selected_filename">선택된 파일 없음</span></td></tr></table>
						<textarea name="content" cols="50" rows="7" onblur="this.value=!this.value?'내용':this.value;" onfocus="this.select()" onclick="this.value='';">내용</textarea>
						<input type="submit" value="작성완료" id="submit">
						<a href="rv_main.jsp"><input type="button" value="취소" id="btn"></a>
					</form>
					
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
					
				</div>
				
			</div>
<% 	
	}else {
%>
	<script type="text/javascript">
		alert("로그인을 해주세요");
		location.href="../member/login.jsp";
	</script>
<% 
	}
%>
		</div>
		<!--푸터 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!--푸터 -->
	
</body>
</html>
