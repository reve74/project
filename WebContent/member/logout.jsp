<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 
<%
session.invalidate();	
%>	

<script type="text/javascript">
alert("로그아웃이 완료되었습니다.");

location.href = "../index.jsp"; 

</script>

</html>