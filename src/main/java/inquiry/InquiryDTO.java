package inquiry;
public class InquiryDTO {
	
	private int num;
	private int userID; 
	private String write;
	private String currentDay;
	private String comment;
	private String commentime;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCurrentDay() {
		return currentDay;
	}
	public void setCurrentDay(String currentDay) {
		this.currentDay = currentDay;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getWrite() {
		return write;
	}
	public void setWrite(String write) {
		this.write = write;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCommentime() {
		return commentime;
	}
	public void setCommentime(String commentime) {
		this.commentime = commentime;
	}
	
	public InquiryDTO() {
	}
	
	public InquiryDTO(int num, String currentDay, int userID,
			String write, String comment, String commentime) {
		super();
		this.num = num;
		this.currentDay = currentDay;
		this.userID = userID;
		this.write = write;
		this.comment = comment;
		this.commentime = commentime;
	}
}
