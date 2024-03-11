package com.jsp.controller;

import java.io.IOException;

import com.jsp.Payment;
import com.jsp.payment.PaymentDaoImp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/payment")
public class UserController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Payment payment = new Payment();
		payment.setId(Integer.parseInt(req.getParameter("id")));
		payment.setName(req.getParameter("name"));
		payment.setPassword(req.getParameter("password"));
		payment.setAmount(Double.parseDouble(req.getParameter("amount")));
		payment.setPayment_type(req.getParameter("payment_type"));
		payment.setEmail(req.getParameter("email"));
		
		String message=null;
		boolean savePayment=false;
		PaymentDaoImp dao=new PaymentDaoImp();
		dao.savePayment(payment);
		if(savePayment) {
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("message", message);
			req.getRequestDispatcher("form.jsp").forward(req, resp);
		}
		
	}
}
