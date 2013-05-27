package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Ingredient {
	private int id = -1;
	private Connection con = MyDB.getConnection();

	// aqac dish-is msgavsad
	public Ingredient(String name, String picture) {
		try {
			addToDatabase(name, picture);
		} catch (SQLException e) {
			System.out.println("problems with inserting ingredient!");
		}
	}
	
	// amatebs bazashi
	private void addToDatabase(String name, String picture) throws SQLException{
		Statement stat = con.createStatement();
		String select = "SELECT * FROM INGREDIENT WHERE INGREDIENT_NAME = '" + name + "';";
		ResultSet s = stat.executeQuery(select);
		if(!s.next()){
			String insert = "INSERT INTO INGREDIENT (INGREDIENT_NAME, PICTURE) VALUES ('" + name + "', " + picture + "');";
			stat.executeQuery(insert);
		}
	}
	
	public int getId(){
		return id;
	}
	
	// unda abrunebdes ukve bazashi arsebul ingredientis obieqts
	public static Ingredient getIngredient(int ingredient_id) {
		Ingredient result = null;
		try {
			Statement stat = MyDB.getConnection().createStatement();
			String select = "SELECT * FROM INGREDIENT WHERE INGREDIENT_ID = " + ingredient_id + ";";
			ResultSet s = stat.executeQuery(select);
			if(s.next()){
				result = new Ingredient(s.getString("INGREDIENT_NAME"), s.getString("PICTURE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
