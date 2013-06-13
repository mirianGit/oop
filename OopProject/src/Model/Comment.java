package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import Model.MyDB;

public class Comment {
	private static Connection con = MyDB.getConnection();
	private static int currentDish;
	int authorId;
	public static String text;
	private static int commentId;

	public Comment(Dish curr, User user, String text) {
		this.currentDish = curr.getId();
		this.authorId = user.getId();
		this.text = text;
		commentId = generateId();
	}

	// gamoaqvs komentaristvis sachiro vizualuri informacia
	public Comment(String userName, String txt) throws SQLException {
		Statement stat = con.createStatement();
		String sql = "SELECT * FROM USERS WHERE USER_NAME = '" + userName
				+ "';";
		ResultSet d = stat.executeQuery(sql);
		if (d.next()) {
			userName = d.getString("USER_NAME");
		}
		text = txt;
		// TODO Auto-generated constructor stub
	}

	// amatebs komentars bazashi
	public void addComment() throws SQLException {
		Statement stat = con.createStatement();
		String sql = "INSERT INTO COMMENTS VALUES (COMMENT_ID, Comment_BODY, USER_ID, DISH_ID)"
				+ " ('"
				+ commentId
				+ "',"
				+ text
				+ ","
				+ authorId
				+ ","
				+ currentDish + "');";
		stat.executeQuery(sql);
	}

	private int generateId() {
		int res = -1;
		try {
			String select = "SELECT * FROM COMMENTS WHERE DISH_ID = ? ;";
			PreparedStatement stat = con.prepareStatement(select);
			ResultSet result = stat.executeQuery();
			result.next();
			res = result.getInt("COMMENT_ID");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	public int getId() {
		return commentId;
	}

	public String getAuthorName() {
		String name = "";
		Statement stat;
		try {
			stat = con.createStatement();
			String sql = "SELECT USER_NAME FROM USERS WHERE USER_ID = '"
					+ authorId + "';";
			ResultSet d = stat.executeQuery(sql);
			name = d.getString("USER_NAME");
			stat.executeQuery(sql);
			return name;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return name;

	}

	// abrunebs kerdzis komentars id-is mixedvit
	public static Comment getComment(int id) {
		Comment curr = null;
		try {
			Statement stat = MyDB.getConnection().createStatement();
			String sql = "SELECT * FROM COMMENTS WHERE COMMENT_ID = '" + id
					+ "';";
			ResultSet d = stat.executeQuery(sql);

			if (d.next()) {
				int user_id = d.getInt("USER_ID");
				User us = User.getUserById(user_id);
				String name = us.getName();
				curr = new Comment(name, d.getString("COMMENT_BODY"));
			}

		} catch (SQLException e) {
		}
		return curr;

	}

	// abrunebs kerdzis komentarebs
	public static Collection<Comment> getDishComments(int Dish_Id) {
		Collection<Comment> result = new ArrayList<Comment>();
		ResultSet r =getComments(Dish_Id);
		try {
			while (r.next()) {
				Comment temp = getComment(r.getInt("COMMENT_ID"));
				result.add(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// shlis komentars
	public void deleteComment(User currUser, Comment com) throws SQLException {
		if (currUser.isAdmin() || currUser.getId() == com.authorId) {
			Statement stat = con.createStatement();
			String sql = "DELETE * FROM COMMENTS WHERE COMMENT_ID = '"
					+ com.getId() + "';";
			stat.executeQuery(sql);
		}
	}
	
	

	private static ResultSet getComments(int Dish_id){
		ResultSet res =null;
		try {
			Statement stat = MyDB.getConnection().createStatement();
			String sql = "SELECT * FROM COMMENTS WHERE DISH_ID =" + Dish_id	+ ";";
			res = stat.executeQuery(sql);
		}catch (SQLException e) {
			
		}
		return res;
	}


}
