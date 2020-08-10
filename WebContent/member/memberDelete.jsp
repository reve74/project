<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	
	memberDAO mdao = new memberDAO();
	
	mdao.deleteMember(id);
	
	session.invalidate();
%>

<script>
	alert("탈퇴되었습니다.");
	
	location.href="../index.jsp";
</script>