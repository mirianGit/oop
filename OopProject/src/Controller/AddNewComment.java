package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
import Model.Comment;
/**
 * Servlet implementation class AddNewComment
 */
@WebServlet("/AddNewComment")
public class AddNewComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		ArrayList<Comment> dishComments = (ArrayList<Comment>) Comment.getDishComments();
		sess.setAttribute("lastApprovedDishes", dishComments);
		if (request.getSession().getAttribute("signed") == null){
			request.setAttribute("problem", "For commenting you have to log in first:)");
			RequestDispatcher dispatch = request.getRequestDispatcher("Login.jsp");
			dispatch.forward(request, response);
		}else{
			RequestDispatcher dispatch = request.getRequestDispatcher("CommentBox.jsp");
			dispatch.forward(request, response);
		}
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatch = null;
		HttpSession curr = request.getSession();
		String dishName = request.getParameter("name");
		Dish dish = Dish.getDish(dishName);
		String commentText = request.getParameter("COMMENT_BODY");
		
		int userId = User.getIdByName((String)curr.getAttribute("name"));
		User us = User.getUserById(userId);
		Comment newComment = new  Comment(dish, us, commentText );
		try {
			newComment.addComment();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dispatch = request.getRequestDispatcher("Dish.jsp");
		dispatch.forward(request, response);
	}
	
	}


