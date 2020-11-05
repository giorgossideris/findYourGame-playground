package findYourGameJavaOnly;

import java.util.HashMap;
import java.util.Map;

public class RegisteredUser extends User {
    private String username;
    private String password;
    private Map<String, Integer> userRatings = new HashMap<String, Integer>();
    public static Map<String, RegisteredUser> registeredUsers = new HashMap<String, RegisteredUser>();

    public RegisteredUser(String username, String password) {
        this.username = username;
        this.password = password;
        registeredUsers.put(username, this);
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean viewBasicMenu() {
        this.printBasicMenu();
        int choice = takeChoice(3);
        boolean stayInBasicMenu = executeBasicMenuChoice(choice);
        return stayInBasicMenu;
    }

    protected void printBasicMenu() {
        System.out.println("BASIC MENU");
        System.out.println("1) Show all games.");
        System.out.println("2) Search for a game.");
        System.out.println("3) Log out.");
    }

    protected boolean executeBasicMenuChoice(int choice) {
        boolean stayInBasicMenu = true;
        switch (choice) {
            case 1: {
                this.navigateInGames(Game.allGames);
                break;
            }
            case 2: {
                MapOfGames searchResult = doSearch();
                this.navigateInGames(searchResult);
                break;
            }
            case 3: {
                stayInBasicMenu = false;
            }
        }
        return stayInBasicMenu;
    }

    protected void accessGameOptions(Game game) {
        int choice;
        boolean stayInGameOptions;
        game.printGameDetails();
        do {
            this.printGameMenu();
            choice = RegisteredUser.takeChoice(3);
            stayInGameOptions = this.executeGameMenuChoice(choice, game);
        } while (stayInGameOptions);
    }

    private void printGameMenu() {
        System.out.println("1) Rate game.");
        System.out.println("2) Comment game.");
        System.out.println("3) Go back.");
    }

    private boolean executeGameMenuChoice(int choice, Game game) {
    	boolean stayInGameMenu;
        switch (choice) {
            case 1:
                this.rateGame(game);
                stayInGameMenu = true;
                break;
            case 2:
                this.commentGame(game);
                stayInGameMenu = true;
            default: 
            	stayInGameMenu = false;
        }
        return stayInGameMenu;
    }

    private void rateGame(Game game) {
        boolean validValueInserted = false;
        if (this.userRatings.containsKey(game.getName())) {
            System.out.println("You have already rated this game.");
            return;
        }
        String strRating = RegisteredUser.readInput((String)"How would you rate the game (1-10)? \n(enter if you want to go back)");
        do {
            if (strRating != "") {
                int intRating = RegisteredUser.checkInput(1, 11, strRating);
                if (intRating != -1) {
                    this.applyRating(game, intRating);
                    validValueInserted = true;
                } else {
                	strRating = RegisteredUser.readInput((String)"Insert a valid value:");
                }
            } else {
            	validValueInserted = true;
            }
        } while (!validValueInserted);
    }

    public void applyRating(Game game, int rating) {
        game.rateGame(rating);
        this.userRatings.put(game.getName(), rating);
    }

    private void commentGame(Game game) {
        String comment = RegisteredUser.readInput((String)"Type your comment: \n(enter if you want to go back)");
        if (comment != "") {
            game.commentGame(this.username, comment);
        }
    }
}