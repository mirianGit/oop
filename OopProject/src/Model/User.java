package Model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author elene
 * 
 */
public class User {
	private int userId, role;
	private String name, password;
	private Connection con = MyDB.getConnection();;
	private Statement stmt;
	private static ResultSet userChecker;

	public User(int id, String name, String password, int role) {
		try {
			stmt = con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.name = name;
		
		this.role = role;
		if (id == -1) {
			this.password = HashPassword(password);
			addToDatabase();
			userId = getIdFromDatabase();
		} else{
			this.password=password;
			userId = id;
		}
	}
	private static String HashPassword(String string) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		md.update(string.getBytes());
		return hexToString(md.digest());

	}
	public static String hexToString(byte[] bytes) {
		StringBuffer buff = new StringBuffer();
		for (int i = 0; i < bytes.length; i++) {
			int val = bytes[i];
			val = val & 0xff; // remove higher bits, sign
			if (val < 16)
				buff.append('0'); // leading 0
			buff.append(Integer.toString(val, 16));
		}
		return buff.toString();
	}

	public boolean isAdmin() {
		return role == 1;
	}

	public void makeAdmin() {
		try {
			String sql = "UPDATE User SET role = 1 WHERE User_ID = ? ;";
			PreparedStatement stat = con.prepareStatement(sql);
			stat.setInt(1, getId());
			stat.executeUpdate();
			role = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private int getIdFromDatabase() {
		String select = "SELECT * FROM USER WHERE USER_NAME = ? ;";
		int id = -1;
		try {
			PreparedStatement stat = con.prepareStatement(select);
			stat.setString(1, name);
			ResultSet res = stat.executeQuery();
			if (res.next())
				id = res.getInt("USER_ID");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

	public int getId() {
		return userId;
	}

	public String getName() {
		return name;
	}

	private void addToDatabase() {

		try {
			String sql = "INSERT INTO USER VALUES (null , ?, ?, ?);";
			PreparedStatement stat = con.prepareStatement(sql);
			stat.setString(1, name);
			stat.setString(2, password);
			stat.setInt(3, role);
			stat.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void addToWishList(int dishId) {
		try {
			String sql = "INSERT INTO wish_list VALUES ( ?, ?);";
			PreparedStatement stat = con.prepareStatement(sql);
			stat.setInt(1, userId);
			stat.setInt(2, dishId);
			stat.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Dish> wishList() {
		List<Dish> wishList = new ArrayList<Dish>();
		String select = "SELECT * FROM WISH_LIST WHERE USER_ID = ? ;";
		ResultSet result;
		try {
			PreparedStatement stat = con.prepareStatement(select);
			stat.setInt(1, userId);
			result = stat.executeQuery();
			while (result.next()) {
				String name = Dish.getName(result.getInt("dish_id"));
				Dish dish = Dish.getDish(name);
				wishList.add(dish);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wishList;
	}

	public boolean wishListContains(int dish_id) {
		ArrayList<Dish> wishList = (ArrayList<Dish>) wishList();
		for (Dish d : wishList) {
			if (d.getId() == dish_id)
				return true;
		}
		return false;
	}

	public List<Dish> uploadedDishes() {
		List<Dish> dishes = new ArrayList<Dish>();
		String select = "SELECT * FROM DISHES WHERE AUTHOR = ? ;";
		try {
			PreparedStatement stat = con.prepareStatement(select);
			stat.setInt(1, userId);
			ResultSet result = stat.executeQuery();
			while (result.next()) {
				String name = Dish.getName(result.getInt("dish_id"));
				Dish dish = Dish.getDish(name);
				dishes.add(dish);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dishes;
	}

	private static ResultSet getUserInfo(int id) {
		ResultSet res = null;
		try {
			String sql = "SELECT * FROM USER WHERE USER_ID =" + id + ";";
			PreparedStatement stat = MyDB.getConnection().prepareStatement(sql);
			stat.setInt(1, id);
			res = stat.executeQuery();
		} catch (SQLException e) {

		}
		return res;
	}

	public static String getColumnInfo(int id, String columnName, ResultSet res) {
		if (res == null)
			res = getUserInfo(id);
		String value = null;
		try {
			value = res.getString(columnName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return value;
	}

	public static int getIdByName(String name) {
		int id = -1;
		ResultSet res = null;
		try {
			String sql = "SELECT USER_ID FROM USER WHERE USER_NAME = ? ;";
			PreparedStatement stat = MyDB.getConnection().prepareStatement(sql);
			stat.setString(1, name);
			res = stat.executeQuery();
			if (res.next())
				id = Integer.parseInt(res.getString("USER_ID"));
		} catch (SQLException e) {

		}
		return id;
	}

	public static User getUserById(int id) {
		ResultSet res = getUserInfo(id);
		try {
			if (res.next()) {
				String name = getColumnInfo(id, "USER_NAME", res);
				String password = getColumnInfo(id, "USER_PASSWORD", res);
			
				int role = Integer.parseInt(getColumnInfo(id, "ROLE", res));

				return new User(id, name, password, role);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static boolean exsistsAccount(String username) {
		userChecker = null;
		try {
			String sql = "SELECT * FROM USER WHERE USER_NAME = ? ;";
			PreparedStatement stat = MyDB.getConnection().prepareStatement(sql);
			stat.setString(1, username);
			userChecker = stat.executeQuery();
			if (userChecker.next())
				return true;
		} catch (SQLException e) {
		}
		return false;
	}

	public static boolean passwordIsCorrect(String username, String password) {
		try {
			String hashed=HashPassword(password);
			if (userChecker.getString("USER_PASSWORD").equals(hashed))
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public static List<User> allUsers(String name) {
		List<User> users = new ArrayList<User>();
		String select;
		PreparedStatement stat;
		try {
			if (name == null){
				select = "SELECT USER_ID FROM USER WHERE ROLE = 0;";
				stat = MyDB.getConnection().prepareStatement(select);
			}else{
				select = "SELECT USER_ID FROM USER WHERE ROLE = 0 AND USER_NAME like ? ;";
				stat = MyDB.getConnection().prepareStatement(select);
				stat.setString(1, "%" + name + "%");
			}
			ResultSet res = stat.executeQuery();
			while (res.next()) {
				int user_id = res.getInt("USER_ID");
				User us = User.getUserById(user_id);
				users.add(us);
			}
		} catch (SQLException e) {

		}
		return users;
	}

	public static void deleteUser(int id) {
		String select = "DELETE FROM user WHERE user_id = ? ;";
		try {
			PreparedStatement stat = MyDB.getConnection().prepareStatement(select);
			stat.setInt(1, id);
			stat.executeUpdate();
		} catch (SQLException e) {

		}
	}

}
