package com.javalec.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	// �븣由쇰쓣�슱�븣 int媛� 由ы꽩
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;

	// �떛湲��넠
	private static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
	}

	public MemberDao() {

	}

// �븘�씠�뵒 以묐났 �솗�씤 
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
			set = pstmt.executeQuery(); // 荑쇰━臾몄쑝濡� 議고쉶 �썑 媛믪쓣 set�뿉 ���옣
			if (set.next()) {// set�뿉 �븘�씠�뵒 �뜲�씠�꽣媛� �엳�쑝硫� 1, �뾾�쑝硫� 0
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
				connection.close(); // �궗�슜�맂 而ㅻ꽖�뀡 ���븞�뿉 �엳�뒗 而ㅻ꽖�뀡�쓣 �걡怨� �떎瑜� �쑀��媛� �궗�슜�븷�닔�엳寃뚮걫 鍮꾩썙�몺.
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return ri; // �쐞�뿉�꽌 諛쏆� 媛믪쓣 �떎 ri�뿉 二쇱뿀湲� �뻹臾몄뿉 由ы꽩媛믪� ri媛� �맂�떎
	}
	
// join.jsp�뿉�꽌 �꽆�뼱�삩 �쉶�썝�젙蹂�(dto) �뵒鍮꾩뿉 ���옣�떆�궎湲�.
	public int insertMember(MemberDto dto) {
		int ri = 0;

		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into user_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, dto.getName()); //joinOk.jsp�뿉�꽌 <jsp:useBean>�쑝濡� dto �옟�븘以ъ쓬
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getEmail1());
			pstmt.setString(7, dto.getEmail2());
			pstmt.setString(8, dto.getBirthdate());
			pstmt.setString(9, dto.getTel());
			pstmt.setString(10, dto.getPostcode());
			pstmt.setString(11, dto.getBankname());
			pstmt.setString(12, dto.getAccount_no());
			pstmt.setString(13, dto.getCardname());
			pstmt.setString(14, dto.getCard_no1());
			pstmt.setString(15, dto.getCard_no2());
			pstmt.setString(16, dto.getCard_no3());
			pstmt.setString(17, dto.getCard_no4());
			pstmt.setString(18, dto.getExp_month());
			pstmt.setString(19, dto.getExp_year());
			pstmt.setString(20, dto.getOrder_list());
			
			ri = MemberDao.MEMBER_JOIN_SUCCESS; // 1
			// 媛� ���엯�씠 �셿猷뚮맂 荑쇰━臾몄쓣 �뵒鍮꾨줈 �궇由ш린
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
			// context: �쁽�옱 �옉�룞�릺怨� �엳�뒗 �궡 �봽濡쒓렇�옩.
			context = new InitialContext();
			// ""寃쎈줈�뿉 �엳�뒗 嫄� dataSource瑜� 援ы븯湲� �쐞�븳 怨쇱젙
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			// dataSource瑜� 而ㅻ꽖�뀡�뿉 �뿰寃곗떆耳쒖쨲.
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
