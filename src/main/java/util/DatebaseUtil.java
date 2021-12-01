package util;
 
import java.sql.Connection;
import java.sql.DriverManager;
 
public class DatebaseUtil {
     public static Connection getConnection() { //데이터베이스와 연결상태 관리
         try {
                   String dbURL = "jdbc:mysql://localhost:3306/management?"
                   		+ "characterEncoding=UTF-8&serverTimezone=UTC";
                   String dbID ="root";
                   String dbPassword="kimjisu12"; //내 db비번
                   Class.forName("com.mysql.cj.jdbc.Driver"); //jdbc드라이버를 불러온다.
                   return DriverManager.getConnection(dbURL, dbID, dbPassword);
                   //mysql에 연결하기 위한 커넥션 정보
         } catch (Exception e) {
             e.printStackTrace();
         }
         return null;
     }
}
 
