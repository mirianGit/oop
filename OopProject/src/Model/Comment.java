package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Comment {
	private static Connection con = MyDB.getConnection();
	private static int currentDish;
	int authorId;
	String text;
	int commentId;
	

	public Comment(Dish curr, User user, String text) {
		this.currentDish = curr.getId();
		this.authorId = user.getId();
		this.text = text;
	}

	//gamoaqvs komentaristvis sachiro vizualuri  informacia	
	public Comment(String userName, String txt) throws SQLException {
		Statement stat = con.createStatement();
		String sql = "SELECT * FROM USERS WHERE USER-ID = '" + authorId + "';";
		ResultSet d = stat.executeQuery(sql);
		if(d.next()){
			userName = d.getString("USER-NAME");
		}
		txt = text;
		// TODO Auto-generated constructor stub
	}

	
	//amatebs komentars bazashi
	public void addComment() throws SQLException {
		Statement stat = con.createStatement();
		String sql = "INSERT INTO COMMENTS VALUES (COMMENT-ID, TXT, USER-ID)"
				+ " ('"
				+ commentId
				+ "',"
				+ text
				+ ","
				+ authorId + "');";
		stat.executeQuery(sql);
	}

	//abrunebs kerdzis komentars
	public static Comment getComment() {
		Comment curr = null;
		try {
			Statement stat = MyDB.getConnection().createStatement();
			String sql = "SELECT * FROM COMMENTS WHERE DISH_ID = '" + currentDish + "';";
			ResultSet d = stat.executeQuery(sql);			
			if(d.next()){
				curr = new Comment(d.getString("USER-ID"),d.getString("TXT"));
			}
		
		} catch (SQLException e) {}
		return curr;
		
	}

	
//shlis komentars 
	public void deleteComment(Comment com, int adminId, int userId) throws SQLException {
		if(com.authorId == userId || com.authorId == adminId ){
			Statement stat = con.createStatement();
			String sql = "DELETE * FROM COMMENTS WHERE COMMENT-ID = '" + com.commentId + "';";
			stat.executeQuery(sql);
		}
	}
	
	
}
