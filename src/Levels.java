

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Levels
 */
@WebServlet("/Levels")
public class Levels extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Levels() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String instrument = request.getParameter("instrument");
		String level = request.getParameter("level");
		
		if(level != null) {
			request.setAttribute("level", level);
		}
		
		if(instrument.equals("piano")) {
			request.setAttribute("instrument", "piano");
			request.getRequestDispatcher("/levels.jsp").forward(request, response);
		}
		else if(instrument.equals("guitar")) {
			request.setAttribute("instrument", "guitar");
			request.getRequestDispatcher("/levels.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
