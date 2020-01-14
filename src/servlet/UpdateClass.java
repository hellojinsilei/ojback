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

import domain.Class;
import jdbcutil.JDBCUtil;

/**
 * Servlet implementation class UpdateClass
 */
public class UpdateClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClass() {
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
			Class p = new Class();
			//2.�ѽ��յĲ�����װ��User����
			try {
				BeanUtils.populate(p, parameterMap);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//4.д�뵽���ݿ�
			QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
			String sql="update class set class_name=?,class_type=?,class_log=?,class_pernum=? where class_id=?";
			try {
				qr.update(sql,p.getClass_name(),p.getClass_type(),p.getClass_log(),p.getClass_pernum(),"1");
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//��ת����¼
			response.getWriter().write("修改成功");
	}

}
