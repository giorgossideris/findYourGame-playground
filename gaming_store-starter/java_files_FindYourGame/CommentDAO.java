package java_files_FindYourGame;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    
    public List<Comment> getAllCommentsOfGame(int game_id) throws Exception {

		List<Comment> allComments =  new ArrayList<Comment>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT registered_user_id, comment_text FROM comment WHERE game_id = ?;";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();
            stmt.setInt(1, game_id);
			while(rs.next()) {

				allComments.add( new Comment(rs.getInt("registered_user_id"), rs.getString("comment_text")) );

			}

			rs.close();
			stmt.close();
			db.close();
			return allComments;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

    }

    public List<Comment> getTwoCommentsOfGame(int game_id) throws Exception {

		List<Comment> allComments =  new ArrayList<Comment>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT registered_user_id, comment_text FROM comment WHERE game_id = ? LIMIT 2;";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();
            stmt.setInt(1, game_id);
			while(rs.next()) {

				allComments.add( new Comment(rs.getInt("registered_user_id"), rs.getString("comment_text")) );

			}

			rs.close();
			stmt.close();
			db.close();
			return allComments;

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