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

import domain.Competition;
import domain.Problem;
import jdbcutil.JDBCUtil;

/**
 * Servlet implementation class SerchCompetition
 */
public class SerchCompetition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SerchCompetition() {
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
			Competition c = new Competition();
			//2.�ѽ��յĲ�����װ��User����
			try {
				BeanUtils.populate(c, parameterMap);
			} catch (Exception e) {
				e.printStackTrace();
			}
		QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
		String s="select * from competition where competition_name like \"%\"?\"%\" or start = ? or end = ? or competition_id = ?";
		List<Competition> serchCompetition = null;
    	
		
		try {
			serchCompetition =qr.query(s, new BeanListHandler<Competition>(Competition.class),c.getCompetition_name(),c.getStart(),c.getEnd(),c.getCompetition_id());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("serchCompetition", serchCompetition);
		System.out.println(serchCompetition);
		request.getRequestDispatcher("/pages/order/serchCompetition.jsp").forward(request, response);
	}

}
