<%@page import="java.sql.Timestamp"%>
<%@page import="board.rvcommentDTO"%>
<%@page import="board.rvcommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));	
	
	String id = (String)session.getAttribute("id");
	
	String content = request.getParameter("content");
	
	int rvnum =  Integer.parseInt(request.getParameter("rvnum"));
	
	rvcommentDAO rdao = new rvcommentDAO();
	
	rvcommentDTO rvcdto = new rvcommentDTO();
	
	
	rvcdto.setContent(content);
	rvcdto.setDate(new Timestamp(System.currentTimeMillis()));
	rvcdto.setId(id);
	rvcdto.setRvnum(rvnum);
	
	
	rdao.insertcomment(rvcdto);
	
	
	response.sendRedirect("rvRead.jsp?num="+rvcdto.getRvnum()+"&nowPage="+nowPage);

	
%>



<body>

</body>
</html>