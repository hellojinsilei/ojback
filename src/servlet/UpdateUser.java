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

import DAO.UserDAO;
import DAO.UserDAOImp;
import domain.Problem;
import domain.User;
import jdbcutil.JDBCUtil;

/**
 * Servlet implementation class UpdateUser
 */
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
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

			//2.�ѽ��յĲ�����װ��User����
		
			//3.����uid
			Map<String, String[]> parameterMap = request.getParameterMap();
			User u = new User();
			//2.�ѽ��յĲ�����װ��User����
			try {
				BeanUtils.populate(u, parameterMap);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//4.д�뵽���ݿ�
			QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
			String sql="update user set account=?,nickname=?,email=?,school=? where user_id=?";
			try {
				qr.update(sql,u.getAccount(),u.getNickname(),u.getEmail(),u.getSchool(),"2");
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//��ת����¼
			response.getWriter().write("修改成功");
	}

}
