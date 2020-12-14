package java_files_FindYourGame;
import java.sql.*;

public class FavoriteDAO {
    
    public void addToFavorite(int user_id, int game_id) throws Exception {


        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        String addFavoriteSql = "INSER INTO favorite (game_id, user_id) VALUES (?, ?); UPDATE game SET favorite_counter = favorite_counter + 1 WHERE game_id = ?";   
        // it creates a new row in favorite and adds one to the favorite counter of the favorited game
        try {
            
            con = db.getConnection();

            stmt = con.prepareStatement(addFavoritSql);
            stmt.setInt(1, game_id);
            stmt.setString(2, student.getEmail());
            ResultSet rs = stmt.executeQuery();
 
            if (rs.next()) {
                rs.close();
                stmt.close();
                throw new Exception("AM or Email already exists");
            }

            rs.close();
            
            stmt = con.prepareStatement(sql);

            stmt.setString(1, student.getAm());
            stmt.setString(2, student.getName());
            stmt.setString(3, student.getSurname());
            stmt.setString(4, student.getEmail());
            stmt.setInt(5, student.getDepartmentId());

            stmt.executeUpdate();
            
            stmt.close();

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