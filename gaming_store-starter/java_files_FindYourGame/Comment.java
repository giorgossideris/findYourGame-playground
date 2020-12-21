package java_files_FindYourGame;

public class Comment {
    private int commented_game_id, commenting_user_id;
    private String comment_text;

    public Comment(int commented_game_id, int commenting_user_id, String comment_text) { // not sure if needed
        this.commented_game_id = commented_game_id;
        this.commenting_user_id = commenting_user_id;
        this.comment_text = comment_text;
    }

    public Comment(int commenting_user_id, String comment_text) {
        this.commenting_user_id = commenting_user_id;
        this.comment_text = comment_text;
    }

    public int getCommented_game_id() {
        return commented_game_id;
    }
    
    public void setCommented_game_id(int commented_game_id) {
        this.commented_game_id = commented_game_id;
    }

    public int getCommenting_user_id() {
        return commenting_user_id;
    }
    
    public void setCommenting_user_id(int commenting_user_id) {
        this.commenting_user_id = commenting_user_id;
    }

    public String getComment_text() {
        return comment_text;
    }
    
    public void setComment_text(String comment_text) {
        this.comment_text = comment_text;
    }
    
}