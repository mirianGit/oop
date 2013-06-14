package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import Model.MyDB;

public class Comment {
	private static Connection con = MyDB.getConnection();
	private static int currentDish;
	int authorId;
	private static String text;
	private static int commentId;

	public Comment(Dish curr, User user, String text) {
		this.currentDish = curr.getId();
		this.authorId = user.getId();
		this.text = text;
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

	public String getText() {
		return text;
	}

	// amatebs komentars bazashi
	public void addComment() throws SQLException {
		String sql = "INSERT INTO COMMENTS VALUES (null, ? , ? ,?);";
		PreparedStatement stat = con.prepareStatement(sql);
		stat.setString(1, text);
		stat.setInt(2, authorId);
		stat.setInt(3, currentDish);
		stat.executeUpdate();
		commentId = generateId();
	}

	private int generateId() {
		int res = -1;
		try {
			String select = "SELECT * FROM COMMENTS WHERE COMMENT_BODY = ?;";
			PreparedStatement stat = con.prepareStatement(select);
			stat.setString(1, text);
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
		return User.getUserById(authorId).getName();
	}

	// abrunebs kerdzis komentars id-is mixedvit
	public static Comment getComment(int id) {
		Comment curr = null;
		try {
			String sql = "SELECT * FROM COMMENTS WHERE COMMENT_ID = ?;";
			PreparedStatement stat = MyDB.getConnection().prepareStatement(sql);
			stat.setInt(1, id);
			ResultSet d = stat.executeQuery();
			if (d.next()) {
				int user_id = d.getInt("USER_ID");
				User us = User.getUserById(user_id);
				Dish dis = Dish.getDish(Dish.getName(d.getInt("DISH_ID")));
				curr = new Comment(dis, us, d.getString("COMMENT_BODY"));
				curr.setId(id);
			}
		} catch (SQLException e) {
		}
		return curr;
	}

	private void setId(int int1) {
		this.commentId = int1;
	}

	// abrunebs kerdzis komentarebs
	public static List<Comment> getDishComments(int Dish_Id) {
		List<Comment> result = new ArrayList<Comment>();
		ResultSet r = getComments(Dish_Id);
		try {
			while (r.next()) {
				Comment temp = getComment(r.getInt("COMMENT_ID"));
				System.out.println("+++ " + temp.getId());
				result.add(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// shlis komentars
	public static void deleteComment(int com_id) {
		try {
			String sql = "DELETE FROM COMMENTS WHERE COMMENT_ID = ? ;";
			PreparedStatement stat = con.prepareStatement(sql);
			stat.setInt(1, com_id);
			stat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private static ResultSet getComments(int Dish_id) {
		ResultSet res = null;
		try {
			String sql = "SELECT * FROM COMMENTS WHERE DISH_ID = ?;";
			PreparedStatement stat = MyDB.getConnection().prepareStatement(sql);
			stat.setInt(1, Dish_id);
			res = stat.executeQuery();
		} catch (SQLException e) {

		}
		return res;
	}
}