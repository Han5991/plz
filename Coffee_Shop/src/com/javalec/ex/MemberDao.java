package com.javalec.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	// 알림띄울때 int값 리턴
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;

	// 싱글톤
	private static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
	}

	public MemberDao() {

	}

// 아이디 중복 확인 
	public int confirmId(String id) {
		int ri = 0;

		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from user_member where id=?";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery(); // 쿼리문으로 조회 후 값을 set에 저장
			if (set.next()) {// set에 아이디 데이터가 있으면 1, 없으면 0
				ri = MemberDao.MEMBER_EXISTENT; //
			} else {
				ri = MemberDao.MEMBER_NONEXISTENT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close(); // 사용된 커넥션 풀안에 있는 커넥션을 끊고 다른 유저가 사용할수있게끔 비워둠.
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return ri; // 위에서 받은 값을 다 ri에 주었기 떄문에 리턴값은 ri가 된다
	}
	
// join.jsp에서 넘어온 회원정보(dto) 디비에 저장시키기.
	public int insertMember(MemberDto dto) {
		int ri = 0;

		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into user_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, dto.getName()); //joinOk.jsp에서 <jsp:useBean>으로 dto 잡아줬음
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail1());
			pstmt.setString(5, dto.getEmail2());
			pstmt.setString(6, dto.getBirthdate());
			pstmt.setString(7, dto.getTel());
			pstmt.setString(8, dto.getPostcode());
			pstmt.setString(9, dto.getOrder_list());
			pstmt.setString(10, dto.getBankname());
			pstmt.setString(11, dto.getAccount_no());
			pstmt.setString(12, dto.getCardname());
			pstmt.setString(13, dto.getCard_no1());
			pstmt.setString(14, dto.getCard_no2());
			pstmt.setString(15, dto.getCard_no3());
			pstmt.setString(16, dto.getCard_no4());
			pstmt.setString(17, dto.getExp_month());
			pstmt.setString(18, dto.getExp_year());
			ri = MemberDao.MEMBER_JOIN_SUCCESS; // 1
			// 값 대입이 완료된 쿼리문을 디비로 날리기
			pstmt.executeUpdate();


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	

	private Connection getConnection() {
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;

		try {
			// context: 현재 작동되고 있는 내 프로그램.
			context = new InitialContext();
			// ""경로에 있는 걸 dataSource를 구하기 위한 과정
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			// dataSource를 커넥션에 연결시켜줌.
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
