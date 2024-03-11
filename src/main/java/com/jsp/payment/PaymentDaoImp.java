package com.jsp.payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jsp.Payment;
import com.jsp.controller.DataBaseConfig;
import com.jsp.controller.PaymentDao;

public class PaymentDaoImp implements PaymentDao {
	@Override
	public boolean savePayment(Payment payment) {

		Connection connection=new DataBaseConfig().getConnection();
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement("insert into payment values(?,?,?,?,?,?)");
			
			ps.setInt(1, payment.getId());
			ps.setString(2, payment.getName());
			ps.setString(3, payment.getPassword());		
			ps.setDouble(4, payment.getAmount());
			ps.setString(5, payment.getPayment_type());
			ps.setString(6, payment.getEmail());
			int execute=ps.executeUpdate();
			if(execute>0) {
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	return false;
	}

	@Override
    public boolean updatePayment(Payment payment) {
        Connection connection = new DataBaseConfig().getConnection();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement("update payment SET name=?, password=?, amount=?, payment_type=?, email=? WHERE id=?");
            ps.setString(1, payment.getName());
            ps.setString(2, payment.getPassword());      
            ps.setDouble(3, payment.getAmount());
            ps.setString(4, payment.getPayment_type());
            ps.setString(5, payment.getEmail());
            ps.setInt(6, payment.getId());
            int execute = ps.executeUpdate();
            if(execute > 0) {
                return true;
            }       
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean deletePayment(Payment payment) {
        Connection connection = new DataBaseConfig().getConnection();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement("DELETE FROM payment WHERE id=?");
            ps.setInt(1, payment.getId());
            int execute = ps.executeUpdate();
            if(execute > 0) {
                return true;
            }       
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

	@Override
	public Payment findPaymentById(int id) {
		Connection connection = new DataBaseConfig().getConnection();
        PreparedStatement ps;
        ResultSet rs;
        Payment payment = null;
        try {
            ps = connection.prepareStatement("SELECT * FROM payment WHERE id=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                payment = new Payment();
                payment.setId(rs.getInt("id"));
                payment.setName(rs.getString("name"));
                payment.setPassword(rs.getString("password"));
                payment.setAmount(rs.getDouble("amount"));
                payment.setPayment_type(rs.getString("payment_type"));
                payment.setEmail(rs.getString("email"));
            }       
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return payment;
    
	}

}
