<%@page import="nboard.nboardDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<jsp:useBean id="ndto" class="nboard.nboardDTO"/>
	
<%	
ServletContext ctx = getServletContext();

String realPath =  ctx.getRealPath("upload");

int max = 5 * 1024 * 1024;

MultipartRequest multi = 
new MultipartRequest(request, realPath, max, "utf-8", new DefaultFileRenamePolicy());

Enumeration e =  multi.getFileNames();
String f = (String)e.nextElement();
String file = multi.getFilesystemName(f);

ndto.setNum(Integer.parseInt(multi.getParameter("num")));
ndto.setId(multi.getParameter("id"));
ndto.setSubject(multi.getParameter("subject"));
	
ndto.setContent(multi.getParameter("content"));
	
	if(file==null){
		ndto.setFile(multi.getParameter("file1"));
	}else{
		ndto.setFile(file);
	}
	
	
	ndto.setDate(new Timestamp(System.currentTimeMillis()));

	nboardDAO ndao = new nboardDAO();
	
	ndao.updateBoard(ndto);
	
	
	response.sendRedirect("notice_main.jsp");
%>
	
	
	