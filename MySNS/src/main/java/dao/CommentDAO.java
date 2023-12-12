// CommentDAO.java

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import util.ConnectionPool;

public class CommentDAO {

    public boolean insert(int feedNo, String userId, String content) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            String sql = "INSERT INTO Comment(feed_no, user_id, content) VALUES (?, ?, ?)";

            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, feedNo);
            stmt.setString(2, userId);
            stmt.setString(3, content);

            int count = stmt.executeUpdate();
            return (count == 1);
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }

    public ArrayList<CommentObj> getCommentsForFeed(int feedNo) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM Comment WHERE feed_no = ? ORDER BY ts DESC";
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, feedNo);
            rs = stmt.executeQuery();

            ArrayList<CommentObj> comments = new ArrayList<>();
            while (rs.next()) {
                comments.add(new CommentObj(
                        rs.getInt("comment_id"),
                        rs.getInt("feed_no"),
                        rs.getString("user_id"),
                        rs.getString("content"),
                        rs.getTimestamp("ts")
                ));
            }
            return comments;
        } finally {
            // 리소스 해제
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
    public boolean deleteComment(int commentId) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            String sql = "DELETE FROM Comment WHERE comment_id = ?";
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, commentId);

            int count = stmt.executeUpdate();
            return count == 1;
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public boolean updateComment(int commentId, String updatedContent) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            String sql = "UPDATE Comment SET content = ? WHERE comment_id = ?";
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, updatedContent);
            stmt.setInt(2, commentId);

            int count = stmt.executeUpdate();
            return count == 1;
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}
