package findYourGameJavaOnly;

import java.util.ArrayList;

public class Game {
	
	private int minAge, minPlayers, maxPlayers;
	private Rating totalRating = new Rating(); //MAY HAVE TO INITIALIZE INSIDE CONSTRUCTOR
	private String name, description;
	private GameCategory category;
	private ArrayList<Comment> comments = new ArrayList<>();
	public static MapOfGames allGames = new MapOfGames();
	
	public Game(String name, GameCategory category, int minAge,
			int minPlayers, int maxPlayers, String description) {
		this.name = name;
		this.category = category;
		this.minAge = minAge;
		this.minPlayers = minPlayers;
		this.maxPlayers = maxPlayers;
		this.description = description;
		allGames.put(this.name, this);
	}

	public int getMinAge() {
		return minAge;
	}


	public void setMinAge(int minAge) {
		this.minAge = minAge;
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

	public Rating getTotalRating() {
	    return this.totalRating;
	}

	public void setTotalRating(Rating totalRating) {
	    this.totalRating = totalRating;
	}

	public ArrayList<Comment> getComments() {
	    return this.comments;
	}

	public void setComments(ArrayList<Comment> comments) {
	    this.comments = comments;
	}
	
	public void commentGame(String username, String content) {
		Comment newComment = new Comment(username, content);
		this.comments.add(newComment);
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
	

    public boolean isGameSearched(String searchedName, int searchedMinAge, int searchedPlayersNumber) {
        boolean isMinAgeOk = (searchedMinAge == -1 || searchedMinAge >= this.minAge);
        boolean isPlayersNumberOk = (searchedPlayersNumber == -1 || searchedPlayersNumber >= this.minPlayers && searchedPlayersNumber <= this.maxPlayers);
        return (this.name.contains(searchedName) && isMinAgeOk && isPlayersNumberOk);
    }
}

