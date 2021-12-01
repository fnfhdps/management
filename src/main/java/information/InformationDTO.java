package information;

public class InformationDTO {

	private int userID;
	private String major;
	private String name;
	private String phone;
	private String address;
	private int room;
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	
	public InformationDTO() {
	}
	
	public InformationDTO(int userID, String major, String name,
			String phone, String address, int room) {
		super();
		this.userID = userID;
		this.major = major;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.room = room;
	}
}
