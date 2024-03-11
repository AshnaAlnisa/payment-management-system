<%@ page import="com.jsp.controller.PaymentDao" %>
<%@ page import="com.jsp.payment.PaymentDaoImp" %>
<%@ page import="com.jsp.Payment" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Payment Details</title>
</head>
<body>
    <h2>Delete Payment Details by ID</h2>
    <form action="" method="post">
        Enter ID: <input type="text" name="id">
        <input type="submit" value="Delete">
    </form>
    
    <%
        String id = request.getParameter("id");
        if(id != null && !id.isEmpty()) {
            try {
                PaymentDao dao = new PaymentDaoImp();
                boolean deleted = dao.deletePayment(new Payment(Integer.parseInt(id), null, null, 0, null, null));
                
                if(deleted) {
    %>
                    <p>Payment with ID <%= id %> has been deleted successfully.</p>
    <% 
                } else {
    %>
                    <p>Failed to delete payment with ID <%= id %>.</p>
    <% 
                }
            } catch (Exception e) {
    %>
                <p>Error occurred: <%= e.getMessage() %></p>
    <% 
            }
        }
    %>
</body>
</html>
