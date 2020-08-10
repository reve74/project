<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewpo
	rt" content="width=device-width, initial-scale=1.0">
	<title>Sweety Sweets Shop : Sweet Memories</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="css/mobile.css">
	<script src="js/mobile.js" type="text/javascript"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="css/login.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="page">
		<div id="header">
			<div>
				<a href="index.jsp" class="logo"><img src="images/logo0.png" alt=""></a>
				<ul id="navigation">
					<li class="selected">
						<a href="index.jsp">HOME</a>
					</li>
					<li class="menu">
						<a href="notice/notice_main.jsp">NOTICE</a>
						<ul class="primary">
							<li>
								<a href="post/product.jsp">&nbsp;&nbsp;PRODUCT</a>
							</li>
						</ul>
					</li>
					<li class="menu">
						<a href="post/blog.jsp">BLOG</a>
						<ul class="secondary">
							<li>
								<a href="post/singlepost.jsp">SINGLE POST</a>
							</li>
						</ul>
					</li>
					<li class="menu">
						<a href="review/rv_main.jsp">REVIEW</a>
						<ul class="secondary">
							<li>
								<a href="post/contact.jsp">&nbsp;&nbsp;LOCATION</a>
							</li>
						</ul>
					</li>
					<%
					String id = (String)session.getAttribute("id");
					
					String aid = "admin1";
					
					if(id ==null) {
					%>
					<li class="menu"><a href="member/login.jsp">LOGIN</a> |
					<a href="member/join.jsp">JOIN</a>
					</li>
					<%
					}else{
					%>
					<li class="menu">
						<%if(aid.equals(id)) { %>
						<a href="member/mUpdate.jsp">관리자모드</a> 
						<%}else{%>
						<a href="member/mUpdate.jsp"><%=id%>님</a> 
						<%}%>
						<ul class="secondary">	
							<li>
								<a href="member/logout.jsp" style="text-align: center;">&nbsp;&nbsp;&nbsp;로그아웃</a>
							</li>
						</ul>
					</li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
		<div id="body" class="home">
			<div class="header">
				<img src="images/ice2.jpg" alt="">
				<div>
					<a href="post/product.jsp">Sweet Memories</a>
				</div>
			</div>
			<div class="body">
				<div>
					<div>
						<h1>NEW PRODUCT</h1>
						<h2>The Twist of Healthy Icecream</h2>
						<p>This website template has been designed by freewebsitetemplates.com for you, for free. You can replace all this text with your own text.</p>
					</div>
					<img src="images/yogurt.jpg" alt="">
				</div>
			</div>
			<div class="footer">
				<div>
					<ul>
						<li>
							<a href="post/product.jsp" class="product"></a>
							<h1>PRODUCTS</h1>
						</li>
						<li>
							<a href="post/about.jsp" class="about"></a>
							<h1>NOTICE</h1>
						</li>
						<li>
							<a href="post/product.jsp" class="flavor"></a>
							<h1>PRODUCTS</h1>
						</li>
						<li>
							<a href="post/contact.jsp" class="contact"></a>
							<h1>OUR LOCATION</h1>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="footer">
			<div>
				<div class="connect">
					<a href="http://freewebsitetemplates.com/go/facebook/" class="facebook">facebook</a>
					<a href="http://freewebsitetemplates.com/go/twitter/" class="twitter">twitter</a>
					<a href="http://freewebsitetemplates.com/go/googleplus/" class="googleplus">googleplus</a>
					<a href="http://pinterest.com/fwtemplates/" class="pinterest">pinterest</a>
				</div>
				<p>&copy; Sweet Memories. All Rights Reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>
