package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.User;

/**
 * Servlet implementation class Register
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = null;
		HttpSession curr = request.getSession();
		String name = (String) request.getParameter("name");
		String pass1 = (String) request.getParameter("password1");
		String pass2 = (String) request.getParameter("password2");
		if(pass1.equals(pass2)){
			curr.setAttribute("signed", "true");
			curr.setAttribute("name", name);
			User newone = new User(-1, name, pass1, 0);
			dispatch = request.getRequestDispatcher("HomePage.jsp");
			dispatch.forward(request, response);
		}else{
			curr.setAttribute("problem", "passwords must be the same");
			dispatch = request.getRequestDispatcher("Register.jsp");
			dispatch.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
