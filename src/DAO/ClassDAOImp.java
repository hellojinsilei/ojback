package DAO;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import domain.Class;
import jdbcutil.JDBCUtil;

public class ClassDAOImp implements ClassDAO{
	public List<Class> getClassAll(){
		QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
		String sql="select * from class";
		List<Class> list = null;
    	
    		
		try {
			list =qr.query(sql, new BeanListHandler<Class>(Class.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
