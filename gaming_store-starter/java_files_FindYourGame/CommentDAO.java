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
			stmt.setInt(1, game_id);
			rs = stmt.executeQuery();
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

		List<Comment> twoComments =  new ArrayList<Comment>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT registered_user_id, comment_text FROM comment WHERE game_id = ? LIMIT 2;";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setInt(1, game_id);
			rs = stmt.executeQuery();
			while(rs.next()) {
				
				twoComments.add( new Comment(rs.getInt("registered_user_id"), rs.getString("comment_text")) );
			}

			rs.close();
			stmt.close();
			db.close();
			return twoComments;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

	}
	public List<Comment> getOneCommentOfGame(int game_id) throws Exception {

		List<Comment> oneComment =  new ArrayList<Comment>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT registered_user_id, comment_text FROM comment WHERE game_id = ? LIMIT 1;";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setInt(1, game_id);
			rs = stmt.executeQuery();
			while(rs.next()) {
				
				oneComment.add( new Comment(rs.getInt("registered_user_id"), rs.getString("comment_text")) );
			}

			rs.close();
			stmt.close();
			db.close();
			return oneComment;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

	}
	public void add_comment(String comment_text, int game_id, int registered_user_id) throws Exception {
		DB db = new DB();
        Connection con = null;
		PreparedStatement stmt= null; 
		String sqlQuery1 = "INSERT INTO comment (comment_text,game_id,registered_user_id) VALUES (?,?,?);";

		try{
            con = db.getConnection();
            stmt = con.prepareStatement(sqlQuery1);
			stmt=con.prepareStatement(sqlQuery1);
			stmt.setString(1,comment_text);
			stmt.setInt(2,game_id);
			stmt.setInt(3,registered_user_id);

			stmt.executeUpdate();
			stmt.close();

        }catch(Exception e){
            throw new Exception(e.getMessage());
        }finally{
            try{
                db.close();
            }catch(Exception e){
                throw new Exception(e.getMessage());
            }
        }


		
		
	}//end of register








}




