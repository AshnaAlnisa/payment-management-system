<%@ page import="com.jsp.controller.PaymentDao" %>
<%@ page import="com.jsp.payment.PaymentDaoImp" %>
<%@ page import="com.jsp.Payment" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Details</title>
</head>
<body>
    <form action="">
        Enter ID: 
        <input type="text" name="id">
        <input type="submit" value="Submit">
    </form>
    
    <% 
        String id = request.getParameter("id");   
        if(id != null && !id.isEmpty()) {
            
                PaymentDao dao = new PaymentDaoImp();
                Payment payment = dao.findPaymentById(Integer.parseInt(id));
                
                if(payment != null) {
    %>
                    <h1>ID: <%= payment.getId() %></h1>
                    <h1>Name: <%= payment.getName() %></h1>
                    <h1>Password: <%= payment.getPassword() %></h1>
                    <h1>Amount: <%= payment.getAmount() %></h1>
                    <h1>Payment Type: <%= payment.getPayment_type() %></h1>
                    <h1>Email: <%= payment.getEmail() %></h1>
    <% 
                } else {
                }
            
        }
    %>
    
</body>
</html>
