package com.jsp;

public class Payment {
	private int id;
	private String name;
	private String password;
	private double amount;
	private String payment_type;
	private String email;
	public int getId() {
		return id;
	}
	
	public Payment()
	{
		
	}
	
	public Payment(int id, String name, String password, double amount, String payment_type, String email) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.amount = amount;
		this.payment_type = payment_type;
		this.email = email;
	}



	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

}
