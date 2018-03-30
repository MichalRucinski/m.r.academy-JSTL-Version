
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import beans.User;
import database.Account;
import database.Sorter;

/**
 * Servlet implementation class MusicSchool
 */
@WebServlet("/MusicSchool")
public class MusicSchool extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MusicSchool() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			InitialContext initContext = new InitialContext();

			Context env = (Context) initContext.lookup("java:comp/env");

			ds = (DataSource) env.lookup("jdbc/m1304_mracademy");

		} catch (NamingException e) {
			throw new ServletException();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action == null) {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else if (action.equals("login")) {
			request.setAttribute("message", "");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else if (action.equals("classes")) {
			request.getRequestDispatcher("/classes.jsp").forward(request, response);
		} else if (action.equals("index")) {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else if (action.equals("aboutme")) {
			request.getRequestDispatcher("/aboutme.jsp").forward(request, response);
		} else if (action.equals("levels")) {
			request.getRequestDispatcher("/levels.jsp").forward(request, response);
		} else if (action.equals("logout")) {
			request.getRequestDispatcher("/logout.jsp").forward(request, response);
		} else if (action.equals("piano") || action.equals("keyboard") || action.equals("guitar")
				|| action.equals("pianoandkeyboard") || action.equals("all")) {

			if(action.equals("pianoandkeyboard"))
				request.setAttribute("inscription", "PIANINO I KEYBOARD");
			else if(action.equals("piano"))
				request.setAttribute("inscription", "PIANINO");
			else if(action.equals("guitar"))
				request.setAttribute("inscription", "GITARA");
			else if(action.equals("keyboard"))
				request.setAttribute("inscription", "KEYBOARD");
			else if(action.equals("all"))
				request.setAttribute("inscription", "WSZYSTKIE KLASY");
			
			Connection conn = null;

			try {
				conn = ds.getConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return;
			}
			Sorter sorter = new Sorter(conn);
			ArrayList<String> instruments = new ArrayList<String>();
			if (action.equals("piano"))
				instruments.add("piano");
			if (action.equals("keyboard"))
				instruments.add("keyboard");
			if (action.equals("guitar"))
				instruments.add("guitar");
			if (action.equals("pianoandkeyboard")) {
				instruments.add("piano");
				instruments.add("keyboard");
			}
			if (action.equals("all")) {
				instruments.add("keyboard");
				instruments.add("piano");
				instruments.add("guitar");
			}
			try {
				request.setAttribute("list", sorter.getList(instruments));
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return;
			}

			request.getRequestDispatcher("/classes.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action == null) {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		Connection conn = null;

		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}

		if (action.equals("dologin")) {
			String login = request.getParameter("login");
			String password = request.getParameter("password");

			Account account = new Account(conn);

			try {
				if (account.login(login, password)) {
					User user = new User(login, password);
					// HttpSession session = request.getSession(true);
					// session.setAttribute("name", account.getName(login, password));
					// session.setAttribute("login", login);

					user.setName(account.getName(login, password));
					HttpSession session = request.getSession(true);
					session.setAttribute("user", user);
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				} else {
					request.setAttribute("message", "email address or password not recognized");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
