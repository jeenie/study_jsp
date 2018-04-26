package lecture1.jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class UserDAO {
	public static List<User> findAll() throws Exception {
		String sql = "SELECT u.userid, u.name, u.email, d.departmentName, u.userType " + "FROM user u LEFT JOIN department d ON u.departmentId = d.id";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			ArrayList<User> list = new ArrayList<User>();
			while (resultSet.next()) {
				User user = new User();
				user.setUserid(resultSet.getString("userid"));
				user.setName(resultSet.getString("name"));
				user.setEmail(resultSet.getString("email"));
				user.setUserType(resultSet.getString("userType"));
				user.setDepartmentName(resultSet.getString("departmentName"));
				list.add(user);
			}
			return list;
		}
	}
}
