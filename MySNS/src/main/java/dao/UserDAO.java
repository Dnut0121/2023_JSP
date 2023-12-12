package dao;

import java.sql.*;
import javax.naming.NamingException;
import util.*;

public class UserDAO {

	public boolean insert(UserBean user) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			String sql = "INSERT INTO user(id, password, name, address, birth) VALUES(?, ?, ?,?,?)";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user.getId());
			stmt.setString(2, user.getPs());
			stmt.setString(3, user.getName());
			stmt.setString(4, user.getAddress());
			stmt.setString(5, user.getBirth());

			int count = stmt.executeUpdate();
			return (count == 1) ? true : false;

		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}

	public boolean exists(String uid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT id FROM user WHERE id = ?";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, uid);

			rs = stmt.executeQuery();
			return rs.next();

		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}

	public boolean delete(String id) {
		String sql = "DELETE FROM user WHERE id = ?";
		try (Connection conn = ConnectionPool.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, id);
			int affectedRows = pstmt.executeUpdate();
			return affectedRows > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public int login(String uid, String upass) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT id, password FROM user WHERE id = ?";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, uid);

			rs = stmt.executeQuery();
			if (!rs.next())
				return 1;
			if (!upass.equals(rs.getString("password")))
				return 2;

			return 0;

		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}

	// 회원정보를 수정하기 위해 기존의 정보를 표시
	public UserBean getUser(String uid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		UserBean user = null;
		try {
			String sql = "select * from user where id = ?";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, uid);

			rs = stmt.executeQuery();

			if (rs.next()) {
				user = new UserBean();
				user.setId(rs.getString("id"));
				user.setPs(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setAddress(rs.getString("address"));
				user.setBirth(rs.getString("birth"));
			}
			return user;

		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}

	// 회원의 정보수정
	public boolean update(UserBean user) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			String sql = "update user set password=?,name=?,address=?,birth=? where id=?";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user.getPs());
			stmt.setString(2, user.getName());

			stmt.setString(3, user.getAddress());
			stmt.setString(4, user.getBirth());
			stmt.setString(5, user.getId());

			int count = stmt.executeUpdate();
			return (count == 1) ? true : false;

		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}

	 
	public int getPassword(String uid, String upass) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT id, password FROM user WHERE id = ?";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, uid);

			rs = stmt.executeQuery();
			if (!rs.next())
				return 1;
			if (!upass.equals(rs.getString("password")))
				return 2;

			return 0;

		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}
}
