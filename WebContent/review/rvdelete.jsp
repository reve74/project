<%@page import="board.rvboardDTO"%>
<%@page import="board.rvboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	

	rvboardDAO rvdao = new rvboardDAO();

	String id = (String)session.getAttribute("id");
	
	rvboardDTO rvdto = rvdao.getBoard(num);
	
	String rvid = rvdto.getId();


	if(id.equals(rvid)) {
		
	rvdao.deleteBoard(num);
%>
	<script type="text/javascript">
		
		alert("삭제되었습니다.");
		
		location.href = "rv_main.jsp";
	
	</script>
<% 		
	}else {	
%>
	<script type="text/javascript">
	
	alert("권한이 없습니다.");
	
	history.back();
	
	</script>


<% 
	}
%>

	

