package user;

public class UserDTO { 
	
	private int userID;
	private String userPassword;
	
	//마우스 오른쪽 소스->제너레잇 게터 앤 세터->모두 체크
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public UserDTO() {
	}
	
	public UserDTO(int userID, String userPassword) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
	}
}
