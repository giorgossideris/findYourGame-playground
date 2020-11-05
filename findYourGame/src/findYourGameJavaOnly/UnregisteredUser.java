package findYourGameJavaOnly;

import java.util.Scanner;

public class UnregisteredUser extends User{
	
	public UnregisteredUser() {}
	
	@Override
    public boolean viewBasicMenu() { //returns true if the user want to stay in menu
        this.printBasicMenu();
        int choice = UnregisteredUser.takeChoice(5);
        boolean stayInMenu = this.executeBasicMenuChoice(choice);
        return stayInMenu;
    }
	
	@Override
	protected void printBasicMenu() {
		System.out.println("BASIC MENU");
        System.out.println("1) Show all games.");
        System.out.println("2) Search for a game.");
        System.out.println("3) Log in.");
        System.out.println("4) Sign up.");
        System.out.println("5) Leave page.");
	}
	
	@Override
	protected boolean executeBasicMenuChoice(int choice) { //choice is 1, 2, 3 or 4
		boolean stayInMenu = true;
		switch (choice) {
			case 1:
				this.navigateInGames(Game.allGames);
                break;
			case 2:
				MapOfGames searchResult = this.doSearch();
                this.navigateInGames(searchResult);
                break;
			case 3:
				RegisteredUser loggedInUser = this.doLogIn();
				boolean stayInRegisteredMenu = true;
				do {
					stayInRegisteredMenu = loggedInUser.viewBasicMenu();
				}while(stayInRegisteredMenu);
				break;
			case 4:
				RegisteredUser newUser = doSignUp();
				stayInRegisteredMenu = true;
				do {
					stayInRegisteredMenu = newUser.viewBasicMenu();
				}while(stayInRegisteredMenu);
				break;
			case 5:
				stayInMenu = false;
		}
		return stayInMenu;
	}
	
	@Override
	protected void accessGameOptions(Game gameToAccess) {
		gameToAccess.printGameDetails();
	}
	
	private RegisteredUser doLogIn() {
		String[] logInData;
		RegisteredUser loggedInUser;
		while (true) {
			logInData = readLogInData();
			loggedInUser = logIn(logInData[0], logInData[1]);
			if (loggedInUser != null) {
				return loggedInUser;
			}
		}
	}
	
	private String[] readLogInData() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Log in");
		String username = readInput("Enter username:");
		String password = readInput("Enter password:");
		String logInData[] = {username, password};
		return logInData;	
	}
	
	private RegisteredUser logIn(String username, String password) {
		RegisteredUser user;
		if (isUsernameUsed(username)) {
			user = RegisteredUser.registeredUsers.get(username);
			boolean isPasswordCorrect = (user.getPassword().equals(password));
			if (isPasswordCorrect) {
				return user;
			}
		}
		return null;
	}
	
	private RegisteredUser doSignUp() {
		System.out.println("Sign up");
		String username;
		do {
			username = readInput("Enter username:");
			if (isUsernameUsed(username));
				System.out.println("An other gamer uses this username! try another.");
		}while(isUsernameUsed(username));
		String password = readInput("Enter password:"); // A CHEck OF PASSWORD LENGTH SHOULD BE ADDED HERE
		RegisteredUser newUser = new RegisteredUser(username, password);
		return newUser;
	}
}