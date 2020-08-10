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
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더 -->
	
		<div id="body" class="contact">
			<div class="header">
				<div>
					<h1>LOGIN</h1>
				</div>
			</div>
			<div class="body">
			</div>
			
	<h3 style="text-align: center; margin-top: 100px;">본인인증을 위해 이름과 email주소를 입력해주세요</h3>
		<form action="m_confrirmPro.jsp" style="max-width:400px; margin:50px auto;">
	  		<div class="input-container">
	    		<span class="log-span">이름</span> 
	    		<input class="input-field" type="text" placeholder="Username" name="name">
	  		</div>
	   		<div class="input-container">
	    		<span class="log-span">email</span>
	    		<input class="input-field" type="text" placeholder="가입하신 Email을 입력해주세요" name="email">
	  		</div>
	 		<button type="submit" class="btn-log">입력</button>
		</form>
	<div class="footer">
	</div>
</div>
	
<!--푸터 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!--푸터 -->
	
</body>
</html>
