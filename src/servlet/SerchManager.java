package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import domain.Manager;
import domain.User;
import jdbcutil.JDBCUtil;

/**
 * Servlet implementation class SerchManager
 */
public class SerchManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SerchManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数  验证码
			//如果正确 
			//1.接收所有参数
			Map<String, String[]> parameterMap = request.getParameterMap();
			Manager u = new Manager();
			//2.把接收的参数封装成User对象
			try {
				BeanUtils.populate(u, parameterMap);
			} catch (Exception e) {
				e.printStackTrace();
			}
		QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
		String s="select * from manager where manager_id=? or email = ? or account = ?";
		List<Manager> serchManager = null;
    	
		
		try {
			serchManager =qr.query(s, new BeanListHandler<Manager>(Manager.class),u.getManager_id(),u.getEmail(),u.getAccount());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("serchManager", serchManager);
		System.out.println(serchManager);
		request.getRequestDispatcher("/pages/admin/serchManager.jsp").forward(request, response);
	}

}
