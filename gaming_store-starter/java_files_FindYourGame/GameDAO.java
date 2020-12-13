package java_files_FindYourGame;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GameDAO {
    public List<Game> getGames(String searchbar, int players, int age, int category, int duration) throws Exception{
        List <Game> list_of_games=new ArrayList<Game>();
        Connection con = null;		
		PreparedStatement stmt = null;
        ResultSet rs = null;
        DB db = new DB(); 
        


        String sqlQuery = "SELECT * FROM game WHERE min_players< ? and max_players> ? and category_id=? and duration= ?   searchbar LIKE '%?%';";
    
    try{
         

        con = db.getConnection();
        stmt=con.prepareStatement(sqlQuery);
        stmt.setInt(1,players);
        stmt.setInt(2,players);
        stmt.setInt(3,category);
        stmt.setInt(4,duration);
        rs= stmt.executeQuery();









        while(rs.next()){
            list_of_games.add( new Game(rs.getInt("game_id"),rs.getInt("category_id"),rs.getString("gamename"),rs.getInt("start_age"),rs.getInt("end_age"),rs.getInt("min_players"),rs.getInt("max_players"),rs.getInt("duration"),rs.getDouble("rating_value"),rs.getString("game_description"),rs.getInt("number_of_ratings")));
        }
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

    


}



