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
 * Servlet implementation class Login
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = null;
		HttpSession curr = request.getSession();
		String name = (String) request.getParameter("name");
		String pass = (String) request.getParameter("password");
		if(name.equals("Username")||pass.equals("Password")){
			request.setAttribute("problem", "Please fill all fields");
		
			dispatch = request.getRequestDispatcher("Login.jsp");
			dispatch.forward(request, response);
		}else{
			
			if(User.exsistsAccount(name)){
				if(User.passwordIsCorrect(name, pass)){
					curr.setAttribute("name", name);
					curr.setAttribute("signed", "true");
					dispatch = request.getRequestDispatcher("HomePage.jsp");
					dispatch.forward(request, response);
				} else {
					request.setAttribute("problem", "Password is incorrect. Please, be careful");
					dispatch = request.getRequestDispatcher("Login.jsp");
					dispatch.forward(request, response);
				}
			}else{
				request.setAttribute("problem", "Account doesn't exist. Please register at first ;)");
				dispatch = request.getRequestDispatcher("Login.jsp");
				dispatch.forward(request, response);
			}
		}
	}

}
