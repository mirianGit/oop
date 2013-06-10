package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.User;

/**
 * Servlet implementation class wishlistOrDeleteServlet
 */
@WebServlet("/wishlistOrDeleteServlet")
public class wishlistOrDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wishlistOrDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=(String)request.getSession().getAttribute("name");
		User us=User.getUserById(User.getIdByName(name));
		//int id=Integer.parseInt(request.getParameter("id"));
		int dishId=Integer.parseInt(request.getParameter("id"));
		
		String button=request.getParameter("button");
		if(button.equals("add to wishlist")){
			us.addToWishList(dishId);
		}else{
			//washlaa
		}
		RequestDispatcher dispatch = request.getRequestDispatcher("DishServlet"+"?id="+dishId);
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
