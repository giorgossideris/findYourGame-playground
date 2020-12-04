package java_files_FindYourGame;

public class Game {
    private int game_id;
    private int category_id;
    private String gamename;
    private int start_age;
    private int end_age;
    private int min_players;
    private int max_players;
    private int duration;
    private double rating_value;
    private String game_description;
    private int number_of_ratings;
//constructor
public Game(int game_id, int category_id, String gamename,int start_age,int end_age,int min_players,int max_players,int duration,double rating_value,String game_description,int number_of_ratings){
this.game_id=game_id;
this.category_id=category_id;
this.gamename=gamename;
this.start_age=start_age;
this.end_age=end_age;
this.min_players=min_players;
this.max_players=max_players;
this.duration=duration;
this.rating_value=rating_value;
this.game_description=game_description;
this.number_of_ratings=number_of_ratings;
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

public int getDuration() {
	return duration;
}

public void setDuration(int duration) {
	this.duration = duration;
}

public double getRating_value() {
	return rating_value;
}

public void setRating_value(double rating_value) {
	this.rating_value = rating_value;
}

public String getGame_description() {
	return game_description;
}

public void setGame_description(String game_description) {
	this.game_description = game_description;
}

public int getNumber_of_ratings() {
	return number_of_ratings;
}

public void setNumber_of_ratings(int number_of_ratings) {
	this.number_of_ratings = number_of_ratings;
}
@Override
public String toString() {
	return "Game [game_id=" + game_id + ", category_id=" + category_id + ", gamename=" + gamename + ", start_age="
			+ start_age + ", end_age=" + end_age + ", min_players=" + min_players + ", max_players=" + max_players
			+ ", duration=" + duration + ", rating_value=" + rating_value + ", game_description=" + game_description
			+ ", number_of_ratings=" + number_of_ratings + "]";
}



}