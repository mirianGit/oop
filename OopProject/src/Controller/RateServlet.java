package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Dish;
import Model.User;

/**
 * Servlet implementation class RateServlet
 */
@WebServlet("/RateServlet")
public class RateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int rate = Integer.parseInt(request.getParameter("rate"));
		int dish_id = Integer.parseInt(request.getParameter("dish_id"));
		Dish d = Dish.getDish(Dish.getName(dish_id));
		User user = User.getUserById(user_id);
		d.rate(rate, user);
		request.setAttribute("dish_id", dish_id);
		RequestDispatcher dispatch = request.getRequestDispatcher("DishServlet");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
