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

import domain.Competition;
import domain.Problem;
import jdbcutil.JDBCUtil;

/**
 * Servlet implementation class AddCompetition
 */
public class AddCompetition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCompetition() {
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
			//3.����uid
			//4.д�뵽���ݿ�
			QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
			String sql ="insert into competition(competition_name,competition_description,start,end,competition_players_count) value(?,?,?,?,?)";
			try {
				qr.update(sql,c.getCompetition_name(),c.getCompetition_description(),c.getStart(),c.getEnd(),c.getCompetition_players_count());
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//��ת����¼
			response.getWriter().write("添加成功");
	}

}
