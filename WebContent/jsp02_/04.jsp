<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		for (int i = 1; i <= 10; ++i) {
	%>
	4 *
	<%=i%>
	=
	<%=4 * i%>
	<%
		}
	%>

</body>
</html>
