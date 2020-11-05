package findYourGameJavaOnly;

public class Comment {

	private String usernameWhoWrote;
	private String content;
	
	public Comment(String usernameWhoWrote, String content) {
		this.usernameWhoWrote = usernameWhoWrote;
		this.content = content;
	}

	public String getUserWhoWrote() {
		return usernameWhoWrote;
	}

	public void setUserWhoWrote(String usernameWhoWrote) {
		this.usernameWhoWrote = usernameWhoWrote;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
