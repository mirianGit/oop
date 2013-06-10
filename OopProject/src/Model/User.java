package Model;

import java.sql.Connection;
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
	private int userId,role;
	private String name, password;
	private Connection con= MyDB.getConnection();;
	private Statement stmt;
	public User(int id,String name, String password,int role){
		try {
			stmt = con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.name=name;
		this.password=password;
		this.role=role;
		if(id == -1){
			addToDatabase();
			userId=getIdFromDatabase();
		}
		else userId = id;
	
	}
	public boolean isAdmin(){
		return role==1;
	}
	private int getIdFromDatabase(){
		String select = "SELECT * FROM USER WHERE USER_NAME = '"+name+"';";
		int id=-1;
		try {
			ResultSet res=stmt.executeQuery(select);
			if(res.next()) id=res.getInt("USER_ID");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	public int getId() {
		return userId;
	}
	public String getName(){
		return name;
	}
	
	private void addToDatabase() {
		
		try {
			String sql = "INSERT INTO USER VALUES (null , '"
					+ name + "', '"
					+ password + "',"
					+ role + ");";
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void addToWishList(int dishId){
		try {
			String sql = "INSERT INTO wish_list VALUES ("+userId+", "+dishId+");";
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<Dish> wishList(){
		List<Dish> wishList=new ArrayList<Dish>();
		String select = "SELECT * FROM WISH_LIST WHERE USER_ID = "+userId+";";
		ResultSet result;
		try {
			result = stmt.executeQuery(select);
			while(result.next()){
				String name =Dish.getName(result.getInt("dish_id"));
				Dish dish = Dish.getDish(name);
				wishList.add(dish);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wishList;
	}
	private boolean wishListContains(int dish_id){
		ArrayList<Dish> wishList=(ArrayList<Dish>) wishList();
		for(Dish d:wishList){
			if(d.getId()==dish_id) return true;
		}
		return false;
	}
	public List<Dish> uploadedDishes(){
		List<Dish> dishes=new ArrayList<Dish>();
		String select = "SELECT * FROM DISHES WHERE AUTHOR = "+userId+";";
		try {
			ResultSet result = stmt.executeQuery(select);
			while(result.next()){
				String name =Dish.getName(result.getInt("dish_id"));
				Dish dish = Dish.getDish(name);
				dishes.add(dish);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dishes;
	}
	
	private static ResultSet getUserInfo(int id){
		ResultSet res =null;
		try {
			Statement stat = MyDB.getConnection().createStatement();
			String sql = "SELECT * FROM USER WHERE USER_ID =" + id	+ ";";
			res = stat.executeQuery(sql);
		}catch (SQLException e) {
			
		}
		return res;
	}
	public static String getColumnInfo(int id,String columnName){
		ResultSet res=getUserInfo(id);
		String username=null;
		try {
			if(res.next()) username=res.getString(columnName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return username;
	}
	
	public static int getIdByName(String name){
		int id=-1;
		ResultSet res =null;
		try {
			Statement stat = MyDB.getConnection().createStatement();
			String sql = "SELECT USER_ID FROM USER WHERE USER_NAME ='" + name	+ "';";
			res = stat.executeQuery(sql);
			if(res.next()) id=Integer.parseInt(res.getString("USER_ID"));
		}catch (SQLException e) {
			
		}
		return id;
	}
	public static User getUserById(int id){
		String name=getColumnInfo(id, "USER_NAME");
		String password=getColumnInfo(id, "USER_PASSWORD");
		int role=Integer.parseInt(getColumnInfo(id, "ROLE"));
		return new User(id,name,password,role);
	}
	public static boolean exsistsAccount(String username){
		ResultSet res =null;
		try {
			Statement stat = MyDB.getConnection().createStatement();
			String sql = "SELECT * FROM USER WHERE USER_NAME ='" +username+ "';";
			res = stat.executeQuery(sql);
			if(res.next()) return true;
		}catch (SQLException e) {
			
		}
		return false;
	}
	public static boolean passwordIsCorrect(String username,String password){
		ResultSet res =null;
		try {
			Statement stat = MyDB.getConnection().createStatement();
			String sql = "SELECT USER_PASSWORD FROM USER WHERE USER_NAME ='" +username+ "';";
			res = stat.executeQuery(sql);
			if(res.next()) {
				if(res.getString("USER_PASSWORD").equals(password)) return true;
			}
		}catch (SQLException e) {
	
		}
		return false;
	}
	public static List<User> allUsers(){
		List<User> users=  new ArrayList<User>();
		String select = "SELECT USER_ID FROM USER WHERE ROLE = 0;";
		ResultSet res= null;
		try {
			Statement stat = MyDB.getConnection().createStatement();	
			res = stat.executeQuery(select);
			while(res.next()){
				int user_id = res.getInt("USER_ID");
				User us = User.getUserById(user_id);
				users.add(us);
			}
		}catch (SQLException e) {
			
		}
		return users;
	}
	public static void deleteUser(int id){
		String select = "DELETE FROM user WHERE user_id="+id+";";
		try {
			Statement stat = MyDB.getConnection().createStatement();	
			stat.executeUpdate(select);
			
		}catch (SQLException e) {
			
		}
	}

}
