package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CompetitionDAO;
import DAO.CompetitionDAOImp;
import domain.Competition;

/**
 * Servlet implementation class ListCompetition
 */
public class ListCompetition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListCompetition() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CompetitionDAO cd=new CompetitionDAOImp();
		
		List<Competition> competitionAll=cd.getCompetitionAll();
		request.setAttribute("competitionAll", competitionAll);
		
		request.getRequestDispatcher("/pages/order/list.jsp").forward(request, response);
	}

}
