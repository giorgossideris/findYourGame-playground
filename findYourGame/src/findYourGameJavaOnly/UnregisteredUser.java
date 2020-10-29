package findYourGameJavaOnly;

import java.util.Scanner;

public class UnregisteredUser extends User{
	
	public UnregisteredUser() {}
	
	@Override
	protected void printBasicMenu() {
		System.out.println("BASIC MENU");
		System.out.println("1) Show all games.");
		System.out.println("2) Search for a game.");
		System.out.println("3) Log in.");
		System.out.println("4) Signup.");
	}
	
	@Override
	protected void executeChoice(int choice) { //choice is 1, 2, 3 or 4
		switch (choice) {
			case 1:
				doOptionShowAllGames();
				break;
			case 2:
				doOptionSearchForAGame();
				break;
			case 3:
				RegisteredUser loggedInUser = doLogIn();
				loggedInUser.viewBasicMenu();
				break;
			case 4:
				RegisteredUser newUser = doSignUp();
				newUser.viewBasicMenu();
				break;
		}
	}
	
	@Override
	protected void accessGameOptions(Game gameToAccess) {
		gameToAccess.printGameDetails();
	}
	
	private RegisteredUser doLogIn() {
		while (true) {
			String[] logInData = readLogInData();
			RegisteredUser loggedInUser = logIn(logInData[0], logInData[1]);
			if (loggedInUser != null) {
				return loggedInUser;
			}
		}
	}
	
	private String[] readLogInData() {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Log in");
		String username = readInput("Enter username:");
		//take password
		String password = readInput("Enter password:");
		String logInData[] = {username, password};
		return logInData;	
	}
	
	private RegisteredUser logIn(String username, String password) {
		if (isUsernameUsed(username)) {
			RegisteredUser user = RegisteredUser.registeredUsers.get(username);
			boolean isPasswordCorrect = (user.getPassword() == password);
			if (isPasswordCorrect) {
				return user;
			}
		}
		return null;
	}
	
	private RegisteredUser doSignUp() {
		System.out.println("Sign up");
		String username;
		boolean isUsernameValid = false;
		do {
			username = readInput("Enter username:");
			if (isUsernameUsed(username));
				System.out.println("An other gamer uses this username! try another.");
		}while(isUsernameUsed(username));
		String password = readInput("Enter password:");
		RegisteredUser newUser = new RegisteredUser(username, password);
		return newUser;
	}
}