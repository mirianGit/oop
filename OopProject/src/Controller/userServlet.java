package Controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Dish;
import Model.User;

/**
 * Servlet implementation class userServlet
 */
@WebServlet("/userServlet")
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession curr = request.getSession();
		Integer id=User.getIdByName((String) request.getSession().getAttribute("name"));
		curr.setAttribute("id", id);
		User us= User.getUserById(id);
		
		List<Dish> dishes = us.uploadedDishes(); 
		curr.setAttribute("dishes", dishes);
		if(us.isAdmin()){
			Collection<Dish> c= Dish.GetNotApprovedDishes();
			curr.setAttribute("notApproved", c);
			RequestDispatcher dispatch = request.getRequestDispatcher("AdminProfile.jsp");
			dispatch.forward(request, response);
		}else{
			List<Dish> wishlist = us.wishList(); 
			curr.setAttribute("wishlist", wishlist);
		RequestDispatcher dispatch = request.getRequestDispatcher("Profile.jsp");
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
