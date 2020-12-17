package java_files_FindYourGame;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

public class GameDAO {
    public List<Game> getGames(Search_fields search_items) throws Exception{
        List <Game> list_of_games=new ArrayList<Game>();
        Connection con = null;		
		PreparedStatement stmt = null;
        ResultSet rs = null;
        DB db = new DB();
        String name = search_items.getSearch_bar();
        int players = search_items.getPlayers();
        int age = search_items.getAge();
        int category_id = search_items.getCategory_id();
        int duration_id = search_items.getDuration_id();
        boolean isNameSearched = !name.equals(""), 
                isPlNumberSearched = players != -1,
                isAgeSearched = age != -1,
                isCategorySearched = category_id != -1,
                isDurationSearched = duration_id != -1;
        
        String searchQuery = createSearchQuery(isNameSearched, isPlNumberSearched, isAgeSearched, isCategorySearched, isDurationSearched);
    

    try{
        con = db.getConnection();
        stmt=con.prepareStatement(searchQuery);
        int counter = 1;
        if (isNameSearched){
            stmt.setString(counter++,name);
        }
        if (isPlNumberSearched) {
            stmt.setInt(counter++, players);
            stmt.setInt(counter++, players);
        }
        if (isAgeSearched) {
            stmt.setInt(counter++ ,age);
            stmt.setInt(counter++ ,age);
        }
        if (isCategorySearched) {
            stmt.setInt(counter++,category_id);
        }
        if (isDurationSearched) {
            stmt.setInt(counter++ ,duration_id);
        }

        rs= stmt.executeQuery();


        while(rs.next()){

            
            list_of_games.add( new Game(rs.getInt("game_id"), rs.getInt("category_id"),rs.getString("gamename"),rs.getInt("start_age"),rs.getInt("end_age"),
            rs.getInt("min_players"),rs.getInt("max_players"),rs.getInt("duration_id"),rs.getDouble("rating_value"),rs.getString("photo_path")));        }
        rs.close();
        stmt.close();
        db.close();
        return list_of_games;
    }   catch(Exception e){
        throw new Exception (e.getMessage());
    } finally{
        try {
            db.close();
        } catch (Exception e) { 
            throw new Exception(e.getMessage());
        }
    }
    }

    private String createSearchQuery(boolean isNameSearched, boolean isPlNumberSearched, boolean isAgeSearched,
                                     boolean isCategorySearched, boolean isDurationSearched) throws Exception{
        String searchQuery = "SELECT game_id, category_id, gamename,start_age,end_age, min_players, max_players," +
        " duration_id, rating_value, photo_path FROM game"; // basic sql query
        String nameFilter = "locate(?, gamename) > 0",
               plNumberFilter = "min_players<= ? AND max_players>= ?",
               ageFilter = "start_age<=? and end_age>= ?",
               categoryFilter = "category_id= ?",
               durationFilter = "duration_id= ?";
        List<String> filters = new ArrayList<String>(Arrays.asList(nameFilter, plNumberFilter, ageFilter, 
                                                                   categoryFilter, durationFilter));
        List<Boolean> isSearched = new ArrayList<Boolean>(Arrays.asList(isNameSearched, isPlNumberSearched, isAgeSearched, 
                                                                        isCategorySearched, isDurationSearched));
        boolean isFirst = true;
        for(int i = 0; i < filters.size(); i++){
            if(isSearched.get(i)) {
				if (isFirst) {
                    searchQuery += " WHERE ";
                    isFirst = false;
                }else {
                    searchQuery += " AND ";
                }
				searchQuery += filters.get(i);
			} 
        }
        searchQuery += ";";
        return searchQuery;
    }
    
    public List<Game> getTopRatedGames() throws Exception { //returns the top 5 best rated games

        List<Game> topRatedGames =  new ArrayList<Game>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
        String sqlQuery = "SELECT game_id, category_id, gamename,start_age,end_age, min_players, max_players," +
                          " duration_id, rating_value, photo_path FROM game ORDER BY rating_value DESC LIMIT 5;";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();

			while(rs.next()) {

				topRatedGames.add(new Game(rs.getInt("game_id"),rs.getInt("category_id"),rs.getString("gamename"),rs.getInt("start_age"),rs.getInt("end_age"),
                rs.getInt("min_players"),rs.getInt("max_players"),rs.getInt("duration_id"),rs.getDouble("rating_value"),rs.getString("photo_path"))); 
			}

			rs.close();
			stmt.close();
			db.close();
			return topRatedGames;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}


    } //End of getTopRatedGames

    public List<Game> getMostFavorite() throws Exception { // returns the top 3 most favorited games

        List<Game> mostFavoriteGames =  new ArrayList<Game>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlQuery = "SELECT * FROM game ORDER BY favorite_counter DESC LIMIT 3;";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();

			while(rs.next()) {

				mostFavoriteGames.add(new Game(rs.getInt("game_id"),rs.getString("gamename"),rs.getString("photo_path"),rs.getDouble("rating_value")  )); 
			}

			rs.close();
			stmt.close();
			db.close();
			return mostFavoriteGames;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}


	} //End of getMostFavoriteGames





}



