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

import domain.Class;
import jdbcutil.JDBCUtil;

/**
 * Servlet implementation class SerchClass
 */
public class SerchClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SerchClass() {
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
			Class u = new Class();
			//2.把接收的参数封装成User对象
			try {
				BeanUtils.populate(u, parameterMap);
			} catch (Exception e) {
				e.printStackTrace();
			}
		QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
		String s="select * from class where class_id=? or class_name like ?";
		List<Class> serchClass = null;
    	
		
		try {
			serchClass =qr.query(s, new BeanListHandler<Class>(Class.class),u.getClass_id(),u.getClass_name());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("serchClass", serchClass);
		System.out.println(serchClass);
		request.getRequestDispatcher("/pages/class/serchClass.jsp").forward(request, response);
	}

}
