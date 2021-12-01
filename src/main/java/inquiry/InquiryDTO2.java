package inquiry;
public class InquiryDTO2 {
	
	private int num;
	private int userID; 
	private String write;
	private String currentDay;
	private String comment;
	private String commentime;
	private String name;
	private int room;
	
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	
	public InquiryDTO2() {
	}
	
	public InquiryDTO2(int num, int userID, String write,
			String currentDay, String comment,
			String commentime, String name, int room) {
		super();
		this.num = num;
		this.userID = userID;
		this.write = write;
		this.currentDay = currentDay;
		this.comment = comment;
		this.commentime = commentime;
		this.name = name;
		this.room = room;
	}
}
