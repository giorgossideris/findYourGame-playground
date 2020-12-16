package java_files_FindYourGame;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmailDAO {
    public void add_email(String email_value) throws Exception {
		DB db = new DB();
        Connection con = null;
        ResultSet rs = null; 
		PreparedStatement stmt= null; 
        String sqlQuery = "SELECT * FROM email where email_value=?;";
		String sqlQuery1 = "INSERT INTO email (email_value) VALUES (?);";

		try{

            con = db.getConnection();
            stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1,email_value);
		
            rs = stmt.executeQuery();

            if(rs.next()){ 
				rs.close();
				stmt.close();
                throw new Exception("email already registered bro");
            }
			rs.close();

			stmt=con.prepareStatement(sqlQuery1);
			stmt.setString(1,email_value);
		
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