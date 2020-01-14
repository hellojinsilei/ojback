package DAO;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import domain.Competition;

import jdbcutil.JDBCUtil;

public class CompetitionDAOImp implements CompetitionDAO{
	public List<Competition> getCompetitionAll(){
		QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
		String sql="select * from competition";
		List<Competition> list = null;
    	
    		
		try {
			list =qr.query(sql, new BeanListHandler<Competition>(Competition.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
