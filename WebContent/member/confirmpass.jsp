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

<%
String pass = request.getParameter("pass"); 
String content = (String)session.getAttribute("content");
%>

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

<h3 style="text-align: center; margin-top: 100px;"> 회원님의 비밀번호는
<span id="em-span"><%=pass %></span> 입니다</h3>
  <br><br>

<h5 style="text-align: center;"><a href="login.jsp" style="font-size: 15px; ">로그인 하러가기</a></h5>


		
	<div class="footer">
	</div>
</div>

<!--푸터 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!--푸터 -->

</body>
</html>