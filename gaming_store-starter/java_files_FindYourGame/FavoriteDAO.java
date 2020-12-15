package java_files_FindYourGame;
import java.sql.*;

public class FavoriteDAO {
    
    public void addToFavorite(int user_id, int game_id) throws Exception {


        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        String addFavoriteSql = "INSERT INTO favorite (game_id, registered_user_id) VALUES (?, ?);";   
        // it creates a new row in favorite
        String addToCounterSql = "UPDATE game SET favorite_counter = favorite_counter + 1 WHERE game_id = ?";
        //adds one to the favorite counter of the favorited game
        try {
            
            con = db.getConnection();

            stmt = con.prepareStatement(addFavoriteSql);
            stmt.setInt(1, game_id);
            stmt.setInt(2, user_id);

            stmt.executeUpdate();
            
            stmt = con.prepareStatement(addToCounterSql);
            stmt.setInt(1, game_id);

            stmt.executeUpdate();
            
            stmt.close();
            con.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }

    }

    public void removeFromFavorite(int user_id, int game_id) throws Exception {


        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        String removeFavoriteSql = "DELETE FROM favorite WHERE game_id = ? AND registered_user_id = ?;";   
        // it removes row in favorite
        String subtractFromCounterSql = "UPDATE game SET favorite_counter = favorite_counter - 1 WHERE game_id = ?;";
        //is subtracts one from the favorite counter of the favorited game  

        try {
            
            con = db.getConnection();

            stmt = con.prepareStatement(removeFavoriteSql);
            stmt.setInt(1, game_id);
            stmt.setInt(2, user_id);

            stmt.executeUpdate();
            
            stmt = con.prepareStatement(subtractFromCounterSql);
            stmt.setInt(1, game_id);

            stmt.executeUpdate();
            
            stmt.close();
            con.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }

    }

    public boolean isGameFavorite(int game_id, int user_id) throws Exception {

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM favorite WHERE game_id = ? AND registered_user_id = ?;";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
            stmt.setInt(1, game_id);
            stmt.setInt(2, user_id);

			rs = stmt.executeQuery();

			if (!rs.next()) {
				return false;
			}

			rs.close();
			stmt.close();
			db.close();

			return true;


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