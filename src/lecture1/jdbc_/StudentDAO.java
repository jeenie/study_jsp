package lecture1.jdbc_;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class StudentDAO {
	public static Student createStudent(ResultSet resultSet) throws SQLException {
		Student student = new Student();
		student.setId(resultSet.getInt("id"));
		student.setStudentNumber(resultSet.getString("studentNumber"));
		student.setName(resultSet.getString("name"));
		student.setDepartmentId(resultSet.getInt("departmentId"));
		student.setYear(resultSet.getInt("year"));
		student.setDepartmentName(resultSet.getString("departmentName"));
		return student;
	}

	public static List<Student> findAll() throws Exception {
		String sql = "SELECT s.*, d.departmentName " + "FROM student s LEFT JOIN department d ON s.departmentId = d.id";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			ArrayList<Student> list = new ArrayList<Student>();
			while (resultSet.next())
				list.add(createStudent(resultSet));
			return list;
		}
	}

	public static List<Student> findByYear(int year) throws Exception {
		String sql = "SELECT s.*, d.departmentName " + "From student s LEFT JOIN department d On s.departmentId = d.id "
				+ "Where year = ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, year);
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<Student> list = new ArrayList<Student>();
				while (resultSet.next())
					list.add(createStudent(resultSet));
				return list;
			}
		}
	}
}
