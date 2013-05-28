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
	public List<Dish> uploadedDishes(){
		List<Dish> dishes=new ArrayList<Dish>();
		String select = "SELECT * FROM DISHES WHERE USER_ID = "+userId+";";
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

}
