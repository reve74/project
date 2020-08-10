<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.rvboardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<jsp:useBean id="rvdto" class="board.rvboardDTO"/>
	
<%	
ServletContext ctx = getServletContext();

String realPath =  ctx.getRealPath("upload");

int max = 5 * 1024 * 1024;

MultipartRequest multi = 
new MultipartRequest(request, realPath, max, "utf-8", new DefaultFileRenamePolicy());

Enumeration e =  multi.getFileNames();
String f = (String)e.nextElement();
String file = multi.getFilesystemName(f);

	rvdto.setNum(Integer.parseInt(multi.getParameter("num")));
	rvdto.setId(multi.getParameter("id"));
	rvdto.setSubject(multi.getParameter("subject"));
	
	rvdto.setContent(multi.getParameter("content"));
	
	if(file==null){
		rvdto.setFile(multi.getParameter("file1"));
	}else{
		rvdto.setFile(file);
	}
	
	
	rvdto.setDate(new Timestamp(System.currentTimeMillis()));

	rvboardDAO rvdao = new rvboardDAO();
	
	rvdao.updateBoard(rvdto);
	
	
	response.sendRedirect("rv_main.jsp");
%>
	
	
	