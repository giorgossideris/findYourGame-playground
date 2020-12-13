package java_files_FindYourGame;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    
    public List<Category> getCategories() throws Exception {

		List<Category> categories =  new ArrayList<Category>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM category;";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();

			while(rs.next()) {

				categories.add( new Category(rs.getInt("category_id"), rs.getString("category_name")) );

			}

			rs.close();
			stmt.close();
			db.close();
			return categories;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

    }

    public Category getCategoryByID(int category_id) throws Exception {

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM category WHERE category_id=? ;";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setInt(1, category_id);

			rs = stmt.executeQuery();

			if (!rs.next()) {
				throw new Exception("Category with id: " + category_id + " not found");
			}

			Category department = new Category(rs.getInt("category_id"), rs.getString("category_name"));
			rs.close();
			stmt.close();
			db.close();

			return department;


		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

	} 
}