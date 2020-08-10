<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="board.rvcommentDTO"%>
<%@page import="board.rvcommentDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.rvboardDTO"%>
<%@page import="board.rvboardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.management.modelmbean.RequiredModelMBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="../css/login.css" rel="stylesheet" type="text/css">
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">

	<link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/reviewboard.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>


<%
	request.setCharacterEncoding("utf-8");
	
	String id = (String)session.getAttribute("id");
	
	
	//날짜 포맷형식
	SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
	//게시글 num값
	int num = Integer.parseInt(request.getParameter("num"));
	//검색어기준값
	String keyField = request.getParameter("keyField");
	//검색어
	String keyWord = request.getParameter("keyWord");
	//게시글 페이지 값
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	
	rvboardDAO rvdao = new rvboardDAO();
	//게시글 조회수 증가 시키기
	rvdao.readCount(num);
	//게시글 번호 얻기
	rvboardDTO rvdto = rvdao.getBoard(num);
	
	int rvreadcount = rvdto.getReadcount();
	//게시자  id
	String rvid = rvdto.getId();
	
	String file = rvdto.getFile();
	
	String rvsubject = rvdto.getSubject();
	
	Timestamp rvdate = rvdto.getDate();
	
	String rvcontent = "";
	
	if(rvdto.getContent() != null) {
		rvcontent = rvdto.getContent().replace("\r\n", "<br>");
	}

	String img = rvdto.getFile();
	
%>
<body>
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../js/bootstrap.min.js"></script>
		
		<!-- 헤더 -->
		<div id="body" class="contact">
			<div class="header">
				<div>
					<h1>REVIEW</h1>
				</div>
			</div>
			<div class="body">
			</div>	
			
			
			
	<!-- 게시판  -->	
	
	
	
		<div class="container-fluid">
			<div class="row" style="margin-top: 80px;">
			<div class="col-md-8 col-md-offset-2" id="table-wrap">
			<table id="table2">
			<tr><td colspan="3">&nbsp;</td></tr>
			<tr class="rvTable1">
				<td style="padding-left: 30px">
					<%=rvdto.getSubject() %>
				</td>
				<td rowspan="2" style="text-align: right; padding-right: 40px">
				
				<i class="fa fa-heart" style="font-size:35px;color:#ff6060"></i></td>
			</tr>	
			<tr class="rvTable2"><td colspan="2" style="padding-left: 30px">작성일 : <%=sdf.format(rvdto.getDate())%> 
			&nbsp; &nbsp; | &nbsp;&nbsp;작성자 : <%=rvdto.getId()%> 
			&nbsp; &nbsp; | &nbsp;&nbsp; 날짜 : <%=rvdto.getDate() %> </td>		
			</tr>
			<tr>
				<td colspan="2" style="padding-left: 30px">
				조회수 : <%=rvdto.getReadcount()%> 
				&nbsp; &nbsp; | &nbsp;&nbsp; 
				
<%
				if(rvdto.getFile() != null) {
%>
				<a href="filedownload.jsp?file=<%=rvdto.getFile()%>">파일 : <%=rvdto.getFile() %></a>
<% 								
				}
%>
				</td>
			</tr>
			
	
			<tr>
			<td class="rvTable3" colspan="2"> <%=rvdto.getContent().replace("\n","<br/>") %> </td>
			</tr>
			
			</table>
	
		 <%-- 이미지 파일 --%>
<%
		if(rvdto.getFile() != null) {
%>
		 	<img src="../upload/<%=rvdto.getFile() %>" width="75%">
<%
		}
%>
			</div>
			</div>
		</div>

	

	<div style="text-align: center" class="btn-div" id="read_btn">
	<button class="btn" id="btn" onclick="location.href='rv_main.jsp'">목록보기</button>
	
<%	
	if(id != null) {
%>		
	<input type="button" value="수정하기" class="btn" onclick="location.href='reWrite.jsp?pagNum=<%=nowPage%>&num=<%=num%>'">
	<input type="button" value="삭제하기" class="btn" onclick="location.href='rvdelete.jsp?pageNum=<%=nowPage%>&num=<%=num%>'">
<% 		
	}
%>
	
</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-8 col-md-offset-2" id="table-wrap">
			<form action="recommentPro.jsp">
				<input type="hidden" name="rvnum" value="<%=num%>">
				<input type="hidden" name="nowPage" value="<%=nowPage%>">

					<table class="table3">
						<tr style="text-align: center;">
						<th>Id</th>
						<th colspan="2">Content</th>
						<th>Date</th>
						<th>delete</th>
			
<% 			
						//댓글DAO
						rvcommentDAO rvcdao = new rvcommentDAO();
						//댓글DTO
						rvcommentDTO rvcdto = new rvcommentDTO();
						
						int rp_count = rvcdao.getCommentCount(num);
									
						List<rvcommentDTO> rp_list = null;
						
						if(rp_count>0) {
							rp_list = rvcdao.getCommentList(num);
						}
						
					if(rp_count > 0) {
						for(int i=0;i<rp_list.size();i++) {
							rvcommentDTO rvcdt = (rvcommentDTO)rp_list.get(i);


%>		

						<tr style="border-top: 1px dashed  #223055; padding-top: 5px; text-align: center;">
							<td style= padding-bottom: "15px"><%=rvcdt.getId()%></td>	
							<td colspan="2"><%=rvcdt.getContent()%></td>		
							<td><%=sdf.format(rvcdt.getDate())%></td>
							
<%					
							System.out.println("getnum : "+ rvcdt.getNum());
							String name = rvcdt.getId();
							
							System.out.println("name : " + name);
							//댓글 아이디             //세션 아이디
						
							
							System.out.println("getid:"+rvcdt.getId());
							System.out.println("id:"+session.getAttribute("id"));
							
							if(id != null && rvcdt.getId().equals(id)){ 
							 
%>			
								<td><a href="recommentdelete.jsp?num=<%=rvcdt.getNum()%>&rvnum=<%=num%>&nowPage=<%=nowPage%>">삭제</a></td>
<%		
							}
						}
					}	
%>			
						</tr>
	
<% 	
				if(id != null) {	
%>
					<tr>
						<td><%=id%></td>
						<td colspan="2"><textarea name="content" cols="100%" rows="2"></textarea></td>
						<td><input type="submit" value="댓글쓰기"></td>
					</tr>
<% 
				}	
%>							
			</table>	
		</form>
	</div>
</div>


	<!-- 게시판 영역 -->			

		</div>
		<!--푸터 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!--푸터 -->

	
</body>
</html>
