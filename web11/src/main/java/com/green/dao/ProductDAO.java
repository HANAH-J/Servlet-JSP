package com.green.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.green.vo.ProductVO;

public class ProductDAO {
	private ProductDAO() {}
	private static ProductDAO dao = new ProductDAO();
	public static ProductDAO getInstance() {
		return dao;
	}
	
// --------------------------------------------------
	// 연결 객체를 얻어오기 위한 메서드
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// 연결 해제를 하기 위한 메서드
	// 1) SELECT를 위한 해제 메서드
	private void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 2) INSERT, UPDATE, DELETE를 위한 해제 메서드
	private void close(Connection conn, PreparedStatement psmt) {
		try {
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	// 전체 데이터를 읽어오는 메서드
	public List<ProductVO> selectAllProducts() {
		List<ProductVO> lists = new ArrayList<>(); 
		
		String sql = "SELECT * FROM productTbl ORDER BY code DESC";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ProductVO pVo = new ProductVO();
				
				pVo.setCode(rs.getInt("code"));
				pVo.setName(rs.getString("name"));
				pVo.setPrice(rs.getInt("price"));
				pVo.setPictureurl(rs.getString("pictureurl"));
				pVo.setDescription(rs.getString("description"));
				
				lists.add(pVo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, stmt, rs);
		}
		return lists;
	}

	// 상품 정보를 등록하는 메서드
	public void insertProduct(ProductVO product) {
		String sql = "INSERT INTO productTbl VALUES(product_seq.nextval, ?, ?, ? ,?)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, product.getName());
			psmt.setInt(2, product.getPrice());
			psmt.setString(3, product.getPictureurl());
			psmt.setString(4, product.getDescription());
			
			psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, psmt);
		}
	}

	// 상품을 삭제하는 기능을 담당하는 메서드
	public void deleteProduct(int code) {
		String sql = "DELETE FROM productTbl WHERE code = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, code);
			
			psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, psmt);
		}
	}

	// 상품 정보를 보기 위한 메서드
	public ProductVO selectProductByCode(int code) {
		ProductVO product = null;
		
		String sql = "SELECT * FROM productTbl WHERE code = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, code);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				product = new ProductVO();
				
				product.setCode(code);
				product.setName(rs.getString("name"));
				product.setPrice(rs.getInt("price"));
				product.setPictureurl(rs.getString("pictureurl"));
				product.setDescription(rs.getString("description"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, psmt, rs);
		}
		return product;
	}

	// 상품 정보를 갱신하는 기능을 담당하는 메서드
	public void updateProduct(ProductVO product) {
		String sql = "UPDATE productTbl SET name = ?, price = ?, pictureurl = ?, description = ? WHERE code = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, product.getName());
			psmt.setInt(2, product.getPrice());
			psmt.setString(3, product.getPictureurl());
			psmt.setString(4, product.getDescription());
			psmt.setInt(5, product.getCode());
			
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, psmt);
		}
	}
}