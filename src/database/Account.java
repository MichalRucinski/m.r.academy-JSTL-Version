package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Account {
	
	private Connection conn;
	
	public Account(Connection conn) {
		this.conn = conn;
	}
	
	public boolean login(String login, String password) throws SQLException {
		String sql = "select count(*) as count from students where login=? and password=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, login);
		stmt.setString(2, password);
		ResultSet rs = stmt.executeQuery();
		
		
		int count = 0;
		
		if(rs.next()) {
			count = rs.getInt("count");
		}
		rs.close();
		
		if(count==0)
			return false;
		else 
			return true;
	}
	
	public String getName(String login, String password) throws SQLException {
		PreparedStatement stmt = conn.prepareStatement("SELECT name FROM students WHERE login=? and password=?");
		
		stmt.setString(1, login);
		stmt.setString(2, password);
		ResultSet rs = stmt.executeQuery();
		
		String name = null;
		
		if(rs.next()) {
		name = rs.getString("name");
		}
		rs.close();
		
		return name;
	}
	
	
}
