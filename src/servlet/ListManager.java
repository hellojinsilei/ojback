package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.ManagerDAO;
import DAO.ManagerDAOImp;
import domain.Manager;

/**
 * Servlet implementation class ListManager
 */
public class ListManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ManagerDAO md=new ManagerDAOImp();
		
		List<Manager> managerAll=md.getManagerAll();
		request.setAttribute("managerAll", managerAll);
		
		request.getRequestDispatcher("/pages/admin/list.jsp").forward(request, response);
	}

}
