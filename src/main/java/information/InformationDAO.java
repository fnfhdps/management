package information;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatebaseUtil;

public class InformationDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//학생 정보 입력 메소드 (특정)
	public int infoInsert(InformationDTO information) { 
		String SQL = "INSERT INTO information VALUES (?, ?, ?, ?, ?, ?)";
		try {
			conn = DatebaseUtil.getConnection(); 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, information.getUserID());
			pstmt.setString(2, information.getMajor());
			pstmt.setString(3, information.getName());
			pstmt.setString(4, information.getPhone());
			pstmt.setString(5, information.getAddress());
			pstmt.setInt(6, information.getRoom());
			System.out.println("내 정보 입력 DB 연동 완료");
			return pstmt.executeUpdate(); 
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
			
		}
		return -1; 
	}
	
	//학생 정보 조회 메소드 (특정)
	public ArrayList<InformationDTO> infoShow(int userID){
		String SQL = "SELECT name, major, phone, address, room FROM information "
				+ "WHERE userID = ?";
		
		ArrayList<InformationDTO> show = new ArrayList<InformationDTO>();
		try {
			conn = DatebaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userID);
			rs = pstmt.executeQuery();
			 
			while(rs.next()) {
				InformationDTO information = new InformationDTO();
				information.setName(rs.getString(1));
				information.setMajor(rs.getString(2));
				information.setPhone(rs.getString(3));
				information.setAddress(rs.getString(4));
				information.setRoom(rs.getInt(5));
				show.add(information);
			}
			System.out.println("내 정보 조회 DB 연동 완료");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return show;	
	}

	//학생 정보 수정 메소드 (특정)
	public int infoUpdate(String name, String major, String phone, String address, int room, int userID) {
		String SQL = null;
		
		try {
			SQL = "UPDATE information SET "
					+ " name=?, major=?, phone=?, address=?, room=? WHERE userID=?";
			conn = DatebaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setString(2, major);
			pstmt.setString(3, phone);
			pstmt.setString(4, address);
			pstmt.setInt(5, room);
			pstmt.setInt(6, userID);
			System.out.println("내 정보 수정 DB 연동 완료");
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
			
		}
		return -1; 
	}
	
	//학생 정보 검색 메소드 (특정)
	public ArrayList<InformationDTO> getSearch(String search){
		ArrayList<InformationDTO> insearch = null;
		String SQL = "SELECT * FROM information ";
		try {
			if(!search.equals("")) {
				SQL += "WHERE ? IN(userID, major, name, phone, address, room)";
				//SQL = "SELECT * FROM information WHERE address like ?";
				conn = DatebaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, search);
				System.out.println("검색중");
			}
			else{
				conn = DatebaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				System.out.println("전체 검색");
				
			}
				rs = pstmt.executeQuery();
				insearch = new ArrayList<InformationDTO>();
			while(rs.next()) {
				InformationDTO info = new InformationDTO();
				info.setUserID(rs.getInt(1));
				info.setMajor(rs.getString(2));
				info.setName(rs.getString(3));
				info.setPhone(rs.getString(4));
				info.setAddress(rs.getString(5));
				info.setRoom(rs.getInt(6));
				insearch.add(info);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		System.out.println("DB 검색어 확인:"+search);
		System.out.println("학생 정보 검색 DB 연동 완료");
		return insearch;	
	}
}

