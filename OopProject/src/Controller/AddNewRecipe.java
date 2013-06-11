package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Dish;
import Model.Ingredient;
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
		String dishName = request.getParameter("name");
		String recipeText = request.getParameter("recipe");
		int userId = User.getIdByName((String)curr.getAttribute("name"));
		HashMap<Ingredient, String> ingredients = new HashMap<Ingredient, String>();
		Iterator<String> it = request.getParameterMap().keySet().iterator();
		while(it.hasNext()){
			String next = it.next();
			if(next.length()>9){
				if( next.substring(0, 10).equals("INGREDIENT")){
					ingredients.put(new Ingredient(request.getParameter(next), ""), request.getParameter("amount"+next.substring(10)));
				}
			}
		}
		Dish newDish = new Dish(dishName, 0, userId, 0, recipeText, "", ingredients);
		newDish.add();
		dispatch = request.getRequestDispatcher("HomePage.jsp");
		dispatch.forward(request, response);
	}
	
}
