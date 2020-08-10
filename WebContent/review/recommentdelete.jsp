<%@page import="board.rvcommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	int num = Integer.parseInt(request.getParameter("num"));
	int rvnum = Integer.parseInt(request.getParameter("rvnum"));
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));

	rvcommentDAO rvcdao = new rvcommentDAO();
	
	//삭제 성공 1 ,  실패 0을 리턴받는다.
	int result = rvcdao.deleteComment(num);
		
	if(result == 1){ //성공
%>
	<script>
	alert("삭제되었습니다.");
	location.href="rvRead.jsp?num=<%=rvnum%>&nowPage=<%=nowPage%>";
	</script>
<%		
	}else{ // 0  실패
%>
	<script>
	alert("실패하였습니다.");
	history.back();
	</script>

<%		
	}
%>	
	





	
	
	

