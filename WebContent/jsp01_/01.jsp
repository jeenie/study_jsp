<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String s1 = "hello";
		String s2 = "world";
		
		out.println(s1);
		
		out.println(s2);

		out.println(s1 + s2);

		out.println("s1");

		out.println("s2");

		out.println("s1" + "s2");

		out.println("s1 + s2");

		%>

	<%= s1 %>

	<%= s2 %>

	<%= s1 + s2 %>

	<%= "s1" %>

	<%= "s2" %>

	<%= "s1" + "s2" %>

	<%= "s1 + s2" %>

</body>
</html>