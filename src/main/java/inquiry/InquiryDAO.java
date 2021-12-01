package inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatebaseUtil;

public class InquiryDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//학생 문의사항 입력 메소드 (특정)
	public int quiryInsert(int userID, String write) { 
		String SQL = "insert into inquiry values(null, ?, ?,"
				+ " (select date_format(now(), '%Y-%m-%d')), null, null)";
	
		try {
			conn = DatebaseUtil.getConnection(); 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userID);
			pstmt.setString(2, write);
			System.out.println("내 문의사항 입력 DB 연동 완료");
			return pstmt.executeUpdate(); //레코드의 갯수만큼 반환
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}

		}
		return -1; 
	}
	
	//관리자 문의사항 조회 메소드 (전체)
	public ArrayList<InquiryDTO2> quiryShow(){
		String SQL = "select inquiry.num, inquiry.currentDay, information.name,"
				+ " information.room, inquiry.write, inquiry.comment from inquiry"
				+ " left outer join information on inquiry.userID = information.userID";
		
		//"SELECT num, currentDay, userID, `write`, comment FROM inquiry";
		//이대로하면 간단하지만 이름값과 방번호를 출력할 수 없다. 때문에 새로운 DTO파일을 만들어서 외부조인을 해주었다.
		ArrayList<InquiryDTO2> qshow = new ArrayList<InquiryDTO2>();
		try {
				conn = DatebaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					InquiryDTO2 inquiry = new InquiryDTO2(); 
					inquiry.setNum(rs.getInt(1));
					inquiry.setCurrentDay(rs.getString(2));
					inquiry.setName(rs.getString(3));
					inquiry.setRoom(rs.getInt(4));
					inquiry.setWrite(rs.getString(5));
					inquiry.setComment(rs.getString(6));
					qshow.add(inquiry);
				}
				System.out.println("학생 문의사항 조회 DB 연동 완료");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return qshow;	
	}
	
	//관리자 답변 메소드 (특정)
	public int quiryUpdate(String comment, int num) { 
		String SQL = "UPDATE inquiry SET comment = ?, commentime = (SELECT now()) WHERE num = ?";

		try {
			conn = DatebaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, comment);
			pstmt.setInt(2, num);
			System.out.println("학생 답변 등록 DB 연동 완료");
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
	
	//학생 문의사항 조회 메소드 (특정)
	public ArrayList<InquiryDTO> quiryShow(int userID){
		String SQL = "SELECT `write`, comment, commentime FROM inquiry WHERE userID = ?";
		//만들고보니 write라는 테이블 명이 sql 키워드명이어서 계속 오류가 났다 사용시 esc 밑 `로 감싸줘야 사용이 가능하다.
		
		ArrayList<InquiryDTO> qshow = new ArrayList<InquiryDTO>();
		try {
			conn = DatebaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userID);
			rs = pstmt.executeQuery();
			 
			while(rs.next()) {
				InquiryDTO inquiry = new InquiryDTO();
				inquiry.setWrite(rs.getString(1));
				inquiry.setComment(rs.getString(2));
				inquiry.setCommentime(rs.getString(3));
				qshow.add(inquiry);
			}
			System.out.println("내 문의사항 조회 DB 연동 완료");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return qshow;	
	}
}
