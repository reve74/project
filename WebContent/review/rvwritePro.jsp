<%@page import="board.rvboardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

 
<%

	//MultipartRequest 클래스 : 파일업로드를 직접적으로 담당하는 클래스
	
	
	//현재 실행중인 웹프로젝트에 대한 정보를 지니고 있는 객체 얻기
	ServletContext ctx = getServletContext();
	
	//현재 실행중인 웹프로젝트에 대한 정보 객체의 getRealPath()메소드를 이용하여
	//가상경로를 실제경로로 바꿔주기
	
	/*
		가상경로
			/upload
		실제경로

		
	*/
	//업로드할 실제 서버 경로 알아내기
	String realPath =  ctx.getRealPath("upload");
	
	//업로드할 수 있는 파일의 최대 크기 지정 5MB
	int max = 5 * 1024 * 1024;
	
	//실제 파일업로드 담당 하는 객체 생성시 .. 생성자로 업로드할 정보를 전달하여 업로드 함.
	//매개변수1 : <form>에서 전달받은 값을 얻어오기 위해 request전달
	//매개변수2 : 업로드될 파일의 위치를 전달
	//매개변수3 : 업로드할 수 있는 파일사이즈 전달
	//매개변수4 : 업로드할 파일명이 한글일 경우 업로드 시 깨지므로 문자셋 방식 지정
	//매개변수5 : 실제 업로드되는 위치에 같은 이름의 파일 업로드시 파일명이 중복되므로
	//		        업로드할 파일명을 자동으로 변환해주는 객체 전달
	MultipartRequest multi = 
	new MultipartRequest(request, realPath, max, "utf-8", new DefaultFileRenamePolicy());
	

	
	
	//파일업로드시 선택한 <input>의 name 속성값들을 모두 Enumeration 반복기에 담아
	//Enumeration 반복기 객체를 반환
	Enumeration e =  multi.getFileNames();
	String P = (String)e.nextElement();
	String file = multi.getFilesystemName(P);
	

	
	
	String id = multi.getParameter("id");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	
	
%>	


	<jsp:useBean id="rvdto" class="board.rvboardDTO"/>
	
<%
	rvdto.setDate(new Timestamp(System.currentTimeMillis()));
	rvdto.setId(id);
	rvdto.setSubject(subject);
	rvdto.setFile(file);
	rvdto.setContent(content);
	

	rvboardDAO rvdao = new rvboardDAO();
	
	rvdao.insertBoard(rvdto);
	
	response.sendRedirect("rv_main.jsp");
%>
	
	
	