package java_files_FindYourGame;


public class Search_fields {

    private String search_bar;
    private int players; 

	private int age; 

    private int category_id; 
    private int duration_id; 
   
    
    
    
    
	public Search_fields(String search_bar, int players, int age, int category_id, int duration_id) {
		this.search_bar = search_bar;
		this.players = players;
		this.age = age;
		this.category_id = category_id;
		this.duration_id = duration_id;
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
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public int getDuration_id() {
		return duration_id;
	}
	public void setDuration_id(int duration_id) {
		this.duration_id = duration_id;
	}
	 @Override
		public String toString() {
			return "Search fields [search_bar=" + search_bar + ", players=" + players + ", age=" + age + ", category_id=" + category_id
					+ ", duration_id=" + duration_id + "]";
		}
    
}