package com.javalec.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	// �˸���ﶧ int�� ����
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;

	// �̱���
	private static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
	}

	public MemberDao() {

	}

// ���̵� �ߺ� Ȯ�� 
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
			set = pstmt.executeQuery(); // ���������� ��ȸ �� ���� set�� ����
			if (set.next()) {// set�� ���̵� �����Ͱ� ������ 1, ������ 0
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
				connection.close(); // ���� Ŀ�ؼ� Ǯ�ȿ� �ִ� Ŀ�ؼ��� ���� �ٸ� ������ ����Ҽ��ְԲ� �����.
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return ri; // ������ ���� ���� �� ri�� �־��� ������ ���ϰ��� ri�� �ȴ�
	}
	
// join.jsp���� �Ѿ�� ȸ������(dto) ��� �����Ű��.
	public int insertMember(MemberDto dto) {
		int ri = 0;

		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into user_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, dto.getName()); //joinOk.jsp���� <jsp:useBean>���� dto �������
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
			// �� ������ �Ϸ�� �������� ���� ������
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
			// context: ���� �۵��ǰ� �ִ� �� ���α׷�.
			context = new InitialContext();
			// ""��ο� �ִ� �� dataSource�� ���ϱ� ���� ����
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			// dataSource�� Ŀ�ؼǿ� ���������.
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
