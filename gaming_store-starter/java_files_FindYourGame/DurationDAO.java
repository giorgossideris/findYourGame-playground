package java_files_FindYourGame;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DurationDAO {
    
    public List<Duration> getDurations() throws Exception {

		List<Duration> durations =  new ArrayList<Duration>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT duration_value FROM duration;";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();

			while(rs.next()) {

				durations.add( new Duration(rs.getString("duration_value")) );

			}

			rs.close();
			stmt.close();
			db.close();
			return durations;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

    }

    public Duration getDurationByID(int duration_id) throws Exception {

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT duration_value FROM duration WHERE duration_id=?;";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			stmt.setInt(1, duration_id);

			rs = stmt.executeQuery();

			if (!rs.next()) {
				throw new Exception("Duration with id: " + duration_id + " not found");
			}

			Duration duration = new Duration(rs.getString("duration_value"));
			rs.close();
			stmt.close();
			db.close();

			return duration;


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