package com.javalec.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	// alert ���곌린 ����.
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;

	// �깃���
	private static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
	}

	public MemberDao() {

	}

	// ���쇳�� ���대�� 議댁�� ��臾� ����
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
			set = pstmt.executeQuery(); // 荑쇰━臾몄�쇰� 議고�� �� 媛��� set�� ����
			if (set.next()) {// set�� ���대�� �곗�댄�곌� ���쇰㈃ 1, ���쇰㈃ 0
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
				connection.close(); // �ъ�⑸�� 而ㅻ�μ�� ������ ���� 而ㅻ�μ���� ��怨� �ㅻⅨ ����媛� �ъ�⑺������寃��� 鍮�����.
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return ri; // ������ 諛��� 媛��� �� ri�� 二쇱��湲� ��臾몄�� 由ы�닿��� ri媛� ����
	}

// join.jsp���� ���댁�� ������蹂�(dto) ��鍮��� ���μ���ㅺ린.
	public int insertMember(MemberDto dto) {
		int ri = 0;

		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into user_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, dto.getName());
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

	// 濡�洹몄�명���� ���깅�� id, pwd瑜� ��鍮��� ��議� �� ��蹂� 媛��몄�ㅺ린.
	public int userCheck(String id, String pwd) {
		int ri = 0;
		String dbPwd;

		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select pwd from user_member where id=?";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();

			if (set.next()) { // �대�� id�� ��蹂닿� ���ㅻ㈃
				dbPwd = set.getString("pwd");
				if (dbPwd.equals(pwd)) { // ���ν�� pwd�� ��鍮� pwd媛� �쇱���硫�
					ri = MemberDao.MEMBER_LOGIN_SUCCESS; // 1
				} else { // ���ν�� pwd媛� �ㅻⅤ�ㅻ㈃
					ri = MemberDao.MEMBER_LOGIN_PW_NO_GOOD; // 0
				}
			} else { // �대�� id�� ��蹂닿� ���ㅻ㈃
				ri = MemberDao.MEMBER_LOGIN_IS_NOT; // -1 ������ ������.
			}


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (set != null) {
					set.close();
				}
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

	public MemberDto getMember(String id) {
		MemberDto dto = null;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select * from user_member where id=?";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();

			//set���� ��蹂닿� ���ㅻ㈃ ���μ��耳���
			if (set.next()) {
				dto = new MemberDto();
				dto.setName(set.getString("name"));
				dto.setId(set.getString("id"));
				dto.setPwd(set.getString("pwd"));
				dto.setAddress1(set.getString("address1"));
				dto.setAddress2(set.getString("address2"));
				dto.setEmail1(set.getString("email1"));
				dto.setEmail2(set.getString("email2"));
				dto.setBirthdate(set.getString("birthdate"));
				dto.setTel(set.getString("tel"));
				dto.setPostcode(set.getString("postcode"));
				dto.setBankname(set.getString("bankname"));
				dto.setAccount_no(set.getString("account_no"));
				dto.setCardname(set.getString("cardname"));
				dto.setCard_no1(set.getString("card_no1"));
				dto.setCard_no2(set.getString("card_no2"));
				dto.setCard_no3(set.getString("card_no3"));
				dto.setCard_no4(set.getString("card_no4"));
				dto.setExp_month(set.getString("exp_month"));
				dto.setExp_year(set.getString("exp_year"));
				dto.setOrder_list(set.getString("order_list"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
			
		}
		return dto;
	}

	
	public int updateMember(MemberDto dto) { 
		int ri = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		// ResultSet set= null;
		String query = "update user_member set pwd=?,address1=?,address2=?,email1=?,email2=?,postcode=? ,birthdate=?,tel=?,"
				+ "bankname=?, account_no=?,cardname=?, card_no1=? ,card_no2=?, "
				+ "card_no3=?,card_no4=? , exp_month=?, exp_year=?"
				+ " where id=? "; 

		try { 

			con = getConnection();
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getAddress1());
			pstmt.setString(3, dto.getAddress2());
			pstmt.setString(4, dto.getEmail1());
			pstmt.setString(5, dto.getEmail2());
			pstmt.setString(6, dto.getPostcode());
			
			pstmt.setString(7, dto.getBirthdate());
			pstmt.setString(8, dto.getTel());
			pstmt.setString(9, dto.getBankname());
			pstmt.setString(10, dto.getAccount_no());
			pstmt.setString(11, dto.getCardname());
			pstmt.setString(12, dto.getCard_no1());
			pstmt.setString(13, dto.getCard_no2());
			pstmt.setString(14, dto.getCard_no3());
			pstmt.setString(15, dto.getCard_no4());
			pstmt.setString(16, dto.getExp_month());
			pstmt.setString(17, dto.getExp_year());

			pstmt.setString(18, dto.getId());
			
			pstmt.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {

				pstmt.close();
				con.close(); // �ъ�⑸�� 而ㅻ�μ�� ������ ���� 而ㅻ�μ���� ��怨� �ㅻⅨ ����媛� �ъ�⑺������寃��� 鍮�����.
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
			// context: ���� ������怨� ���� �� ��濡�洹몃��.
			context = new InitialContext();
			// ""寃쎈��� ���� 嫄� dataSource瑜� 援ы��湲� ���� 怨쇱��
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			// dataSource瑜� 而ㅻ�μ���� �곌껐��耳�以�.
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
