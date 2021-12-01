package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatebaseUtil;

public class UserDAO {//데이터 접근 객체
	
	//로그인 메소드
	public int login(int userID, String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userID = ?"; //쿼리문
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatebaseUtil.getConnection(); //자바와 DB를 연결하는 클래스
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userID);
			rs = pstmt.executeQuery(); //검색함수
			System.out.println("로그인 DB 연동 완료");
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}
				else {
					return 0; //비밀번호 틀림
				}
			}
			return -1; //아이디 없음
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
			
		}
		return -2; //데이터베이스 오류
	}
	
	//회원가입 메소드
	public int join(UserDTO user) { 
		String SQL = "INSERT INTO user VALUES (?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatebaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			System.out.println("회원가입 DB 연동 완료");
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
			
		}
		return -1; //회원가입 실패
	}
}
