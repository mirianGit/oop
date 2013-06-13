package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Dish;
import Model.Ingredient;

/**
 * Servlet implementation class SearchByIngredientServlet
 */
@WebServlet("/SearchByIngredientsServlet")
public class SearchByIngredientsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchByIngredientsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Ingredient> ingredients = new ArrayList<Ingredient>();
		Map<String, String[]> mapping = request.getParameterMap();
		Iterator<String[]> it = mapping.values().iterator();
		while (it.hasNext()) {
			ingredients.add(new Ingredient(it.next()[0], ""));
		}

		int page = 1;
		if (request.getParameter("page") != null) {

			page = Integer.parseInt(request.getParameter("page"));

		}
		String name = "";
		if (request.getParameter("name") != null) {
			name = request.getParameter("name");
		}

		ArrayList<Dish> allApprovedDishes = (ArrayList<Dish>) request
				.getAttribute("alldishes");
		ArrayList<Dish> allApprovedDishesFromSession = (ArrayList<Dish>) request
				.getSession().getAttribute("alldishes");
		String pageName = (String) request.getSession()
				.getAttribute("pageName");
		if (allApprovedDishes == null
				&& (allApprovedDishesFromSession == null || !pageName
						.equals("FoundIng"))) {
			allApprovedDishes = (ArrayList<Dish>) Dish
					.getDishesByIngredients(ingredients);
		} else if (allApprovedDishes == null) {
			allApprovedDishes = allApprovedDishesFromSession;
		}

		request.getSession().setAttribute("alldishes", null);

		request.setAttribute("page", page);
		request.setAttribute("show", "FoundIng");
		request.setAttribute("alldishes", allApprovedDishes);
		RequestDispatcher dispatch = request
				.getRequestDispatcher("AllRecipes.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
