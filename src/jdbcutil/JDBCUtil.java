package jdbcutil;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Statement;


public class JDBCUtil {
	
	public static DataSource ds=null;
	static {
		
		try {
			java.util.Properties p=new java.util.Properties();
			String path=JDBCUtil.class.getClassLoader().getResource("db.properties").getPath();
			System.out.println(path);
			FileInputStream in =new FileInputStream(path);
			p.load(in);
			ds=DruidDataSourceFactory.createDataSource(p);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static DataSource getDataSourse() {
		return ds;
	}
	
	public static String url="jdbc:mysql://localhost:3306/ojsystem";
	public static String user="root";
	public static String password="1234";
	public static String driverName="com.mysql.jc.jdbc.Driver";
	
	static {
		try {
			Class.forName(JDBCUtil.driverName);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static Connection getConn() {
		try {
			
			return (Connection) DriverManager.getConnection(JDBCUtil.url,JDBCUtil.user,JDBCUtil.password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static void close(Connection conn,Statement st,ResultSet rs) throws SQLException {
		if(rs!=null)
		{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		if(st!=null)
		{
			try {
				((ResultSet) st).close();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		if(conn!=null)
		{
			conn.close();
		}
	
	}
}
