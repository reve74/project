<%@page import="member.memberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");	
%>

<jsp:useBean id="dto" class="member.memberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	dto.setReg_date(new Timestamp(System.currentTimeMillis()));

	if(request.getParameter("gender")== null){
		dto.setGender("none");
	}

	memberDAO dao = new memberDAO();

	int check = dao.insertMember(dto);

	
	if(check ==1){
%>	

	<script>
		alert("회원가입이 완료되었습니다!!");
		location.href="login.jsp";
	</script>
<%}else {

%>
	<script>
		alert("회원가입에 실패하였습니다.");
		location.href = history.back();
	</script>
<%
}
%>