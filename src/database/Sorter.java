package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Sorter {
	private Connection conn;
	
	public Sorter(Connection conn) {
		this.conn = conn;
	}
	
	public ArrayList<Student> getList(ArrayList<String> instrumentsList) throws SQLException{
		
		String sqlEnding = "";
		if(instrumentsList.size()>0) {
			sqlEnding = " and (";
		for(int ii=1; ii<=instrumentsList.size(); ii++) {
			if(ii==instrumentsList.size())
				sqlEnding = sqlEnding + "class=?";
			else
				sqlEnding = sqlEnding + "class=? or ";
			}
		sqlEnding = sqlEnding + ")";
		}
		String sql = "select name, surname, class, points, login from students where login!=?" + sqlEnding;
		String myLogin = "Lothav";
			PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, myLogin);
		for(int i=2; i<2+instrumentsList.size(); i++) {
			stmt.setString(i, instrumentsList.get(i-2));
		}
		ResultSet rs = stmt.executeQuery();
		ArrayList<Student> studentList = new ArrayList<Student>();
		String name = "";
		String surname = "";
		String studentsClass = "";
		String login = "";
		int points = 0;
		int level = 0;
		
		while(rs.next()) {
			name = rs.getString("name");
			surname = rs.getString("surname");
			surname = surname.length()>0 ? (surname.substring(0, 1) + ".") : "";
			login = rs.getString("login");
			studentsClass = rs.getString("class");
			points = rs.getInt("points");
			studentList.add(new Student(name, surname, login, studentsClass, points));
		}
		
		Collections.sort(studentList, new PointsComparator());
		
		return studentList;
	}

	private int calculateLevel(int points) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public class PointsComparator implements Comparator<Student>{

		@Override
		public int compare(Student student1, Student student2) {
			
			if(student1.getPoints() > student2.getPoints())
				return -1;
			if(student1.getPoints() < student2.getPoints())
				return 1;
			
			return 0;
		}
	}
	
	public Student getStudent(String login) throws SQLException {
		
		PreparedStatement stmt = conn.prepareStatement("SELECT * FROM students WHERE login=?");
		
		stmt.setString(1, login);
		ResultSet rs = stmt.executeQuery();
		
		String name = "";
		String surname = "";
		int points = 0;
		String text = "";
		String instrument = "";
		
		if(rs.next()) {
		name = rs.getString("name");
		surname = rs.getString("surname");
		text = rs.getString("text");
		instrument = rs.getString("class");
		points = rs.getInt("points");
		login = rs.getString("login");
		}
		rs.close();
		
		Student student = new Student(name, surname, login, instrument, points);
		student.setText(text);
		
		return student;
	}
	
	public void setText(String login, String text) throws SQLException {
	
		PreparedStatement stmt = conn.prepareStatement("UPDATE students SET text=? WHERE login=?");
		
		stmt.setString(1, text);
		stmt.setString(2, login);
		stmt.executeUpdate();
	}
	
	public void addPoints(String addPoints, String login) throws SQLException {
		
		PreparedStatement stmt = conn.prepareStatement("UPDATE students SET points=points+? WHERE login=?");
		
		stmt.setString(1, addPoints);
		stmt.setString(2, login);
		stmt.executeUpdate();
	}
	
	public void takePoints(String takePoints, String login) throws SQLException {
		
		PreparedStatement stmt = conn.prepareStatement("UPDATE students SET points=points-? WHERE login=?");
		
		stmt.setString(1, takePoints);
		stmt.setString(2, login);
		
		stmt.executeUpdate();
	}
	
	
}



