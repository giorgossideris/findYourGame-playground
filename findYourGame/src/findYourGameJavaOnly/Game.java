package findYourGameJavaOnly;

import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

public class Game {
	
	private int lowerAge, minPlayers, maxPlayers;
	private Rating totalRating = new Rating(); //MAY HAVE TO INITIALIZE INSIDE CONSTRUCTOR
	private String name, description;
	private GameCategory category;
	private ArrayList<Comment> comments = new ArrayList<>();
	public static MapOfGames allGames = new MapOfGames();
	
	public Game(String name, GameCategory category, int lowerAge,
			int minPlayers, int maxPlayers, String description) {
		this.name = name;
		this.category = category;
		this.lowerAge = lowerAge;
		this.minPlayers = minPlayers;
		this.maxPlayers = maxPlayers;
		this.description = description;
		allGames.put(this.name, this);
	}

	public int getLowerAge() {
		return lowerAge;
	}


	public void setLowerAge(int lowerAge) {
		this.lowerAge = lowerAge;
	}


	public int getMinPlayers() {
		return minPlayers;
	}


	public void setMinPlayers(int minPlayers) {
		this.minPlayers = minPlayers;
	}


	public int getMaxPlayers() {
		return maxPlayers;
	}


	public void setMaxPlayers(int maxPlayers) {
		this.maxPlayers = maxPlayers;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public GameCategory getCategory() {
		return category;
	}


	public void setCategory(GameCategory category) {
		this.category = category;
	}


	public static MapOfGames searchGame() { //HAVE TO STUDY STREAMS FOR THIS ONE
		
	}
	
	public void commentGame(RegisteredUser userWhoWrote, String content) {
		Comment newComment = new Comment(userWhoWrote, content);
		comments.add(newComment);
	}
	
	public void rateGame(int newRating) {
		this.totalRating.considerNewRating(newRating);
	}
	
	public static void showAllGames() {
		allGames.printAll();
	}
	
	public void printGameDetails() {
		System.out.println("Name:" + this.getName());
		System.out.println("REST DETAILS");
	}
}
