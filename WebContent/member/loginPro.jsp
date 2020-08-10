<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	memberDAO memdao = new memberDAO();
	
	int check = memdao.userCheck(id, pass);
	
	if(check ==1){
		session.setAttribute("id", id);
		
		response.sendRedirect("../index.jsp");
	}else if(check == 0){
%>
	<script type="text/javascript">
				alert("비밀번호를 잘못 입력하였습니다.");
				history.back(); 
		</script>

<%			
	}else{ 
%>
		<script type="text/javascript">
				alert("없는 아이디 입니다.");
				history.back(); 
		</script>
<%	
	}

%>