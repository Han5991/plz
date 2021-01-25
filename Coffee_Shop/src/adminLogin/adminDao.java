package adminLogin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import com.javalec.ex.MemberDao;


public class adminDao {
	
	private static adminDao instance = new adminDao();

	public static adminDao getInstance() {
		return instance;
	}
	
	//관리자 로그인 확인 
	public int adminCheck(String id, String pw) {
		String dbpw ;
		int result=0;  
		Connection con = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String query = "select pw from admin where id=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpw = rs.getString("pw");
				if (dbpw.equals(pw)) {
					if (id.equals("admin")) {
						result = 2; //  admin login success
					}/* else {
						result = 1; // login success
					}*/
				} else {
					result = 0; // 비번 틀림
				}
			} else {
				result = -1; //  id 틀림 
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return result;
	}
		
		
	private Connection getConnection() {
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;

		try {
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

	
}






















