package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProblemDAO;
import DAO.ProblemDAOImp;

import domain.Problem;

/**
 * Servlet implementation class ListProblem
 */
public class ListProblem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListProblem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProblemDAO pd =  new ProblemDAOImp();
		List<Problem> problemAll = pd.getProblemAll();
		request.setAttribute("problemAll", problemAll);
		
		request.getRequestDispatcher("/pages/article/list.jsp").forward(request, response);
	}

}
