<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	String id = (String)session.getAttribute("id");
	String pass = request.getParameter("pass");

	memberDAO mdao = new memberDAO();

	int check = mdao.getPass(id, pass);
	
	if(check ==1){
		response.sendRedirect("memberModify.jsp");
	}else{
%>	
		<script type="text/javascript">
			alert("비밀번호를 틀렸습니다.");
			history.back();
		</script>
<%		
	}
%>


<body>

</body>
</html>