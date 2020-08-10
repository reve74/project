<%@page import="member.memberDTO"%>
<%@page import="member.memberDAO"%>
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

<%
	String content = (String)session.getAttribute("content");
	String id= request.getParameter("id");
	
	memberDAO mdao = new memberDAO();
	memberDTO mdto = mdao.getMember(id);
	String pass = mdto.getPass();

	
%>

<title>Insert title here</title>

<script type="text/javascript">
function check() {
	var code = document.fr.con_chk.value;
	var authNum = <%=content %>;
	
	if(!code) {
		alert("인증번호를 입력해주세요");
		return false;
	}
	
	if(authNum == code) {
		
		alert("인증 성공!");
		
	<%
		session.removeAttribute("content");
	%>
		document.fr.submit();
		
	} else {
		alert("인증번호가 틀립니다. 다시 입력해 주세요.");
		return false;
	}
}
</script>

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

	<h3 style="text-align: center; margin-top: 100px;"> <span id="em-span"><%=id %></span>님 인증번호를 입력해주세요</h3>
	
	<form name="fr" method="post" action="confirmpass.jsp" style="max-width:400px; margin:50px auto;">

	
	<div class="input-container">
	<span class="log-span2">인증번호</span> 
	<input type="text" class="input-field" name="con_chk">
	<input type="hidden" name="pass" value="<%=pass%>"> 
	</div>
	<br>
	<input type="button" class="btn-log-2" onclick="check(); return false;" style="height: 50px;" value="입력">
     </form>

	<div class="footer">
	</div>
</div>
<!--푸터 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!--푸터 -->


</body>
</html>