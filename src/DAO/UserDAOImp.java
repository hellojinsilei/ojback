package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import jdbcutil.JDBCUtil;

import com.mysql.cj.protocol.Resultset;

import domain.User;

public class UserDAOImp implements UserDAO{
	public List<User> getUserAll() {
		QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
		String sql="select * from user";
		List<User> list = null;
    	
    		
		try {
			list =qr.query(sql, new BeanListHandler<User>(User.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<User> getSerchUser(String s) {
		QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
		String sql="select * from user where ";
		List<User> list = null;
    	
    		
		try {
			list =qr.query(s, new BeanListHandler<User>(User.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
