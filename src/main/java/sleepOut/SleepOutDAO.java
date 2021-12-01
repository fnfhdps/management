package sleepOut;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatebaseUtil;

public class SleepOutDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//학생 외박 등록 메소드 (특정) 
	public int outInsert(SleepOutDTO sleepOut) { 
		String SQL = "INSERT INTO sleepout VALUES"
				+ "(NULL, ((select date_format(now(), '%Y-%m-%d'))), ?, ?, ?, ?, NULL)";
		try {
			conn = DatebaseUtil.getConnection(); 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, sleepOut.getUserID());
			pstmt.setString(2, sleepOut.getStartDay());
			pstmt.setString(3, sleepOut.getEndDay());
			pstmt.setString(4, sleepOut.getReason());
			System.out.println("내 외박 신청 DB 연동 완료");
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
	
	//학생 외출 조회 메소드 (특정)
	public ArrayList<SleepOutDTO> outMyList(int userID){
		String SQL = "SELECT currentDay, startDay, endDay, reason, ok "
				+ "FROM sleepout WHERE userID = ?";
		ArrayList<SleepOutDTO> list = new ArrayList<SleepOutDTO>();
		try {
				conn = DatebaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, userID);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					SleepOutDTO sleepout = new SleepOutDTO();
					sleepout.setCurrentDay(rs.getString(1));
					sleepout.setStartDay(rs.getString(2));
					sleepout.setEndDay(rs.getString(3));
					sleepout.setReason(rs.getString(4));
					sleepout.setOk(rs.getString(5));
					list.add(sleepout);
				}
				System.out.println("내 외박 등록 조회 DB 연동 완료");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return list;	
	}
	
	//학생 외출 조회 메소드 (전체)
	public ArrayList<SleepOutDTO> outAllList(){
		String SQL = "SELECT * FROM sleepout";
		
		ArrayList<SleepOutDTO> list = new ArrayList<SleepOutDTO>();
		try {
				conn = DatebaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					SleepOutDTO sleepout = new SleepOutDTO();
					sleepout.setNumID(rs.getInt(1));
					sleepout.setCurrentDay(rs.getString(2));
					sleepout.setUserID(rs.getInt(3));
					sleepout.setStartDay(rs.getString(4));
					sleepout.setEndDay(rs.getString(5));
					sleepout.setReason(rs.getString(6));
					sleepout.setOk(rs.getString(7));
					list.add(sleepout);
				}
				System.out.println("학생 외출 조회 DB 연동 완료");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return list;	
	}
	
	//학생 외출 승인 메소드 (특정)
	public int outUpdate(String ok, int numID) { 
		String SQL = "UPDATE sleepout SET ok = ? WHERE numID = ?";

		try {
			conn = DatebaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ok);
			pstmt.setInt(2, numID);
			System.out.println("학생 외출 승인 DB 연동 완료");
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
}

