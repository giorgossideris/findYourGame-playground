package findYourGameJavaOnly;

import java.util.TreeSet; // TreeSet is a sorted Set that doesn't allows duplicates

public class GameCategory {

	private String categoryName;
	public static TreeSet<GameCategory> categories = new TreeSet<GameCategory>();
	
	public GameCategory(String categoryName) throws IllegalArgumentException {
		if (getCategoryByName(categoryName) != null) {
			throw new IllegalArgumentException();
		}
		this.categoryName = categoryName;
		categories.add(this);
	}
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	@Override
	public String toString() {
		return categoryName;
	}
	
	@Override
	public int hashCode() { //Set is used so hashCode override must be necessary
	    return this.categoryName.hashCode();
	}

	public GameCategory getCategoryByName(String categoryName) {
		for (GameCategory gc : categories) {
			if (gc.getCategoryName().equals(categoryName)) {
				return gc;
			}
		}
		return null;
	}
}
