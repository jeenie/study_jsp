package jdbc.user4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class UserDAO {
	public static List<User> findAll(int currentPage, int pageSize) throws Exception {
		String sql = "SELECT u.*, d.departmentName" + " FROM user u LEFT JOIN department d ON u.departmentId = d.id"
				+ " LIMIT ?, ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, (currentPage - 1) * pageSize);
			statement.setInt(2, pageSize);
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<User> list = new ArrayList<User>();
				while (resultSet.next()) {
					User user = new User();
					user.setId(resultSet.getInt("id"));
					user.setUserid(resultSet.getString("userid"));
					user.setName(resultSet.getString("name"));
					user.setEmail(resultSet.getString("email"));
					user.setDepartmentId(resultSet.getInt("departmentId"));
					user.setDepartmentName(resultSet.getString("departmentName"));
					user.setEnabled(resultSet.getBoolean("enabled"));
					user.setUserType(resultSet.getString("userType"));
					list.add(user);
				}
				return list;
			}
		}
	}

	public static int count() throws Exception {
		String sql = "SELECT COUNT(*) FROM user";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			if (resultSet.next())
				return resultSet.getInt(1);
		}
		return 0;
	}

	public static User findOne(int id) throws Exception {
		String sql = "SELECT * FROM user WHERE id=?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					User user = new User();
					user.setId(resultSet.getInt("id"));
					user.setUserid(resultSet.getString("userid"));
					user.setName(resultSet.getString("name"));
					user.setEmail(resultSet.getString("email"));
					user.setDepartmentId(resultSet.getInt("departmentId"));
					user.setEnabled(resultSet.getBoolean("enabled"));
					user.setUserType(resultSet.getString("userType"));
					return user;
				}
			}
			return null;
		}
	}

	public static void update(User user) throws Exception {
		String sql = "UPDATE user SET userid=?, name=?, email=?, departmentId=?, enabled=?, userType=?" + " WHERE id = ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, user.getUserid());
			statement.setString(2, user.getName());
			statement.setString(3, user.getEmail());
			statement.setInt(4, user.getDepartmentId());
			statement.setBoolean(5, user.isEnabled());
			statement.setString(6, user.getUserType());
			statement.setInt(7, user.getId());
			statement.executeUpdate();
		}
	}

	public static void insert(User student) throws Exception {
		String sql = "INSERT user (userid, password, name, email, departmentId, enabled, userType)" + " VALUES (?, ?, ?, ?, ?, ?, ?)";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, student.getUserid());
			statement.setString(2, student.getPassword());
			statement.setString(3, student.getName());
			statement.setString(4, student.getEmail());
			statement.setInt(5, student.getDepartmentId());
			statement.setBoolean(6, student.isEnabled());
			statement.setString(7, student.getUserType());
			statement.executeUpdate();
		}
	}

	public static void delete(int id) throws Exception {
		String sql = "DELETE FROM user WHERE id = ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			statement.executeUpdate();
		}
	}
}