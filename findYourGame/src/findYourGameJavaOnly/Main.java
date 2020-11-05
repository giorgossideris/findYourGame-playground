package findYourGameJavaOnly;

public class Main {
	 public static void loadObjects() {
		 GameCategory gameCategory = new GameCategory("Category1");
		 new Game("First", gameCategory, 0, 2, 6, "Just first game.");
		 new Game("Another game", gameCategory, 10, 4, 5, "Just second game.");
		 new RegisteredUser("george", "george123");
	 }

	 public static void main(String[] arrstring) {
		 boolean stayInPage = true;
		 Main.loadObjects();
	     UnregisteredUser unregisteredUser = new UnregisteredUser();
	     do {
	    	 stayInPage = unregisteredUser.viewBasicMenu();
	     } while(stayInPage);
	 }
}
