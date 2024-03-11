<%@ page import="com.jsp.controller.PaymentDao" %>
<%@ page import="com.jsp.payment.PaymentDaoImp" %>
<%@ page import="com.jsp.Payment" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Payment Details</title>
</head>
<body>
    <h2>Find Payment Details by ID</h2>
    <form action="" method="post">
        Enter ID: <input type="text" name="id">
        <input type="submit" value="Find Details">
    </form>
    
    <%
        String id = request.getParameter("id");
        if(id != null && !id.isEmpty()) {
            // Assuming you have defined a method to find payment details by ID in your DAO
            
            // You should validate user input before searching for payment details
            
            try {
                PaymentDao dao = new PaymentDaoImp();
                Payment payment = dao.findPaymentById(Integer.parseInt(id));
                
                if(payment != null) {
    %>
                    <hr>
                    <h2>Update Payment Details</h2>
                    <form action="" method="post">
                        <input type="hidden" name="id" value="<%= payment.getId() %>">
                        Name: <input type="text" name="name" value="<%= payment.getName() %>"><br><br>
                        Password: <input type="text" name="password" value="<%= payment.getPassword() %>"><br><br>
                        Amount: <input type="number" name="amount" value="<%= payment.getAmount() %>"><br><br>
                        Payment Type: <input type="text" name="payment_type" value="<%= payment.getPayment_type() %>"><br><br>
                        Email: <input type="email" name="email" value="<%= payment.getEmail() %>"><br><br>
                        <input type="submit" name="action" value="Update">
                    </form>
    <% 
                } else {
    %>
                    <p>No payment found for ID <%= id %>.</p>
    <% 
                }
            } catch (Exception e) {
    %>
                <p>Error occurred: <%= e.getMessage() %></p>
    <% 
            }
        }
    %>

    <%
        // Handle form submission
        if (request.getParameter("action") != null && request.getParameter("action").equals("Update")) {
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            double amount = Double.parseDouble(request.getParameter("amount"));
            String paymentType = request.getParameter("payment_type");
            String email = request.getParameter("email");
            
            Payment updatedPayment = new Payment(Integer.parseInt(id), name, password, amount, paymentType, email);
            
            try {
                PaymentDao dao = new PaymentDaoImp();
                boolean updated = dao.updatePayment(updatedPayment);
                if (updated) {
    %>
                    <p>Payment details updated successfully.</p>
    <%
                } else {
    %>
                    <p>Failed to update payment details.</p>
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
