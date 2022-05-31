<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.javaex.guestdao.GuestDao" %>
<%@ page import="com.javaex.guestVo.GuestVo" %>
<%
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	String date = sdf.format(today);
	List<GuestVo> guestList = (List<GuestVo>)request.getAttribute("gList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./gc" method="post">
		<table border=1>
			<tr>
				<td>이름 <input type="text" name="name" value=""></td>
				<td>비밀번호 <input type="password" name="pw" value=""></td>
			</tr>
			<tr>
				<td colspan=2><textarea cols="65" rows="10" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan=2><button type="submit">확인</button></td>					
			</tr>
		</table>
		<input type="hidden" name="regDate" value="<%=date%>">
		<input type="hidden" name="action" value="write">
	</form>
	<br>
	
	<%for(int i=0;i<guestList.size();i++) {%>
	<table border="1">
		<tr>
			<td><%=guestList.get(i).guestNo%></td>
			<td><%=guestList.get(i).name %></td>
			<td><%=guestList.get(i).regDate %></td>
			<td><a href="./gc?action=deleteform&no=<%=guestList.get(i).guestNo%>" target="blank">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4><%=guestList.get(i).content %></td>
		</tr>
		<tr>
	</table>
	<br>
	<%} %>
</body>
</html>