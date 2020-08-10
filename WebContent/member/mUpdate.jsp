<%@page import="board.rvboardDAO"%>
<%@page import="board.rvboardDTO"%>
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

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/member.css" rel="stylesheet" type="text/css">

</head>
<body>


		<!-- 헤더 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더 -->
		
		
		<div id="body" class="con">
			<div class="header">
				<div>
					<h1>LOGIN</h1>
				</div>
			</div>
			<div class="body">
			</div>
<!-- 
body
 -->			
	<div class="container-fluid">
<div class="row" id="mUp_div">
<div class="col-md-8 col-md-offset-2" id="mUp_div2">

<h3>회원정보 수정을 위해 비밀번호를 입력해주세요</h3>
<br><br>
<form action="mUpdatePro.jsp" id="mUp_form" method="post">
<input type="password" name="pass" id="mUp_pass"> <br>
<button type="submit" id="mUp_btn">확인</button>
</form>
</div>
</div>
</div>		
			

	
	
	
	
	
	<!-- 게시판 영역 -->			
			<div class="footer">
			</div>
		</div>
		<!--푸터 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!--푸터 -->
	
</body>
</html>
