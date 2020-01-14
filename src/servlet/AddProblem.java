package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;

import domain.Problem;
import jdbcutil.JDBCUtil;

/**
 * Servlet implementation class AddProblem
 */
public class AddProblem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProblem() {
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
		
		//��ȡ����  ��֤��
			//�����ȷ 
			//1.�������в���
			Map<String, String[]> parameterMap = request.getParameterMap();
			Problem p = new Problem();
			//2.�ѽ��յĲ�����װ��User����
			try {
				BeanUtils.populate(p, parameterMap);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//3.����uid
			//4.д�뵽���ݿ�
			QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
			String sql ="insert into problem(problem_name,problem_creator_id,problem_difficulty,problem_value) value(?,?,?,?)";
			try {
				qr.update(sql,p.getProblem_name(),"1",p.getProblem_difficulty(),p.getProblem_value());
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//��ת����¼
			response.getWriter().write("添加成功");
	}

}
