package findYourGameJavaOnly;

import java.util.HashMap;
import java.util.Map;

public class MapOfGames {
	
	private static int counter = 0;
	private int id;
	public Map<String, Game> games;
	
	public MapOfGames() {
		this.id = counter++;
		this.games = new HashMap<>();
	}
	public MapOfGames(Map<String, Game> games) {
		this.id = counter++;
		this.games = games;
	}
	
	 public Map<String, Game> getGames() {
	    return this.games;
	 }
	
	public void put(String gameName, Game game) {
		this.games.put(gameName, game);
	}
	
	public void printAll() {
		if (this.games.isEmpty()) {
	        System.out.println("No games found");
	    } else {
	        for (Game game : this.games.values()) {
	        	System.out.println(game.getName());
	        }
	    }
	}
	
	public Game chooseGame() {
		String gameName;
		boolean validInputInserted = false;
		Game chosenGame = null;
		do {
			gameName = User.readInput("Enter the name of the game \n"
					+ "or enter to go back to basic menu:");
			if (gameName.equals("")) {
				//chosenGame equals null at this moment
				validInputInserted = true;
			} else if (this.games.containsKey(gameName)) {
				chosenGame = this.games.get(gameName);
				validInputInserted = true;
			}
		} while(!validInputInserted);
		return chosenGame;
	}
}