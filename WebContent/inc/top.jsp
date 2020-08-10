<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Sweety Sweets Shop : Sweet Memories</title>
	<link rel="stylesheet" href="../css/style.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="../css/mobile.css">
	<script src="../js/mobile.js" type="text/javascript"></script>

<title>Insert title here</title>
</head>
<body>
<div id="header">
	<div>
		<a href="../index.jsp" class="logo"><img src="../images/logo0.png" alt=""></a>
		<ul id="navigation">
			<li class="selected">
				<a href="../index.jsp">HOME</a>
			</li>
			<li class="menu">
				<a href="../notice/notice_main.jsp">NOTICE</a>
				<ul class="primary">
					<li>
						<a href="../post/product.jsp">&nbsp;&nbsp;PRODUCT</a>
					</li>
				</ul>
			</li>
			<li class="menu">
				<a href="../post/blog.jsp">BLOG</a>
				<ul class="secondary">
					<li>
						<a href="../post/singlepost.jsp">SINGLE POST</a>
					</li>
				</ul>
			</li>
			<li class="menu">
				<a href="../review/rv_main.jsp">REVIEW</a>
				<ul class="secondary">
					<li>
						<a href="../post/contact.jsp">&nbsp;&nbsp;LOCATION</a>
					</li>
				</ul>
			</li>
				<%
				String id = (String)session.getAttribute("id");
				String aid = "admin1";
				if(id ==null) {
				%>
				<li class="menu"><a href="../member/login.jsp">LOGIN</a> |
				<a href="../member/join.jsp">JOIN</a>
				</li>
				<%
				}else{
				%>
				<li class="menu">
						<%if(aid.equals(id)) { %>
						<a href="../member/mUpdate.jsp">관리자모드</a> 
						<%}else{%>
						<a href="../member/mUpdate.jsp"><%=id%>님</a> 
						<%}%>					<ul class="secondary">	
						<li>
							<a href="../member/logout.jsp">&nbsp;&nbsp;&nbsp;로그아웃</a>
						</li>
					</ul>
				</li>
				<%
				}
				%>
		</ul>
	</div>
</div>
</body>
</html>