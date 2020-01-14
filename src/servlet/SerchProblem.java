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

import domain.Problem;
import domain.User;
import jdbcutil.JDBCUtil;

/**
 * Servlet implementation class SerchProblem
 */
public class SerchProblem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SerchProblem() {
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
			Problem p = new Problem();
			//2.把接收的参数封装成User对象
			try {
				BeanUtils.populate(p, parameterMap);
			} catch (Exception e) {
				e.printStackTrace();
			}
		QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
		String s="select * from problem where problem_name like \"%\"?\"%\" or problem_creator_id = ?";
		List<Problem> serchProblem = null;
    	
		
		try {
			serchProblem =qr.query(s, new BeanListHandler<Problem>(Problem.class),p.getProblem_name(),p.getProblem_creator_id());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("serchProblem", serchProblem);
		System.out.println(serchProblem);
		request.getRequestDispatcher("/pages/article/serchProblem.jsp").forward(request, response);
	}

}
