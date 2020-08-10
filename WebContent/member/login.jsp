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
</head>
<body>
	<div id="page">
	<!-- 헤더 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더 -->
		<div id="body" class="contact">
			<div class="header">
				<div>
					<h1>LOGIN</h1>
				</div>
			</div>
		</div>
		
		<form action="loginPro.jsp" style="max-width:400px; margin:50px auto;">
			  
			  <div class="input-container">
			    <i class="fa fa-user icon"></i>
			    <input class="input-field" type="text" placeholder="Username" name="id">
			  </div>
			  
			  <div class="input-container">
			    <i class="fa fa-key icon"></i>
			    <input class="input-field" type="password" placeholder="Password" name="pass">
			  </div>
			  <button type="submit" class="btn-log">로그인</button>
			 
			 <br><br>
			 
			  <div> <a href="m_confirm.jsp">ID/비밀번호 찾기</a></div>
			  <div> 아직 회원이 아니신가요? <a href="join.jsp">회원가입 하러가기</a></div>	  
		</form>
		<!--푸터 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!--푸터 -->
	</div>
</body>
</html>
