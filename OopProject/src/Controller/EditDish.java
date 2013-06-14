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
 * Servlet implementation class EditDish
 */
@WebServlet("/EditDish")
public class EditDish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditDish() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dish_id = (Integer)request.getSession().getAttribute("dish_id");
		Dish editingDish = Dish.getDish(Dish.getName(dish_id));
		request.setAttribute("edit?", editingDish);
		request.getSession().setAttribute("dish_id", null);
		RequestDispatcher dispatch = request.getRequestDispatcher("EditDish.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int editingDishId = Integer.parseInt(request.getParameter("editingDishId"));
		String dishName = request.getParameter("name");
		String recipeText = request.getParameter("recipe");
		String pic = request.getParameter("pic");
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
		Dish.editDish(editingDishId, dishName, recipeText, pic, ingredients);
		RequestDispatcher dispatch = request.getRequestDispatcher("/Home");
		dispatch.forward(request, response);
	}

}
