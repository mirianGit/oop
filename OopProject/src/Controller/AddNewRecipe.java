package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Dish;
import Model.User;

/**
 * Servlet implementation class AddNewRecipe
 */
@WebServlet("/AddNewRecipe")
public class AddNewRecipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewRecipe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		if (request.getSession().getAttribute("signed") == null){
			request.setAttribute("problem", "For adding your recipe you have to log in first:)");
			RequestDispatcher dispatch = request.getRequestDispatcher("Login.jsp");
			dispatch.forward(request, response);
		}else{
			RequestDispatcher dispatch = request.getRequestDispatcher("AddNewRecipe.jsp");
			dispatch.forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = null;
		HttpSession curr = request.getSession();
		String name = (String) request.getParameter("name");
		if(name == null || name == "")
		if(Dish.getDish(name) != null){
			request.setAttribute("problem", "The dish with this name already exists.");
			dispatch = request.getRequestDispatcher("AddNewRecipe.jsp");
			dispatch.forward(request, response);
		}else{ 
			String recipe = (String) request.getParameter("recipe");
			curr.setAttribute(name, "name");
			curr.setAttribute(recipe, "recipe");
		}
		
		
	}

}
