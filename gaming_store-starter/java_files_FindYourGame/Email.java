package java_files_FindYourGame;

public class Email {
    private int email_id;
    private String email_value;
	public Email(int email_id, String email_value) {
		
		this.email_id = email_id;
		this.email_value = email_value;
    }
    
    public Email( String email_value) {
		
		this.email_value = email_value;
    }


	@Override
	public String toString() {
		return "Category [email_id=" + email_id + ", email_value=" + email_value + "]";
	}
	public int getEmail_id() {
		return email_id;
	}
	public void setEmail_id(int email_id) {
		this.email_id = email_id;
	}
	public String getEmail_value() {
		return email_value;
	}
	public void setEmail_value(String email_value) {
		this.email_value = email_value;
	}


}