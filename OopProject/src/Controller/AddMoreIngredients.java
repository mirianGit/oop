package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddMoreIngredients
 */
@WebServlet("/AddMoreIngredients")
public class AddMoreIngredients extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMoreIngredients() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    Integer numAdded = 
	      (Integer)request.getSession().getAttribute("numAdded");
	    if( numAdded == null){
	       /* First visit */
	       numAdded = 1;
	    }else{
	       /* return visit */
	       numAdded += 1;
	    }
	    request.getSession().setAttribute("numAdded", numAdded);
	
	    String jsp = request.getParameter("jsp");
	    System.out.println(jsp + "sfhaf");
	    
		RequestDispatcher dispatch = request.getRequestDispatcher(jsp);
		dispatch.forward(request, response);
	}

}
