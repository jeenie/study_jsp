package lecture1.jdbc_;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class UserDAO {
	public static User createUser(ResultSet resultSet) throws SQLException {
		User user = new User();
		user.setUserid(resultSet.getString("userid"));
		user.setName(resultSet.getString("name"));
		user.setEmail(resultSet.getString("email"));
		user.setUserType(resultSet.getString("userType"));
		user.setDepartmentName(resultSet.getString("departmentName"));
		return user;
	}

	public static List<User> findAll(int currentPage, int pageSize) throws Exception {
		String sql = "SELECT u.*, d.departmentName " + "FROM user u LEFT JOIN department d ON u.departmentId = d.id "
				+ "LIMIT ?, ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, (currentPage - 1) * pageSize);
			statement.setInt(2, pageSize);
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<User> list = new ArrayList<User>();
				while (resultSet.next())
					list.add(createUser(resultSet));
				return list;
			}
		}
	}

	public static int count() throws Exception {
		String sql = "Select count(*) From user";
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery()) {
				if(resultSet.next())
					return resultSet.getInt(1);
		}
		return 0;
	}
}
