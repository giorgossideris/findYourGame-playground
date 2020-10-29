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
	
	public void put(String gameName, Game game) {
		this.put(gameName, game);
	}
	
	public void printAll() {
		for (Game game : this.games.values())  
            System.out.println(game.getName());
	}
	
	public Game chooseGame() {
		while (true) {
			String gameName = User.readInput("Enter the name of the game /n"
					+ "or enter to go back to basic menu:");
			if (gameName.equals("")) {
				return null;
			} else if (this.games.containsKey(gameName)) {
				return this.games.get(gameName);
			}
		}
	}
}