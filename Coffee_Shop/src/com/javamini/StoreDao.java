package com.javamini;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StoreDao {
	public static final int STORE_NONEXISTENT=0;
	public static final int STORE_EXISTENT=1;
	public static final int STORE_JOIN_FAIL=0;
	public static final int STORE_JOIN_SUCCESS=1;
	
	private static StoreDao storeInstance = new StoreDao();
	
	private StoreDao() {
	
	}
	public static StoreDao getInstance() {
		return storeInstance;
	}
	
	public int insertStore(StoreDto dto) {
		int ri=0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into store values(?,?,?,?)";
		
		try {
			connection=getConnection();
			pstmt=connection.prepareStatement(query);
			pstmt.setString(1, dto.getStoreId());
			pstmt.setString(2, dto.getStoreName());
			pstmt.setString(3, dto.getStoreAddress());
			pstmt.setString(4, dto.getStorePhone());
			
			ri =pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(connection != null)
					connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return ri;
	}
	
	public int confirmId(String id) {
		int ri=0;
		
		Connection connection = getConnection();
		PreparedStatement pstmt=null;
		ResultSet set=null;
		String query="select storeId from store where storeId=?";
		
		try {
			pstmt=connection.prepareStatement(query);
			pstmt.setString(1, id);
			set=pstmt.executeQuery();
			if(set.next()) {
				ri=StoreDao.STORE_EXISTENT;
			}else {
				ri=StoreDao.STORE_NONEXISTENT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return ri;//
		
	}
	
	
	public StoreDto getStore(String id) {
		
		Connection connection=getConnection();
		ResultSet rs = null;
		String query = "select * from store where storeId='"+id+"'";
		Statement stmt=null;
		StoreDto dto = null;
		
		
		try {
			stmt=connection.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				dto = new StoreDto();
				dto.setStoreId(id);
				dto.setStoreName(rs.getString("storeName"));
				dto.setStoreAddress(rs.getString("storeAddress"));
		 		dto.setStorePhone(rs.getString("storePhone"));
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stmt.close();
				connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
public ArrayList<StoreDto> getStoreByName(String storeName) {
		ArrayList<StoreDto> dtos= new ArrayList<StoreDto>();
		
		Connection connection=getConnection();
		ResultSet rs = null;
		String query = "select * from store where storeName like '%"+storeName+"%'";
		Statement stmt=null;
		StoreDto dto = null;
		
		
		try {
			stmt=connection.createStatement();
			rs = stmt.executeQuery(query);
			dto = new StoreDto();
			while(rs.next()) {
				dto.setStoreId(rs.getString("storeId"));
				dto.setStoreName(rs.getString("storeName"));
				dto.setStoreAddress(rs.getString("storeAddress"));
		 		dto.setStorePhone(rs.getString("storePhone"));
		 		
		 		dtos.add(dto);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stmt.close();
				connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}
	
	
	
public ArrayList<StoreDto> getTotalStore() {
		ArrayList<StoreDto> dtos= new ArrayList<StoreDto>();
	
		Connection connection=getConnection();
		ResultSet rs = null;
		String query = "select * from store";
		query += " order by storeid";
		Statement stmt=null;
		StoreDto dto = null;
		
		
		try {
			stmt=connection.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				dto = new StoreDto();
				dto.setStoreId(rs.getString("storeId"));
				dto.setStoreName(rs.getString("storeName"));
				dto.setStoreAddress(rs.getString("storeAddress"));
		 		dto.setStorePhone(rs.getString("storePhone"));
		 		
		 		dtos.add(dto);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stmt.close();
				connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}
	
	public int updateStore(StoreDto dto) {
		int ri=0;
		
		Connection connection = getConnection();
		PreparedStatement pstmt= null;
		String query = "update store set storeName=?,storeAddress=?,storePhone=? where storeId=?";
		
		try {
			pstmt=connection.prepareStatement(query);
			pstmt.setString(1, dto.getStoreName());
			pstmt.setString(2, dto.getStoreAddress());
			pstmt.setString(3, dto.getStorePhone());
			pstmt.setString(4, dto.getStoreId());
			
			ri=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return ri;
	}
	
	public int deleteStore(String id) {
		int ri=0;
		
		Connection connection = getConnection();
		PreparedStatement pstmt= null;
		String query = "delete store where storeId=?";
		
		try {
			pstmt=connection.prepareStatement(query);
			pstmt.setString(1, id);
			
			ri=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return ri;
	}
	
	public String createStoreId() {
		ArrayList<String> storeIds = new ArrayList<String>();
		
		Connection connection=getConnection();
		ResultSet rs = null;
		String query = "select storeid from store";
		query += " order by storeid";
		Statement stmt=null;
		int lastNumber=0;
		
		try {
			stmt=connection.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
		 		
		 		storeIds.add(rs.getString("storeId"));
			}
			String lastStoreId = storeIds.get(storeIds.size()-1).substring(5);
			lastNumber = Integer.parseInt(lastStoreId);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stmt.close();
				connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return "store"+(lastNumber+1);
	}
	
	
	
	private Connection getConnection() {
		Connection connection =null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}

