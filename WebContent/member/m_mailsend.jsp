<%@page import="member.memberDTO"%>
<%@page import="member.memberDAO"%>
<%@page import="email.random"%>
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
<%
random r = new random();

String content = r.randomNum();

session.setAttribute("content", content);

String id = request.getParameter("id");

memberDAO mdao = new memberDAO();

memberDTO mdto = mdao.getMember(id);

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
<!-- 
body
 -->			

	<form id="main-contact-form" name="contact-form" method="post" action="./../mailSend2" style="max-width:400px; margin:50px auto;">

	<h3>고객님의 ID는 <span id="em-span"><%=id %></span> 입니다.</h3>
	
	<br><br>
	
	비밀번호 찾기 
	<br>
	
	<div class="input-container">
	<span class="log-span">email</span> 
	<input type="email" class="input-field" name="receiver" value="<%=mdto.getEmail()%>">
	</div>
	<br>
	<input type="submit" class="btn-log-2" style="height: 50px;" value="인증번호 받기">
	<input type="hidden" name="content" value="<%=content%>">
	<input type="hidden" name="name" value="<%=mdto.getName()%>">
	<input type="hidden" name="sender" class="form-control" placeholder="Email Address" required="required" value="revev99@gmail.com">
	<input type="hidden" name="id" value="<%=id%>">
      </form>
      
				
			<div class="footer">
			</div>
		</div>
		<!--푸터 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!--푸터 -->
	
</body>
</html>
