<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String message=(String)request.getAttribute("message");
	if(message!=null){
		%>
		<jsp:include page="error.jsp"></jsp:include>
		<p style="color:red"><%= message %></p>
	<%} %>

		<form action="payment" method="post">
		Id : <input type="number" name="id"><br><br>
		Name : <input type="text" name="name"><br><br>
		Password : <input type="text" name="password"><br><br>
		Amount : <input type="number" name="amount"><br><br>
		Payment Type : <input type="text" name="payment_type"><br><br>
		Email : <input type="email" name="email"><br><br>
		<input type="submit" value="Pay">
	</form>
</body>
</html>
