package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Dish;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page=1;
		if(request.getParameter("page")!=null){
			
			page=Integer.parseInt(request.getParameter("page"));
			
		
		}
		
		request.setAttribute("page", page);
		String name="";
		if( request.getParameter("name")!=null){
			name=request.getParameter("name");
		}
		
		ArrayList<Dish> allApprovedDishes =(ArrayList<Dish>) request.getAttribute("alldishes");
		ArrayList<Dish> allApprovedDishesFromSession =(ArrayList<Dish>) request.getSession().getAttribute("alldishes");
		String pageName=(String) request.getSession().getAttribute("pageName");
		if(allApprovedDishes == null && (allApprovedDishesFromSession==null ||!pageName.equals("Found")) ) {
			allApprovedDishes = (ArrayList<Dish>) Dish.getDishesByName(name);;
		}else if(allApprovedDishes == null){
			allApprovedDishes=allApprovedDishesFromSession;
		}
		
	
		
		request.getSession().setAttribute("alldishes",null);
		request.setAttribute("show", "Found");
		request.setAttribute("alldishes", allApprovedDishes);
		RequestDispatcher dispatch = request.getRequestDispatcher("AllRecipes.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
