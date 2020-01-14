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
import jdbcutil.JDBCUtil;;

/**
 * Servlet implementation class AddClass
 */
public class AddClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddClass() {
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
			Class m = new Class();
			//2.�ѽ��յĲ�����װ��User����
			try {
				BeanUtils.populate(m, parameterMap);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//3.����uid
			//4.д�뵽���ݿ�
			QueryRunner qr = new QueryRunner(JDBCUtil.getDataSourse());
			String sql ="insert into class(class_name,class_type,class_log,class_pernum) value(?,?,?,?)";
			try {
				qr.update(sql,m.getClass_name(),m.getClass_type(),m.getClass_log(),m.getClass_pernum());
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//��ת����¼
			response.getWriter().write("添加成功");
	}

}
