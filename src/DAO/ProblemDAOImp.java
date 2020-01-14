package DAO;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import domain.Problem;

import jdbcutil.JDBCUtil;

public class ProblemDAOImp implements ProblemDAO{
	public List<Problem> getProblemAll(){
		QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
		String sql="select * from problem";
		List<Problem> list = null;
    	
    		
		try {
			list =qr.query(sql, new BeanListHandler<Problem>(Problem.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
