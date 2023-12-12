package util;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class ConnectionPool {
	private static ConnectionPool instance;
    private static DataSource _ds = null;	
    public static Connection get() throws NamingException, SQLException {
        if (_ds == null) {
            _ds = (DataSource) (new InitialContext()).lookup("java:comp/env/jdbc/mysns_1");
        }
        return _ds.getConnection();
    }
    public static ConnectionPool getInstance() {
        if (instance == null) {
            instance = new ConnectionPool();
        }
        return instance;
    }

    public Connection getConnection() throws SQLException {
        // Return a database connection
        String url = "jdbc:mysql://localhost:3306/mysns_1";
        String user = "root";
        String password = "root";
        return DriverManager.getConnection(url, user, password);
    }
}


