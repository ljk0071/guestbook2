<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javaex.guestdao.GuestDao"%>
<%@ page import="com.javaex.guestVo.GuestVo"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteForm</title>
</head>
<body>
	
	<form action="./gc" method="post">
		비밀번호<input type="password" name="pw" value="">
		<button type="submit">확인</button>
		<input type="hidden" name="no" value="<%=no%>">
		<input type="hidden" name="action" value="delete">
		<br>
		<a href="./gc?action=addList">메인으로 돌아가기</a>
	</form>
</body>
</html>