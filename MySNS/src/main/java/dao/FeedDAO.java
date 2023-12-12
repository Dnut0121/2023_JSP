package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.*;

public class FeedDAO {

    public boolean insert(String uid, String ucon, String uimages) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO feed(id, content, images) VALUES(?, ?, ?)";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            stmt.setString(2, ucon);
            stmt.setString(3, uimages);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    public ArrayList<FeedObj> getList() throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT no, id, content, ts, images FROM feed ORDER BY ts DESC";

            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            ArrayList<FeedObj> feeds = new ArrayList<FeedObj>();
            while (rs.next()) {
                // 이미지가 NULL이면 0으로 대체
                String images = rs.getString("images");
                if (images == null) {
                    images = "0";
                }

                feeds.add(new FeedObj(rs.getString("no"),rs.getString("id"), rs.getString("content"), rs.getString("ts"), images));
            }
            return feeds;
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
    
    public FeedObj getFeed(int feedNo) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT no, id, content, ts, images FROM feed WHERE no = ?";

            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, feedNo);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // 이미지가 NULL이면 0으로 대체
                String images = rs.getString("images");
                if (images == null) {
                    images = "0";
                }

                return new FeedObj(rs.getString("no"),rs.getString("id"), rs.getString("content"), rs.getString("ts"), images);
            } else {
                // 해당 글이 존재하지 않을 경우
                return null;
            }
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
    public boolean deleteFeed(int feedNo) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            String sql = "DELETE FROM feed WHERE no = ?";
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, feedNo);

            int count = stmt.executeUpdate();
            return (count == 1);
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
    public boolean setContent(int feedNo, String newContent) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            String sql = "UPDATE feed SET content = ? WHERE no = ?";
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newContent);
            stmt.setInt(2, feedNo);

            int count = stmt.executeUpdate();
            return (count == 1);
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }

    // updateFeed 메서드 추가
    public boolean updateFeed(FeedObj updatedFeed) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            String sql = "UPDATE feed SET content = ?, images = ? WHERE no = ?";
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, updatedFeed.getContent());
            stmt.setString(2, updatedFeed.getImages());
            stmt.setInt(3, Integer.parseInt(updatedFeed.getNo()));

            int count = stmt.executeUpdate();
            return (count == 1);
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
    
    
}