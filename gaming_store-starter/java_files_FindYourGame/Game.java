package java_files_FindYourGame;

public class Game {
    private int game_id;
    private int category_id;
    private String gamename;
    private int start_age;
    private int end_age;
    private int min_players;
    private int max_players;
    private int duration_id;
    private double rating_value;
    private String game_long_description;
	private int number_of_ratings;
	private String photo_path;
	private String game_short_description;
	private int favorite_counter;
//constructor
public Game(int game_id, int category_id, String gamename,int start_age,int end_age,int min_players,int max_players,
int duration_id,double rating_value,String game_long_description,int number_of_ratings,String photo_path,String game_short_description,int favorite_counter){
this.game_id=game_id;
this.category_id=category_id;
this.gamename=gamename;
this.start_age=start_age;
this.end_age=end_age;
this.min_players=min_players;
this.max_players=max_players;
this.duration_id=duration_id;
this.rating_value=rating_value;
this.game_long_description=game_long_description;
this.number_of_ratings=number_of_ratings;
this.photo_path=photo_path;
this.game_short_description=game_short_description;
this.favorite_counter=favorite_counter;
}

public Game(int game_id, int category_id, String gamename, int start_age, int end_age, int min_players, int max_players,
int duration_id, double rating_value, String photo_path) {
this.game_id = game_id;
this.category_id = category_id;
this.gamename = gamename;
this.start_age = start_age;
this.end_age = end_age;
this.min_players = min_players;
this.max_players = max_players;
this.duration_id = duration_id;
this.rating_value = rating_value;
this.photo_path = photo_path;
}

public Game(int game_id, String gamename, String photo_path) {
	this.game_id = game_id;
	this.gamename = gamename;
	this.photo_path = photo_path;
}

/* Getters & Setters */



public int getGame_id() {
return game_id;
}

public void setGame_id(int game_id) {
	this.game_id = game_id;
}   

public int getCategory_id() {
	return category_id;
}

public void setCategory_id(int category_id) {
	this.category_id = category_id;
}

public String getGamename() {
	return gamename;
}

public void setGamename(String gamename) {
	this.gamename = gamename;
}

public int getStart_age() {
	return start_age;
}

public void setStart_age(int start_age) {
	this.start_age = start_age;
}

public int getEnd_age() {
	return end_age;
}

public void setEnd_age(int end_age) {
	this.end_age = end_age;
}

public int getMin_players() {
	return min_players;
}

public void setMin_players(int min_players) {
	this.min_players = min_players;
}

public int getMax_players() {
	return max_players;
}

public void setMax_players(int max_players) {
	this.max_players = max_players;
}

public int getDuration_id() {
	return duration_id;
}

public void setDuration_id(int duration_id) {
	this.duration_id = duration_id;
}

public double getRating_value() {
	return rating_value;
}

public void setRating_value(double rating_value) {
	this.rating_value = rating_value;
}

public String getGame_long_description() {
	return game_long_description;
}

public void setgame_long_description(String game_long_description) {
	this.game_long_description = game_long_description;
}

public int getNumber_of_ratings() {
	return number_of_ratings;
}

public void setNumber_of_ratings(int number_of_ratings) {
	this.number_of_ratings = number_of_ratings;
}

public String getPhoto_path() {
	return photo_path;
}

public void setPhoto_path(String photo_path) {
	this.photo_path = photo_path;
}

public String getGame_short_description() {
	return game_short_description;
}

public void setGame_short_description(String game_short_description) {
	this.game_short_description = game_short_description;
}

public int getFavorite_counter() {
	return favorite_counter;
}

public void setFavorite_counter(int favorite_counter) {
	this.favorite_counter = favorite_counter;
}
@Override
public String toString() {
	return "Category [game_id=" + game_id + ", category_id=" + category_id + ", gamename=" + gamename
			+ ", start_age=" + start_age + ", end_age=" + end_age + ", min_players=" + min_players
			+ ", max_players=" + max_players + ", duration_id=" + duration_id + ", rating_value=" + rating_value
			+ ", game_long_description=" + game_long_description + ", number_of_ratings=" + number_of_ratings
			+ ", photo_path=" + photo_path + ", game_short_description=" + game_short_description
			+ ", favorite_counter=" + favorite_counter + "]";
}

}