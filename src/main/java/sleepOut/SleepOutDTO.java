package sleepOut;

public class SleepOutDTO {

	private int numID;
	private String currentDay;
	private int userID;
	private String startDay;
	private String endDay;
	private String reason;
	private String ok;
	
	public int getNumID() {
		return numID;
	}
	public void setNumID(int numID) {
		this.numID = numID;
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
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getOk() {
		return ok;
	}
	public void setOk(String ok) {
		this.ok = ok;
	}
	
	public SleepOutDTO() {
	}
	
	public SleepOutDTO(int numID, String currentDay, int userID,
			String startDay, String endDay, String reason, String ok) {
		super();
		this.numID = numID;
		this.currentDay = currentDay;
		this.userID = userID;
		this.startDay = startDay;
		this.endDay = endDay;
		this.reason = reason;
		this.ok = ok;
	}
}
	
	