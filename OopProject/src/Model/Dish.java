package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;

public class Dish {
	private String name;
	private String receiptText;
	private String picture;
	private int authorId;
	private int rate;
	private int approved;
	private int id = -1;
	private HashMap<Ingredient, String> ingredients;
	private Connection con = MyDB.getConnection();

	
	public Dish(String name, int rate, int userId, int approved, String text, String image, HashMap<Ingredient, String> ingredients) {
		this.name = name;
		receiptText = text;
		picture = image;
		authorId = userId;
		this.rate = rate;
		this.ingredients =  ingredients;
		this.approved = approved;
	}
	
	public int getAuthorId(){
		return authorId;
	}
	
	private int generateId(){
		int res = -1;
		try {
			String select = "SELECT * FROM DISHES WHERE DISH_NAME = ? ;";
			PreparedStatement stat = con.prepareStatement(select);
			stat.setString(1, name);
			ResultSet result = stat.executeQuery();
			result.next();
			res = result.getInt("DISH_ID");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.id = res;
		return res;
	}
	
	
	public void rate(int rate, User user){
		try {
			int oldRate = 0;
			String select = "SELECT * FROM DISHES WHERE DISH_NAME = ?";
			PreparedStatement stat1 = con.prepareStatement(select);
			stat1.setString(1, name);
		    ResultSet res = stat1.executeQuery();
		    res.next();
		    oldRate = res.getInt("RATE");
			
			String update = "UPDATE DISHES SET RATE = ? WHERE DISH_NAME = ? ;";
			PreparedStatement stat = con.prepareStatement(update);
			stat.setInt(1, rate+oldRate);
			stat.setString(2, name);
		    stat.executeUpdate();
		    this.rate = rate+oldRate;
		    
		    String insert = "INSERT INTO RATING VALUES (?, ?, ?);";
			PreparedStatement stat2 = con.prepareStatement(insert);
			stat2.setInt(1, user.getId());
			stat2.setInt(2, getId());
			stat2.setInt(3, rate);
		    stat2.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean isRatedBy(User user){
		boolean res = false;
		try {
			String select = "SELECT * FROM RATING WHERE USER_ID = ? AND DISH_ID = ?;";
			PreparedStatement stat = con.prepareStatement(select);
			stat.setInt(1, user.getId());
			stat.setInt(2, this.getId());
			ResultSet set = stat.executeQuery();
			if(set.next()){
				res = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int getRateBy(User user){
		int r = 0;
		try {
			String select = "SELECT * FROM RATING WHERE USER_ID = ? AND DISH_ID = ?;";
			PreparedStatement stat = con.prepareStatement(select);
			stat.setInt(1, user.getId());
			stat.setInt(2, this.getId());
			ResultSet set = stat.executeQuery();
			if(set.next()){
				r = set.getInt("RATE");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r;
	}
	
	public String getPicture(){
		return picture;
	}
	
	// amatebs bazashi
	public void add() {
		try {
			
			String sql = "INSERT INTO DISHES (DISH_NAME,RATE, AUTHOR, APPROVED, RECEIPT, PICTURE)" +
											  " VALUES (?, ?, ?, ?, ?, ? );";
			PreparedStatement stat = con.prepareStatement(sql);
			stat.setString(1, name);
			stat.setInt(2, rate);
			stat.setInt(3, authorId);
			stat.setInt(4, approved);
			stat.setString(5, receiptText);
			stat.setString(6, picture);
			stat.executeUpdate();
			insertIntoIngredients();
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.id = generateId();
	}
	
	public String getName(){
		return name;
	}
	
	public String getReceipt(){
		return receiptText;
	}	
	
	public void approve() {
		try {
			String sql = "UPDATE DISHES SET APPROVED = 1 WHERE DISH_ID = ? ;";
			PreparedStatement stat = con.prepareStatement(sql);
			stat.setInt(1, getId());
			stat.executeUpdate();
			approved = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int getApproved(){
		return approved;
	}
	
	public int getId(){
		return generateId();
	}
	public HashMap<Ingredient, String> getIngredients(){
		return  ingredients;
	}
	
	public void delete(){
		try {
			String deletefromdishes = "DELETE FROM DISHES WHERE DISH_ID = ? ;";
			PreparedStatement stat = con.prepareStatement(deletefromdishes);
			stat.setInt(1, this.id);
			stat.executeUpdate();
			
			String deletefromingredients = "DELETE FROM INGREDIENTS WHERE DISH_ID = ? ;";
			PreparedStatement stat1 = con.prepareStatement(deletefromingredients);
			stat1.setInt(1, this.id);
			stat1.executeUpdate();
			
			String deleteFromWishList = "DELETE FROM WISH_LIST WHERE DISH_ID = ? ;";
			PreparedStatement stat2 = con.prepareStatement(deleteFromWishList);
			stat2.setInt(1, this.id);
			stat2.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	private void insertIntoIngredients() throws SQLException{
		Iterator<Ingredient> in = ingredients.keySet().iterator();
		int id = getId();
		while(in.hasNext()){
			Ingredient tmp = in.next();
			String insert = "INSERT INTO INGREDIENTS VALUES (?, ?, ?);";
			PreparedStatement stat = con.prepareStatement(insert);
			stat.setInt(1, id);
			stat.setInt(2, tmp.getId());
			stat.setString(3, ingredients.get(tmp));
			stat.executeUpdate();
		}
	}

	@Override
	public boolean equals(Object obj) {
		boolean res = false;
		if(this.getId() == ((Dish)obj).getId()){
			res = true;
		}
		return res;
	}
	public static Dish getDish(String name){
		Dish result = null;
		try {
			String sql = "SELECT * FROM DISHES WHERE DISH_NAME = ? ;";
			PreparedStatement stat = MyDB.getConnection().prepareStatement(sql);
			stat.setString(1, name);
			ResultSet d = stat.executeQuery();
			d.next();
			int id = d.getInt("DISH_ID");
			HashMap<Ingredient, String> ingredients = getIngredientsFromDatabase(id);
			result = new Dish(name, d.getInt("RATE"), d.getInt("AUTHOR"), d.getInt("APPROVED"), d.getString("RECEIPT"), d.getString("PICTURE"), ingredients);
			result.setId(id);
			return result;
		} catch (SQLException e) {}
		return result;
	}
	

	public void setId(int id2) {
		this.id = generateId();
	}

	public static Collection<Dish> GetDishes(int approved){
		Collection<Dish> result = new ArrayList<Dish>();
		try {
			Connection con = MyDB.getConnection();
			String selectAll = "SELECT * FROM DISHES WHERE APPROVED = ? ;";
			PreparedStatement stat = con.prepareStatement(selectAll);
			stat.setInt(1, approved);
			ResultSet rows = stat.executeQuery();
			while(rows.next()){
				Dish tmp = getDish(rows.getString("DISH_NAME"));
				result.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static Collection<Dish> GetLastApprovedDishes(){
		Collection<Dish> result = new ArrayList<Dish>();
		try {
			Connection con = MyDB.getConnection();
			Statement stat = con.createStatement();
			String selectAll = "SELECT * FROM DISHES WHERE APPROVED = 1 ORDER BY DISH_ID DESC LIMIT 10;";
			ResultSet rows = stat.executeQuery(selectAll);
			while(rows.next()){
				Dish tmp = getDish(rows.getString("DISH_NAME"));
				result.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static Collection<Dish> getDishesByName(String name){
		Collection<Dish> result = new ArrayList<Dish>();
		try {
			Connection con = MyDB.getConnection();
			String selectAll = "SELECT * FROM DISHES WHERE APPROVED = 1 AND DISH_NAME like ?;";
			PreparedStatement stat = con.prepareStatement(selectAll);
			stat.setString(1, "%"+name+"%");
			ResultSet rows = stat.executeQuery();
			while(rows.next()){
				Dish tmp = getDish(rows.getString("DISH_NAME"));
				result.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static Collection<Dish> getDishesByIngredients(Collection<Ingredient> ingredients){
		Collection<Dish> result = new ArrayList<Dish>();
		MyMap<Dish, Integer> mapping = new MyMap<Dish, Integer>();
		try {
			Connection con = MyDB.getConnection();
			for(int i=0; i<ingredients.size(); i++){
				String name = ((ArrayList<Ingredient>)ingredients).get(i).getName();
				String selectForOne = "SELECT * FROM DISHES WHERE DISH_ID IN " + 
						"(SELECT DISTINCT DISH_ID FROM INGREDIENTS WHERE INGREDIENT_ID = "+ 
					"(SELECT INGREDIENT_ID FROM INGREDIENT WHERE INGREDIENT_NAME = ? ))";
				PreparedStatement stat = con.prepareStatement(selectForOne);
				stat.setString(1, name);
				ResultSet rows = stat.executeQuery();
				while(rows.next()){
					Dish tmp = getDish(rows.getString("DISH_NAME"));
					if(mapping.containsKey(tmp)){
						mapping.put(tmp, mapping.get(tmp)+1);
					}else{
						mapping.put(tmp, 1);
					}
				}
			}
			for(int i=0; i<mapping.keySet().size();i++){
				Dish tmp = mapping.keySet().get(i);
				if(mapping.get(tmp) == ingredients.size()){
					result.add(tmp);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static Collection<Dish> GetTopTenDishes(){
		Collection<Dish> result = new ArrayList<Dish>();
		try {
			Connection con = MyDB.getConnection();
			Statement stat = con.createStatement();
			String selectAll = "SELECT * FROM DISHES WHERE APPROVED = 1 ORDER BY RATE DESC LIMIT 10;";
			ResultSet rows = stat.executeQuery(selectAll);
			while(rows.next()){
				Dish tmp = getDish(rows.getString("DISH_NAME"));
				result.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static Collection<Dish> GetRandomTenDishes(){
		Collection<Dish> result = new ArrayList<Dish>();
		try {
			Connection con = MyDB.getConnection();
			Statement stat = con.createStatement();
			String selectAll = "SELECT * FROM DISHES WHERE APPROVED = 1 LIMIT 10;";
			ResultSet rows = stat.executeQuery(selectAll);
			while(rows.next()){
				Dish tmp = getDish(rows.getString("DISH_NAME"));
				result.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Collection<Dish> result1 = new ArrayList<Dish>();
		Random rand = new Random();
		HashSet<Integer> hs = new HashSet<Integer>();
		while(result1.size() != result.size()){
			int a = rand.nextInt(result.size());
			if(!hs.contains(a))result1.add(((ArrayList<Dish>)result).get(a));
			hs.add(a);
		}
		return result1;
	}
		
	public static String getName(int dish_id) {
		String res = "";
		Connection con = MyDB.getConnection();
		try {
			String select = "SELECT * FROM DISHES WHERE DISH_ID = ? ;";
			PreparedStatement stat = con.prepareStatement(select);
			stat.setInt(1, dish_id);
			ResultSet s = stat.executeQuery();
			s.next();
			res = s.getString("DISH_NAME");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	private static HashMap<Ingredient, String> getIngredientsFromDatabase(int id) throws SQLException{
		HashMap<Ingredient, String> res = new HashMap<Ingredient, String>();
		String sql = "SELECT * FROM INGREDIENTS WHERE DISH_ID = ? ;";
		PreparedStatement stat = MyDB.getConnection().prepareStatement(sql);
		stat.setInt(1, id);
		ResultSet s = stat.executeQuery();
		while(s.next()){
			int ingredient_id = s.getInt("INGREDIENT_ID");
			res.put(Ingredient.getIngredient(ingredient_id), s.getString("AMOUNT"));
		}
		return res;
	}

	public static void editDish(int editingDishId, String dishName, String recipeText, String pic, HashMap<Ingredient, String> ingredients2) {
		try {
			Connection con = MyDB.getConnection();
			String update = "UPDATE DISHES SET DISH_NAME = ?, RECEIPT = ?, PICTURE = ? WHERE DISH_ID = ? ;";
			PreparedStatement stat = con.prepareStatement(update);
			stat.setString(1, dishName);
			stat.setString(2, recipeText);
			stat.setString(3, pic);
			stat.setInt(4, editingDishId);
			stat.executeUpdate();
			
			String removeFromIngredients = "DELETE FROM INGREDIENTS WHERE DISH_ID = ? ;";
			PreparedStatement stat1 = con.prepareStatement(removeFromIngredients);
			stat1.setInt(1, editingDishId);
			stat1.executeUpdate();
			
			Iterator<Ingredient> it = ingredients2.keySet().iterator();
			while(it.hasNext()){
				Ingredient next = it.next();
				int ingrId = next.getId();
				String amount = ingredients2.get(next);
				String insertIntoIngredients = "INSERT INTO INGREDIENTS VALUES ( ?, ?, ? );";
				PreparedStatement stat2 = con.prepareStatement(insertIntoIngredients);
				stat2.setInt(1, editingDishId);
				stat2.setInt(2, ingrId);
				stat2.setString(3, amount);
				stat2.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
}