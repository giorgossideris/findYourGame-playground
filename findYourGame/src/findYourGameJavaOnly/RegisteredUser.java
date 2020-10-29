package findYourGameJavaOnly;

import java.util.Map;
import java.util.HashMap;

public class RegisteredUser extends User{
	
	private String username, password;
	private Map<String, Integer> userRatings = new HashMap<>();
	public static Map<String, RegisteredUser> registeredUsers = new HashMap<>();

	public RegisteredUser(String username, String password) {
		this.username = username;
		this.password = password;
		registeredUsers.put(username, this);
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	protected void printBasicMenu() {
		System.out.println("BASIC MENU");
		System.out.println("1) Show all games.");
		System.out.println("2) Search for a game.");
		System.out.println("3) Log out.");
	}
	
	@Override
	protected void executeChoice(int choice) { // choice is 1, 2, 3 or 4
		switch (choice) {
		case 1:
			doOptionShowAllGames();
			break;
		case 2:
			doOptionSearchForAGame();
			break;
		case 3:
			//LOG OUT TO ADD
			break;
		}
	}
	
	public void makeRating(Game game, int rating) {
		game.rateGame(rating);
		this.userRatings.put(game.getName(), rating);
	}
	
}