package findYourGameJavaOnly;

public class Comment {

	private RegisteredUser userWhoWrote;
	private String content;
	
	public Comment(RegisteredUser userWhoWrote, String content) {
		this.userWhoWrote = userWhoWrote;
		this.content = content;
	}

	public RegisteredUser getUserWhoWrote() {
		return userWhoWrote;
	}

	public void setUserWhoWrote(RegisteredUser userWhoWrote) {
		this.userWhoWrote = userWhoWrote;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
