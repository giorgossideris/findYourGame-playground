package java_files_FindYourGame;

public class Favorite {
    private int favorite_user_id /* the user who has a favorite game */, favorite_game_id;


    public Favorite(int favorite_user_id, int favorite_game_id) {
        this.favorite_user_id = favorite_user_id;
        this.favorite_game_id = favorite_game_id;
    }

    public int getFavorite_user_id() {
        return favorite_user_id;
    }

    public void setFavorite_user_id(int favorite_user_id) {
        this.favorite_game_id = favorite_user_id;
    }

    public int getFavorite_game_id() {
        return favorite_game_id;
    }

    public void setFavorite_game_id(int favorite_game_id) {
        this.favorite_game_id = favorite_game_id;
    }
}
