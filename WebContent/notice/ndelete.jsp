<%@page import="nboard.nboardDTO"%>
<%@page import="nboard.nboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	

	nboardDAO rvdao = new nboardDAO();

	
	nboardDTO rvdto = rvdao.getBoard(num);
	


%>
	<script type="text/javascript">
		
		alert("삭제되었습니다.");
		
		location.href = "notice_main.jsp";
	
	</script>

	

