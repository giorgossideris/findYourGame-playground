package java_files_FindYourGame;

public class Duration {
    private int duration_id;
    private String duration_name;


public Duration(int duration_id, String duration_name) {
	this.duration_id = duration_id;
	this.duration_name = duration_name;
}

public int getDuration_id() {
	return duration_id;
}

public void setDuration_id(int duration_id) {
	this.duration_id = duration_id;
}

public String getDuration_name() {
	return duration_name;
}

public void setDuration_name(String duration_name) {
	this.duration_name = duration_name;
}
}
