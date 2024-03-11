package com.jsp.controller;

import java.util.List;

import com.jsp.Payment;


public interface PaymentDao {
	
	boolean savePayment(Payment payment);
	boolean updatePayment(Payment payment);
	boolean deletePayment(Payment payment);
	Payment findPaymentById(int id);
}
