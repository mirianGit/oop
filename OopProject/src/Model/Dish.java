package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

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
	
	private int generateId(){
		int res = -1;
		try {
			Statement stat = con.createStatement();
			String select = "SELECT * FROM DISHES WHERE DISH_NAME = '" + name + "';";
			ResultSet result = stat.executeQuery(select);
			result.next();
			res = result.getInt("DISH_ID");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.id = res;
		return res;
	}
	
	public String getPicture(){
		return picture;
	}
	
	// amatebs bazashi
	public void add() {
		try {
			Statement stat = con.createStatement();
			String sql = "INSERT INTO DISHES (DISH_NAME,RATE, AUTHOR, APPROVED, RECEIPT, PICTURE)" +
											  " VALUES ('" + name + "', "
														+ rate + ", "
														+ authorId + ", "
														+ approved + ", '"
														+ receiptText + "', '"
														+ picture + "');";
			stat.executeUpdate(sql);
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
	// returns id or -1 if such dish doesn't exist ot there's problem with database
	
	
	public void approve() {
		try {
			Statement stat = con.createStatement();
			String sql = "UPDATE DISHES SET APPROVED = 1 WHERE DISH_ID='" + getId() + "';";
			stat.executeUpdate(sql);
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
			Statement stat = con.createStatement();
			String deletefromdishes = "DELETE FROM DISHES WHERE DISH_ID = '" + this.id + "';";
			stat.executeUpdate(deletefromdishes);
			String deletefromingredients = "DELETE FROM INGREDIENTS WHERE DISH_ID = '" + this.id + "';";
			stat.executeUpdate(deletefromingredients);
			String deleteFromWishList = "DELETE FROM WISH_LIST WHERE DISH_ID = '" + this.id + "';";
			stat.executeUpdate(deleteFromWishList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	private void insertIntoIngredients() throws SQLException{
		Statement stat = con.createStatement();
		Iterator<Ingredient> in = ingredients.keySet().iterator();
		int id = getId();
		while(in.hasNext()){
			Ingredient tmp = in.next();
			String insert = "INSERT INTO INGREDIENTS VALUES (" + id + ", " + tmp.getId() + ", '" + ingredients.get(tmp) + "');";
			stat.executeUpdate(insert);
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
			Statement stat = MyDB.getConnection().createStatement();
			String sql = "SELECT * FROM DISHES WHERE DISH_NAME = '" + name + "';";
			ResultSet d = stat.executeQuery(sql);
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
			Statement stat = con.createStatement();
			String selectAll = "SELECT * FROM DISHES WHERE APPROVED = '" + approved + "';";
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
		
	public static String getName(int dish_id) {
		String res = "";
		Connection con = MyDB.getConnection();
		try {
			Statement stat = con.createStatement();
			String select = "SELECT * FROM DISHES WHERE DISH_ID = " + dish_id + ";";
			ResultSet s = stat.executeQuery(select);
			s.next();
			res = s.getString("DISH_NAME");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	private static HashMap<Ingredient, String> getIngredientsFromDatabase(int id) throws SQLException{
		HashMap<Ingredient, String> res = new HashMap<Ingredient, String>();
		Statement stat = MyDB.getConnection().createStatement();
		String sql = "SELECT * FROM INGREDIENTS WHERE DISH_ID = '" + id + "';";
		ResultSet s = stat.executeQuery(sql);
		while(s.next()){
			int ingredient_id = s.getInt("INGREDIENT_ID");
			res.put(Ingredient.getIngredient(ingredient_id), s.getString("AMOUNT"));
		}
		return res;
	}

	public static void editDish(int editingDishId, String dishName, String recipeText, HashMap<Ingredient, String> ingredients2) {
		try {
			Statement stat = MyDB.getConnection().createStatement();
			String update = "UPDATE DISHES SET DISH_NAME = '"+dishName+"', RECEIPT = '"+ recipeText +"' WHERE DISH_ID = '"+editingDishId+"';";
			stat.executeUpdate(update);
			String removeFromIngredients = "DELETE FROM INGREDIENTS WHERE DISH_ID ='" + editingDishId + "';";
			stat.executeUpdate(removeFromIngredients);
			Iterator<Ingredient> it = ingredients2.keySet().iterator();
			while(it.hasNext()){
				Ingredient next = it.next();
				int ingrId = next.getId();
				String amount = ingredients2.get(next);
				String insertIntoIngredients = "INSERT INTO INGREDIENTS VALUES ("+editingDishId+", "+ingrId+", '"+amount+"');";
				stat.executeUpdate(insertIntoIngredients);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

