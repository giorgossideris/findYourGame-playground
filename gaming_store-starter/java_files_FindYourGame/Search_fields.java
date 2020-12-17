package java_files_FindYourGame;


public class Search_fields {

    private String search_bar;
    private int players; 

	private int age; 

    private int category; 
    private int duration; 
   
    
    
    
    
	public Search_fields(String search_bar, int players, int age, int category, int duration) {
		this.search_bar = search_bar;
		this.players = players;
		this.age = age;
		this.category = category;
		this.duration = duration;
	}
	public String getSearch_bar() {
		return search_bar;
	}
	public void setSearch_bar(String search_bar) {
		this.search_bar = search_bar;
	}
	public int getPlayers() {
		return players;
	}
	public void setPlayers(int players) {
		this.players = players;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	 @Override
		public String toString() {
			return "Category [search_bar=" + search_bar + ", players=" + players + ", age=" + age + ", category=" + category
					+ ", duration=" + duration + "]";
		}
    
}