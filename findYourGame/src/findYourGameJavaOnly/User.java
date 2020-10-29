package findYourGameJavaOnly;

import java.util.Scanner;

public abstract class User {

	public void viewBasicMenu() {
		printBasicMenu();
		int choice = takeChoice();
		executeChoice(choice);
	}
	
	protected abstract void printBasicMenu();
	
	protected abstract void executeChoice(int choice);
	
	protected abstract void accessGameOptions(Game gameToAccess);
	
	protected void doOptionShowAllGames() { //refers to the option of the basic menu "Show all games."
		boolean keepNavigating;
		do {
			keepNavigating = navigateInGames(Game.allGames);
		} while(keepNavigating);
	}
	
	protected boolean navigateInGames(MapOfGames games) {
		games.printAll();
		Game chosenGame = games.chooseGame();
		if (chosenGame != null) {
			accessGameOptions(chosenGame);
			return true;
		} else {
			return false;
		}
	}
	protected void doOptionSearchForAGame() { //refers to the option ofthe basic menu "Search for a game."
		MapOfGames games = Game.searchGame(); //TO BE MADE
		boolean keepNavigating;
		do {
			keepNavigating = navigateInGames(games);
		} while(keepNavigating);
	}
	
	protected static int takeChoice() {
		Scanner sc = new Scanner(System.in);
		while (true) {
			String choice = sc.nextLine();
			int checked = checkChoice(4, choice); // 4 in parameters because of 4 choices
			if (checked != -1) {
				return checked;
			}
		}
	}
	
	protected static int checkChoice(int numberOfChoices, String choice) { // returns the choice if it is valid, else -1
		try {
			int intChoice = Integer.parseInt(choice);
			if (intChoice >= 1 && intChoice <= numberOfChoices) {
				return intChoice;
			}
			return -1;
		} catch (NumberFormatException n) {
			return -1;
		}
	}
	
	public static String readInput(String requestMessage) {
		Scanner sc = new Scanner(System.in);
		System.out.println(requestMessage);
		String input = sc.nextLine();
		return input;
	}
	
	protected boolean isUsernameUsed(String username) {
		return  RegisteredUser.registeredUsers.containsKey(username);
	}
	
}
