package findYourGameJavaOnly;

import java.util.Scanner;

public abstract class User {
    public abstract boolean viewBasicMenu();

    protected abstract void printBasicMenu();

    protected abstract boolean executeBasicMenuChoice(int choice);

    protected abstract void accessGameOptions(Game game);

    protected void navigateInGames(MapOfGames mapOfGames) {
        mapOfGames.printAll();
        if (mapOfGames.games.isEmpty()) {
        	return; //bread the function if the mapOfGames is empty
        }
        boolean returnInBasicMenu = false;
        Game chosenGame;
        do {
        	chosenGame = mapOfGames.chooseGame();
            if (chosenGame != null) {
                this.accessGameOptions(chosenGame);
            }else {
            	returnInBasicMenu = true;
            }
        } while (!returnInBasicMenu);
    }

    protected static int takeChoice(int numberOfChoices) {
        Scanner sc = new Scanner(System.in);
        String strChoice;
        int checkedChoice;
        boolean validInputInserted = false;
        do {
        	strChoice = sc.nextLine();
        	checkedChoice = User.checkInput(1, numberOfChoices + 1, strChoice);
        	if (checkedChoice != -1) {
        		validInputInserted = true;
        	} else {
        		System.out.println("Invalid input. Try again.");
        	}
        } while (!validInputInserted);
        return checkedChoice;
    }

    protected static int checkInput(int lowEnd, int highEnd, String strInput) { // returns true if lowEnd <= intInput < highEnd else false
        try {
            int intInput = Integer.parseInt(strInput);
            if (intInput >= lowEnd && intInput < highEnd) {
                return intInput;
            }
            return -1;
        }
        catch (NumberFormatException numberFormatException) {
            return -1;
        }
    }

    public static String readInput(String message) {
        Scanner sc = new Scanner(System.in);
        System.out.println(message);
        String input = sc.nextLine();
        return input;
    }

    protected boolean isUsernameUsed(String username) {
        return RegisteredUser.registeredUsers.containsKey(username);
    }

    protected MapOfGames doSearch() {
        System.out.println("Search");
        String searchedName = this.readSearchedName();
        int searchedMinAge = this.readSearchedMinAge();
        int searchedPlayersNumber = this.readSearchedPlayersNumber();
        MapOfGames searchResult = this.searchGame(searchedName, searchedMinAge, searchedPlayersNumber);
        return searchResult;
    }

    private String readSearchedName() {
        return User.readInput("What is the name of the game you want to search? \nPress enter to move on");
    }

    private int readSearchedMinAge() {
        boolean validInputInserted = false;
        int intMinAge, searchedMinAge = 0;
        String strMinAge;
        do {
            strMinAge = User.readInput("What is the minimum age you want to search? \nPress enter to move on");
            if (strMinAge.equals("")) {
                searchedMinAge = -1;
                validInputInserted = true;
            } else {
            	intMinAge = User.checkInput(0, 151, strMinAge);
            	if (intMinAge != -1) {
            		searchedMinAge = intMinAge;
            		validInputInserted = true;
            	} else {
            		System.out.println("Invalid input, try again.");
            	}
            }
        } while (!validInputInserted);
        return searchedMinAge;
    }

    private int readSearchedPlayersNumber() {
        boolean validInputInserted = false;
        int intPlayersNumber, searchedPlayersNumber = 0;
        String strPlayersNumber;
        do {
            strPlayersNumber = User.readInput("How many gamers will play? \nPress enter to move on");
            if (strPlayersNumber.equals("")) {
                searchedPlayersNumber = -1;
                validInputInserted = true;
            } else {
            	intPlayersNumber = User.checkInput(0, 101, strPlayersNumber);
            	if (intPlayersNumber != -1) {
            		searchedPlayersNumber = intPlayersNumber;
            		validInputInserted = true;
            	} else {
            		System.out.println("Invalid input, try again.");
            	}	
            }
        } while (!validInputInserted);
        return searchedPlayersNumber;
    }

    private MapOfGames searchGame(String gameName, int minAge, int playersNumber) {
        MapOfGames searchResult = new MapOfGames();
        Game.allGames.getGames().values().stream()
        								 .filter(game -> game.isGameSearched(gameName, minAge, playersNumber))
        								 .forEach(game -> searchResult.put(game.getName(), game));
        return searchResult;
    }
}
