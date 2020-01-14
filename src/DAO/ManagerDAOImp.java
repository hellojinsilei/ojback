package DAO;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import domain.Manager;
import jdbcutil.JDBCUtil;

public class ManagerDAOImp implements ManagerDAO{
	public List<Manager> getManagerAll(){
		QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
		String sql="select * from manager";
		List<Manager> list = null;
    	
    		
		try {
			list =qr.query(sql, new BeanListHandler<Manager>(Manager.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
