package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ClassDAO;
import DAO.ClassDAOImp;
import DAO.CompetitionDAO;
import DAO.CompetitionDAOImp;
import domain.Class;

/**
 * Servlet implementation class ListClass
 */
public class ListClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ClassDAO cd=new ClassDAOImp();
		
		List<Class> classAll=cd.getClassAll();
		request.setAttribute("classAll", classAll);
		
		request.getRequestDispatcher("/pages/class/list.jsp").forward(request, response);
	}

}
