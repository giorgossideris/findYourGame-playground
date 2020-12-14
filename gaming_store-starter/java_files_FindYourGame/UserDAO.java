package java_files_FindYourGame;

import java.sql.ResultSet;
import java.sql.*;

public class UserDAO {
    
	public User authenticate(String username, String password) throws Exception{
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM registered_user WHERE username=? AND password=?;";

		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, username);
			stmt.setString(2, password);
			rs = stmt.executeQuery();

			if (rs.next()) {

				return new User(rs.getInt("registered_user_id"), rs.getString("username"), rs.getString("password"), rs.getString("email"));

			}

			rs.close();
			stmt.close();
			db.close();
			throw new Exception("Wrong username or password");

		}catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			try {

				db.close();

            } catch (Exception e) {

			}
		}

    }
    
    public User registerUser(String username, String email, String password) throws Exception{
        
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        String sqlQuery = "SELECT * FROM registered_user WHERE username=? OR email=?;";
        ResultSet rs = null;

        try {
            con = db.getConnection();
            stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, username);
			stmt.setString(2, email);
			rs = stmt.executeQuery();

            if (rs.next()) {
                String message = "";
                if (rs.getString("username") == username) {
                    message += "Username" + username + "already exists.";
                }
                if (rs.getString("email") == email) {
                    message += "Email" + email + "already exists.";
                }

                throw new Exception(message);
            }

            rs.close();
            String sqlUpdate = "INSERT INTO registered_user (username, password, email) VALUES (?,?,?);";
            stmt = con.prepareStatement(sqlUpdate);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, email);
            stmt.executeUpdate();

            stmt.close();
            db.close();

            return new User(username, password, email);

        }catch(Exception e) {

            throw new Exception(e.getMessage());

        }finally {

            try {
                db.close();
            }catch (Exception e){

            }
            
        }
    }
}